module main;

import std.range;
import std.array;
import std.algorithm;
import std.string;
import std.stdio;
import std.format;
import std.conv;
import std.path;
import std.file;
import std.logger;
import std.datetime;
import std.datetime.stopwatch : AutoStart, StopWatch;

import git2;

extern (C) int reportProgress(scope const ref git_indexer_progress stats, void* payload) @safe
{
    // tracef("Progress: %s", stats);
    // infof("Total: %d, Fetched: %d, Deltas: %d, Indexed: %d",
    //         stats.total_objects, stats.received_objects, stats.indexed_deltas,
    //         stats.indexed_objects);
    return 0;
}

auto lastError() @trusted
{
    return git_error_last().message.fromStringz();
}

void main(string[] args) @safe
{
    if (args.length < 4)
    {
        infof("Usage: single-commit-clone <url> <ref/commit/tag> <path>");
        return;
    }

    auto url = args[1];
    auto commit = args[2];
    auto path = args[3];

    if (path.exists())
    {
        path.rmdirRecurse();
        path.mkdirRecurse();
    }

    if (git_libgit2_init() < 0)
    {
        fatalf("Failed to init libgit2: %s", lastError());
    }
    scope(exit) assert(git_libgit2_shutdown() == 0);

    scope git_repository* repo;
    scope(exit) repo.git_repository_free();
    scope git_remote* remote;
    scope(exit) remote.git_remote_free();

    git_fetch_options fetch_opts;
    fetch_opts.git_fetch_options_init(GIT_FETCH_OPTIONS_VERSION);
    fetch_opts.callbacks.transfer_progress = &reportProgress;
    fetch_opts.depth = 1;

    if (repo.git_repository_init(path.toStringz(), false))
    {
        fatalf("Failed to init repository: %s", lastError());
    }

    if (remote.git_remote_create(repo, "origin", url.toStringz()))
    {
        fatalf("Failed to create remote: %s", lastError());
    }

    const(git_strarray) refspecs = {[commit.toStringz()], 1};

    auto sw = StopWatch(AutoStart.yes);
    if (remote.git_remote_fetch(refspecs, fetch_opts, null))
    {
        fatalf("Failed to fetch remote: %s", lastError());
    }
    sw.stop();
    infof("Fetching took %s", sw.peek());

    infof("is_shallow: %s", to!bool(repo.git_repository_is_shallow()));

    scope git_object* treeish;
    scope(exit) treeish.git_object_free();
    if (treeish.git_revparse_single(repo, "FETCH_HEAD".toStringz()))
    {
        fatalf("Failed to rev-parse FETCH_HEAD: %s", lastError());
    }

    git_checkout_options checkout_opts;
    checkout_opts.git_checkout_options_init(GIT_CHECKOUT_OPTIONS_VERSION);
    checkout_opts.checkout_strategy = GIT_CHECKOUT_FORCE;
    
    if (repo.git_reset(treeish, GIT_RESET_HARD, checkout_opts))
    {
        fatalf("Failed to reset to FETCH_HEAD: %s", lastError());
    }
}
