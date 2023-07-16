/**
 * This file contains overloaded functions that serves to make using libgit2
 * easier. Most (if not all) of them are still extern(C) as they only differ
 * from their original functions solely because of annotated parameters or
 * default parameters.
 */
module git2.extra;

import git2.bindings;

extern(C):

@safe:
@nogc:

int git_remote_fetch (
    scope git_remote* remote,
    scope const ref git_strarray refspecs,
    scope const(git_fetch_options)* opts = null,
    const(char)* reflog_message = null);

int git_remote_fetch (
    scope git_remote* remote,
    scope const(git_strarray)* refspecs,
    scope const ref git_fetch_options opts,
    const(char)* reflog_message = null);

int git_remote_fetch (
    scope git_remote* remote,
    scope const(git_strarray)* refspecs = null,
    scope const(git_fetch_options)* opts = null,
    const(char)* reflog_message = null);

int git_repository_init_ext (
    scope out git_repository* out_,
    const(char)* repo_path,
    scope const(git_repository_init_options)* opts = null);

int git_clone (
    scope out git_repository* out_,
    const(char)* url,
    const(char)* local_path,
    scope const(git_clone_options)* options = null);
