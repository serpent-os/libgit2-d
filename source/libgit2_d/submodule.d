/*
 * Copyright (C) the libgit2 contributors. All rights reserved.
 *
 * This file is part of libgit2, distributed under the GNU GPL v2 with
 * a Linking Exception. For full terms see the included COPYING file.
 */
module libgit2_d.submodule;


private static import libgit2_d.buffer;
private static import libgit2_d.checkout;
private static import libgit2_d.oid;
private static import libgit2_d.remote;
private static import libgit2_d.types;
private static import std.traits;

/**
 * @file git2/submodule.h
 * @brief Git submodule management utilities
 *
 * Submodule support in libgit2 builds a list of known submodules and keeps
 * it in the repository.  The list is built from the .gitmodules file, the
 * .git/config file, the index, and the HEAD tree.  Items in the working
 * directory that look like submodules (i.e. a git repo) but are not
 * mentioned in those places won't be tracked.
 *
 * @defgroup git_submodule Git submodule management routines
 * @ingroup Git
 * @{
 */
extern (C):
nothrow @nogc:
public:

/**
 * Return codes for submodule status.
 *
 * A combination of these flags will be returned to describe the status of a
 * submodule.  Depending on the "ignore" property of the submodule, some of
 * the flags may never be returned because they indicate changes that are
 * supposed to be ignored.
 *
 * Submodule info is contained in 4 places: the HEAD tree, the index, config
 * files (both .git/config and .gitmodules), and the working directory.  Any
 * or all of those places might be missing information about the submodule
 * depending on what state the repo is in.  We consider all four places to
 * build the combination of status flags.
 *
 * There are four values that are not really status, but give basic info
 * about what sources of submodule data are available.  These will be
 * returned even if ignore is set to "ALL".
 *
 * * IN_HEAD   - superproject head contains submodule
 * * IN_INDEX  - superproject index contains submodule
 * * IN_CONFIG - superproject gitmodules has submodule
 * * IN_WD     - superproject workdir has submodule
 *
 * The following values will be returned so long as ignore is not "ALL".
 *
 * * INDEX_ADDED       - in index, not in head
 * * INDEX_DELETED     - in head, not in index
 * * INDEX_MODIFIED    - index and head don't match
 * * WD_UNINITIALIZED  - workdir contains empty directory
 * * WD_ADDED          - in workdir, not index
 * * WD_DELETED        - in index, not workdir
 * * WD_MODIFIED       - index and workdir head don't match
 *
 * The following can only be returned if ignore is "NONE" or "UNTRACKED".
 *
 * * WD_INDEX_MODIFIED - submodule workdir index is dirty
 * * WD_WD_MODIFIED    - submodule workdir has modified files
 *
 * Lastly, the following will only be returned for ignore "NONE".
 *
 * * WD_UNTRACKED      - wd contains untracked files
 */
enum git_submodule_status_t
{
	GIT_SUBMODULE_STATUS_IN_HEAD = 1u << 0,
	GIT_SUBMODULE_STATUS_IN_INDEX = 1u << 1,
	GIT_SUBMODULE_STATUS_IN_CONFIG = 1u << 2,
	GIT_SUBMODULE_STATUS_IN_WD = 1u << 3,
	GIT_SUBMODULE_STATUS_INDEX_ADDED = 1u << 4,
	GIT_SUBMODULE_STATUS_INDEX_DELETED = 1u << 5,
	GIT_SUBMODULE_STATUS_INDEX_MODIFIED = 1u << 6,
	GIT_SUBMODULE_STATUS_WD_UNINITIALIZED = 1u << 7,
	GIT_SUBMODULE_STATUS_WD_ADDED = 1u << 8,
	GIT_SUBMODULE_STATUS_WD_DELETED = 1u << 9,
	GIT_SUBMODULE_STATUS_WD_MODIFIED = 1u << 10,
	GIT_SUBMODULE_STATUS_WD_INDEX_MODIFIED = 1u << 11,
	GIT_SUBMODULE_STATUS_WD_WD_MODIFIED = 1u << 12,
	GIT_SUBMODULE_STATUS_WD_UNTRACKED = 1u << 13,
}

enum GIT_SUBMODULE_STATUS__IN_FLAGS = 0x000Fu;
enum GIT_SUBMODULE_STATUS__INDEX_FLAGS = 0x0070u;
enum GIT_SUBMODULE_STATUS__WD_FLAGS = 0x3F80u;

pragma(inline, true)
pure nothrow @safe @nogc
bool GIT_SUBMODULE_STATUS_IS_UNMODIFIED(T)(S)
	if (std.traits.isIntegral!(T))

	do
	{
		return (S & ~.GIT_SUBMODULE_STATUS__IN_FLAGS) == 0;
	}

pragma(inline, true)
pure nothrow @safe @nogc
bool GIT_SUBMODULE_STATUS_IS_INDEX_UNMODIFIED(T)(S)
	if (std.traits.isIntegral!(T))

	do
	{
		return (S & .GIT_SUBMODULE_STATUS__INDEX_FLAGS) == 0;
	}

pragma(inline, true)
pure nothrow @safe @nogc
bool GIT_SUBMODULE_STATUS_IS_WD_UNMODIFIED(T)(S)
	if (std.traits.isIntegral!(T))

	do
	{
		return (S & (.GIT_SUBMODULE_STATUS__WD_FLAGS & ~.git_submodule_status_t.GIT_SUBMODULE_STATUS_WD_UNINITIALIZED)) == 0;
	}

pragma(inline, true)
pure nothrow @safe @nogc
bool GIT_SUBMODULE_STATUS_IS_WD_DIRTY(T)(S)
	if (std.traits.isIntegral!(T))

	do
	{
		return (S & (.git_submodule_status_t.GIT_SUBMODULE_STATUS_WD_INDEX_MODIFIED | .git_submodule_status_t.GIT_SUBMODULE_STATUS_WD_WD_MODIFIED | .git_submodule_status_t.GIT_SUBMODULE_STATUS_WD_UNTRACKED)) != 0;
	}

/**
 * Function pointer to receive each submodule
 *
 * Params:
 *      sm = git_submodule currently being visited
 *      name = name of the submodule
 *      payload = value you passed to the foreach function as payload
 *
 * Returns: 0 on success or error code
 */
alias git_submodule_cb = int function(libgit2_d.types.git_submodule* sm, const (char)* name, void* payload);

/**
 * Submodule update options structure
 *
 * Initialize with `GIT_SUBMODULE_UPDATE_OPTIONS_INIT`. Alternatively, you can
 * use `git_submodule_update_options_init`.
 */
struct git_submodule_update_options
{
	uint version_;

	/**
	 * These options are passed to the checkout step. To disable
	 * checkout, set the `checkout_strategy` to
	 * `git_checkout_strategy_t.GIT_CHECKOUT_NONE`. Generally you will want the use
	 * git_checkout_strategy_t.GIT_CHECKOUT_SAFE to update files in the working
	 * directory.
	 */
	libgit2_d.checkout.git_checkout_options checkout_opts;

	/**
	 * Options which control the fetch, including callbacks.
	 *
	 * The callbacks to use for reporting fetch progress, and for acquiring
	 * credentials in the event they are needed.
	 */
	libgit2_d.remote.git_fetch_options fetch_opts;

	/**
	 * Allow fetching from the submodule's default remote if the target
	 * commit isn't found. Enabled by default.
	 */
	int allow_fetch;
}

enum GIT_SUBMODULE_UPDATE_OPTIONS_VERSION = 1;

pragma(inline, true)
pure nothrow @safe @nogc
.git_submodule_update_options GIT_SUBMODULE_UPDATE_OPTIONS_INIT()

	do
	{
		libgit2_d.checkout.git_checkout_options CHECKOUT_OPTION =
		{
			version_: libgit2_d.checkout.GIT_CHECKOUT_OPTIONS_VERSION,
			checkout_strategy: libgit2_d.checkout.git_checkout_strategy_t.GIT_CHECKOUT_SAFE,
		};

		.git_submodule_update_options OUTPUT =
		{
			version_: .GIT_SUBMODULE_UPDATE_OPTIONS_VERSION,
			checkout_opts: CHECKOUT_OPTION,
			fetch_opts: libgit2_d.remote.GIT_FETCH_OPTIONS_INIT(),
			allow_fetch: 1,
		};

		return OUTPUT;
	}

/**
 * Initialize git_submodule_update_options structure
 *
 * Initializes a `git_submodule_update_options` with default values. Equivalent to
 * creating an instance with `GIT_SUBMODULE_UPDATE_OPTIONS_INIT`.
 *
 * Params:
 *      opts = The `git_submodule_update_options` struct to initialize.
 *      version = The struct version; pass `GIT_SUBMODULE_UPDATE_OPTIONS_VERSION`.
 *
 * Returns: Zero on success; -1 on failure.
 */
//GIT_EXTERN
int git_submodule_update_options_init(.git_submodule_update_options* opts, uint version_);

/**
 * Update a submodule. This will clone a missing submodule and
 * checkout the subrepository to the commit specified in the index of
 * the containing repository. If the submodule repository doesn't contain
 * the target commit (e.g. because fetchRecurseSubmodules isn't set), then
 * the submodule is fetched using the fetch options supplied in options.
 *
 * Params:
 *      submodule = Submodule object
 *      init = If the submodule is not initialized, setting this flag to true will initialize the submodule before updating. Otherwise, this will return an error if attempting to update an uninitialzed repository. but setting this to true forces them to be updated.
 *      options = configuration options for the update.  If null, the function works as though GIT_SUBMODULE_UPDATE_OPTIONS_INIT was passed.
 *
 * Returns: 0 on success, any non-zero return value from a callback function, or a negative value to indicate an error (use `git_error_last` for a detailed error message).
 */
//GIT_EXTERN
int git_submodule_update(libgit2_d.types.git_submodule* submodule, int init, .git_submodule_update_options* options);

/**
 * Lookup submodule information by name or path.
 *
 * Given either the submodule name or path (they are usually the same), this
 * returns a structure describing the submodule.
 *
 * There are two expected error scenarios:
 *
 * - The submodule is not mentioned in the HEAD, the index, and the config,
 *   but does "exist" in the working directory (i.e. there is a subdirectory
 *   that appears to be a Git repository).  In this case, this function
 *   returns git_error_code.GIT_EEXISTS to indicate a sub-repository exists but not in a
 *   state where a git_submodule can be instantiated.
 * - The submodule is not mentioned in the HEAD, index, or config and the
 *   working directory doesn't contain a value git repo at that path.
 *   There may or may not be anything else at that path, but nothing that
 *   looks like a submodule.  In this case, this returns git_error_code.GIT_ENOTFOUND.
 *
 * You must call `git_submodule_free` when done with the submodule.
 *
 * Params:
 *      out_ = Output ptr to submodule; pass null to just get return code
 *      repo = The parent repository
 *      name = The name of or path to the submodule; trailing slashes okay
 *
 * Returns: 0 on success, git_error_code.GIT_ENOTFOUND if submodule does not exist, git_error_code.GIT_EEXISTS if a repository is found in working directory only, -1 on other errors.
 */
//GIT_EXTERN
int git_submodule_lookup(libgit2_d.types.git_submodule** out_, libgit2_d.types.git_repository* repo, const (char)* name);

/**
 * Release a submodule
 *
 * Params:
 *      submodule = Submodule object
 */
//GIT_EXTERN
void git_submodule_free(libgit2_d.types.git_submodule* submodule);

/**
 * Iterate over all tracked submodules of a repository.
 *
 * See the note on `git_submodule` above.  This iterates over the tracked
 * submodules as described therein.
 *
 * If you are concerned about items in the working directory that look like
 * submodules but are not tracked, the diff API will generate a diff record
 * for workdir items that look like submodules but are not tracked, showing
 * them as added in the workdir.  Also, the status API will treat the entire
 * subdirectory of a contained git repo as a single git_status_t.GIT_STATUS_WT_NEW item.
 *
 * Params:
 *      repo = The repository
 *      callback = Function to be called with the name of each submodule. Return a non-zero value to terminate the iteration.
 *      payload = Extra data to pass to callback
 *
 * Returns: 0 on success, -1 on error, or non-zero return value of callback
 */
//GIT_EXTERN
int git_submodule_foreach(libgit2_d.types.git_repository* repo, .git_submodule_cb callback, void* payload);

/**
 * Set up a new git submodule for checkout.
 *
 * This does "git submodule add" up to the fetch and checkout of the
 * submodule contents.  It preps a new submodule, creates an entry in
 * .gitmodules and creates an empty initialized repository either at the
 * given path in the working directory or in .git/modules with a gitlink
 * from the working directory to the new repo.
 *
 * To fully emulate "git submodule add" call this function, then open the
 * submodule repo and perform the clone step as needed (if you don't need
 * anything custom see `git_submodule_add_clone()`). Lastly, call
 * `git_submodule_add_finalize()` to wrap up adding the new submodule and
 * .gitmodules to the index to be ready to commit.
 *
 * You must call `git_submodule_free` on the submodule object when done.
 *
 * Params:
 *      out_ = The newly created submodule ready to open for clone
 *      repo = The repository in which you want to create the submodule
 *      url = URL for the submodule's remote
 *      path = Path at which the submodule should be created
 *      use_gitlink = Should workdir contain a gitlink to the repo in .git/modules vs. repo directly in workdir.
 *
 * Returns: 0 on success, git_error_code.GIT_EEXISTS if submodule already exists, -1 on other errors.
 */
//GIT_EXTERN
int git_submodule_add_setup(libgit2_d.types.git_submodule** out_, libgit2_d.types.git_repository* repo, const (char)* url, const (char)* path, int use_gitlink);

/**
 * Perform the clone step for a newly created submodule.
 *
 * This performs the necessary `git_clone` to setup a newly-created submodule.
 *
 * Params:
 *      out_ = The newly created repository object. Optional.
 *      submodule = The submodule currently waiting for its clone.
 *      opts = The options to use.
 *
 * Returns: 0 on success, -1 on other errors (see git_clone).
 */
//GIT_EXTERN
int git_submodule_clone(libgit2_d.types.git_repository** out_, libgit2_d.types.git_submodule* submodule, const (.git_submodule_update_options)* opts);

/**
 * Resolve the setup of a new git submodule.
 *
 * This should be called on a submodule once you have called add setup
 * and done the clone of the submodule.  This adds the .gitmodules file
 * and the newly cloned submodule to the index to be ready to be committed
 * (but doesn't actually do the commit).
 *
 * Params:
 *      submodule = The submodule to finish adding.
 */
//GIT_EXTERN
int git_submodule_add_finalize(libgit2_d.types.git_submodule* submodule);

/**
 * Add current submodule HEAD commit to index of superproject.
 *
 * Params:
 *      submodule = The submodule to add to the index
 *      write_index = Boolean if this should immediately write the index file.  If you pass this as false, you will have to get the git_index and explicitly call `git_index_write()` on it to save the change.
 *
 * Returns: 0 on success, <0 on failure
 */
//GIT_EXTERN
int git_submodule_add_to_index(libgit2_d.types.git_submodule* submodule, int write_index);

/**
 * Get the containing repository for a submodule.
 *
 * This returns a pointer to the repository that contains the submodule.
 * This is a just a reference to the repository that was passed to the
 * original `git_submodule_lookup()` call, so if that repository has been
 * freed, then this may be a dangling reference.
 *
 * Params:
 *      submodule = Pointer to submodule object
 *
 * Returns: Pointer to `libgit2_d.types.git_repository`
 */
//GIT_EXTERN
libgit2_d.types.git_repository* git_submodule_owner(libgit2_d.types.git_submodule* submodule);

/**
 * Get the name of submodule.
 *
 * Params:
 *      submodule = Pointer to submodule object
 *
 * Returns: Pointer to the submodule name
 */
//GIT_EXTERN
const (char)* git_submodule_name(libgit2_d.types.git_submodule* submodule);

/**
 * Get the path to the submodule.
 *
 * The path is almost always the same as the submodule name, but the
 * two are actually not required to match.
 *
 * Params:
 *      submodule = Pointer to submodule object
 *
 * Returns: Pointer to the submodule path
 */
//GIT_EXTERN
const (char)* git_submodule_path(libgit2_d.types.git_submodule* submodule);

/**
 * Get the URL for the submodule.
 *
 * Params:
 *      submodule = Pointer to submodule object
 *
 * Returns: Pointer to the submodule url
 */
//GIT_EXTERN
const (char)* git_submodule_url(libgit2_d.types.git_submodule* submodule);

/**
 * Resolve a submodule url relative to the given repository.
 *
 * Params:
 *      out_ = buffer to store the absolute submodule url in
 *      repo = Pointer to repository object
 *      url = Relative url
 *
 * Returns: 0 or an error code
 */
//GIT_EXTERN
int git_submodule_resolve_url(libgit2_d.buffer.git_buf* out_, libgit2_d.types.git_repository* repo, const (char)* url);

/**
 * Get the branch for the submodule.
 *
 * Params:
 *      submodule = Pointer to submodule object
 *
 * Returns: Pointer to the submodule branch
 */
//GIT_EXTERN
const (char)* git_submodule_branch(libgit2_d.types.git_submodule* submodule);

/**
 * Set the branch for the submodule in the configuration
 *
 * After calling this, you may wish to call `git_submodule_sync()` to
 * write the changes to the checked out submodule repository.
 *
 * Params:
 *      repo = the repository to affect
 *      name = the name of the submodule to configure
 *      branch = Branch that should be used for the submodule
 *
 * Returns: 0 on success, <0 on failure
 */
//GIT_EXTERN
int git_submodule_set_branch(libgit2_d.types.git_repository* repo, const (char)* name, const (char)* branch);

/**
 * Set the URL for the submodule in the configuration
 *
 *
 * After calling this, you may wish to call `git_submodule_sync()` to
 * write the changes to the checked out submodule repository.
 *
 * Params:
 *      repo = the repository to affect
 *      name = the name of the submodule to configure
 *      url = URL that should be used for the submodule
 *
 * Returns: 0 on success, <0 on failure
 */
//GIT_EXTERN
int git_submodule_set_url(libgit2_d.types.git_repository* repo, const (char)* name, const (char)* url);

/**
 * Get the OID for the submodule in the index.
 *
 * Params:
 *      submodule = Pointer to submodule object
 *
 * Returns: Pointer to git_oid or null if submodule is not in index.
 */
//GIT_EXTERN
const (libgit2_d.oid.git_oid)* git_submodule_index_id(libgit2_d.types.git_submodule* submodule);

/**
 * Get the OID for the submodule in the current HEAD tree.
 *
 * Params:
 *      submodule = Pointer to submodule object
 *
 * Returns: Pointer to git_oid or null if submodule is not in the HEAD.
 */
//GIT_EXTERN
const (libgit2_d.oid.git_oid)* git_submodule_head_id(libgit2_d.types.git_submodule* submodule);

/**
 * Get the OID for the submodule in the current working directory.
 *
 * This returns the OID that corresponds to looking up 'HEAD' in the checked
 * out submodule.  If there are pending changes in the index or anything
 * else, this won't notice that.  You should call `git_submodule_status()`
 * for a more complete picture about the state of the working directory.
 *
 * Params:
 *      submodule = Pointer to submodule object
 *
 * Returns: Pointer to git_oid or null if submodule is not checked out.
 */
//GIT_EXTERN
const (libgit2_d.oid.git_oid)* git_submodule_wd_id(libgit2_d.types.git_submodule* submodule);

/**
 * Get the ignore rule that will be used for the submodule.
 *
 * These values control the behavior of `git_submodule_status()` for this
 * submodule.  There are four ignore values:
 *
 *  - **git_submodule_ignore_t.GIT_SUBMODULE_IGNORE_NONE** will consider any change to the contents
 *    of the submodule from a clean checkout to be dirty, including the
 *    addition of untracked files.  This is the default if unspecified.
 *  - **git_submodule_ignore_t.GIT_SUBMODULE_IGNORE_UNTRACKED** examines the contents of the
 *    working tree (i.e. call `git_status_foreach()` on the submodule) but
 *    UNTRACKED files will not count as making the submodule dirty.
 *  - **git_submodule_ignore_t.GIT_SUBMODULE_IGNORE_DIRTY** means to only check if the HEAD of the
 *    submodule has moved for status.  This is fast since it does not need to
 *    scan the working tree of the submodule at all.
 *  - **git_submodule_ignore_t.GIT_SUBMODULE_IGNORE_ALL** means not to open the submodule repo.
 *    The working directory will be consider clean so long as there is a
 *    checked out version present.
 *
 * Params:
 *      submodule = The submodule to check
 *
 * Returns: The current libgit2_d.types.git_submodule_ignore_t valyue what will be used for this submodule.
 */
//GIT_EXTERN
libgit2_d.types.git_submodule_ignore_t git_submodule_ignore(libgit2_d.types.git_submodule* submodule);

/**
 * Set the ignore rule for the submodule in the configuration
 *
 * This does not affect any currently-loaded instances.
 *
 * Params:
 *      repo = the repository to affect
 *      name = the name of the submdule
 *      ignore = The new value for the ignore rule
 *
 * Returns: 0 or an error code
 */
//GIT_EXTERN
int git_submodule_set_ignore(libgit2_d.types.git_repository* repo, const (char)* name, libgit2_d.types.git_submodule_ignore_t ignore);

/**
 * Get the update rule that will be used for the submodule.
 *
 * This value controls the behavior of the `git submodule update` command.
 * There are four useful values documented with `libgit2_d.types.git_submodule_update_t`.
 *
 * Params:
 *      submodule = The submodule to check
 *
 * Returns: The current libgit2_d.types.git_submodule_update_t value that will be used for this submodule.
 */
//GIT_EXTERN
libgit2_d.types.git_submodule_update_t git_submodule_update_strategy(libgit2_d.types.git_submodule* submodule);

/**
 * Set the update rule for the submodule in the configuration
 *
 * This setting won't affect any existing instances.
 *
 * Params:
 *      repo = the repository to affect
 *      name = the name of the submodule to configure
 *      update = The new value to use
 *
 * Returns: 0 or an error code
 */
//GIT_EXTERN
int git_submodule_set_update(libgit2_d.types.git_repository* repo, const (char)* name, libgit2_d.types.git_submodule_update_t update);

/**
 * Read the fetchRecurseSubmodules rule for a submodule.
 *
 * This accesses the submodule.<name>.fetchRecurseSubmodules value for
 * the submodule that controls fetching behavior for the submodule.
 *
 * Note that at this time, libgit2 does not honor this setting and the
 * fetch functionality current ignores submodules.
 *
 * Returns: 0 if fetchRecurseSubmodules is false, 1 if true
 */
//GIT_EXTERN
libgit2_d.types.git_submodule_recurse_t git_submodule_fetch_recurse_submodules(libgit2_d.types.git_submodule* submodule);

/**
 * Set the fetchRecurseSubmodules rule for a submodule in the configuration
 *
 * This setting won't affect any existing instances.
 *
 * Params:
 *      repo = the repository to affect
 *      name = the submodule to configure
 *      fetch_recurse_submodules = Boolean value
 *
 * Returns: old value for fetchRecurseSubmodules
 */
//GIT_EXTERN
int git_submodule_set_fetch_recurse_submodules(libgit2_d.types.git_repository* repo, const (char)* name, libgit2_d.types.git_submodule_recurse_t fetch_recurse_submodules);

/**
 * Copy submodule info into ".git/config" file.
 *
 * Just like "git submodule init", this copies information about the
 * submodule into ".git/config".  You can use the accessor functions
 * above to alter the in-memory git_submodule object and control what
 * is written to the config, overriding what is in .gitmodules.
 *
 * Params:
 *      submodule = The submodule to write into the superproject config
 *      overwrite = By default, existing entries will not be overwritten, but setting this to true forces them to be updated.
 *
 * Returns: 0 on success, <0 on failure.
 */
//GIT_EXTERN
int git_submodule_init(libgit2_d.types.git_submodule* submodule, int overwrite);

/**
 * Set up the subrepository for a submodule in preparation for clone.
 *
 * This function can be called to init and set up a submodule
 * repository from a submodule in preparation to clone it from
 * its remote.
 *
 * Params:
 *      out_ = Output pointer to the created git repository.
 *      sm = The submodule to create a new subrepository from.
 *      use_gitlink = Should the workdir contain a gitlink to the repo in .git/modules vs. repo directly in workdir.
 *
 * Returns: 0 on success, <0 on failure.
 */
//GIT_EXTERN
int git_submodule_repo_init(libgit2_d.types.git_repository** out_, const (libgit2_d.types.git_submodule)* sm, int use_gitlink);

/**
 * Copy submodule remote info into submodule repo.
 *
 * This copies the information about the submodules URL into the checked out
 * submodule config, acting like "git submodule sync".  This is useful if
 * you have altered the URL for the submodule (or it has been altered by a
 * fetch of upstream changes) and you need to update your local repo.
 */
//GIT_EXTERN
int git_submodule_sync(libgit2_d.types.git_submodule* submodule);

/**
 * Open the repository for a submodule.
 *
 * This is a newly opened repository object.  The caller is responsible for
 * calling `git_repository_free()` on it when done.  Multiple calls to this
 * function will return distinct `libgit2_d.types.git_repository` objects.  This will only
 * work if the submodule is checked out into the working directory.
 *
 * Params:
 *      repo = Pointer to the submodule repo which was opened
 *      submodule = Submodule to be opened
 *
 * Returns: 0 on success, <0 if submodule repo could not be opened.
 */
//GIT_EXTERN
int git_submodule_open(libgit2_d.types.git_repository** repo, libgit2_d.types.git_submodule* submodule);

/**
 * Reread submodule info from config, index, and HEAD.
 *
 * Call this to reread cached submodule information for this submodule if
 * you have reason to believe that it has changed.
 *
 * Params:
 *      submodule = The submodule to reload
 *      force = Force reload even if the data doesn't seem out of date
 *
 * Returns: 0 on success, <0 on error
 */
//GIT_EXTERN
int git_submodule_reload(libgit2_d.types.git_submodule* submodule, int force);

/**
 * Get the status for a submodule.
 *
 * This looks at a submodule and tries to determine the status.  It
 * will return a combination of the `GIT_SUBMODULE_STATUS` values above.
 * How deeply it examines the working directory to do this will depend
 * on the `libgit2_d.types.git_submodule_ignore_t` value for the submodule.
 *
 * Params:
 *      status = Combination of `GIT_SUBMODULE_STATUS` flags
 *      repo = the repository in which to look
 *      name = name of the submodule
 *      ignore = the ignore rules to follow
 *
 * Returns: 0 on success, <0 on error
 */
//GIT_EXTERN
int git_submodule_status(uint* status, libgit2_d.types.git_repository* repo, const (char)* name, libgit2_d.types.git_submodule_ignore_t ignore);

/**
 * Get the locations of submodule information.
 *
 * This is a bit like a very lightweight version of `git_submodule_status`.
 * It just returns a made of the first four submodule status values (i.e.
 * the ones like git_submodule_status_t.GIT_SUBMODULE_STATUS_IN_HEAD, etc) that tell you where the
 * submodule data comes from (i.e. the HEAD commit, gitmodules file, etc.).
 * This can be useful if you want to know if the submodule is present in the
 * working directory at this point in time, etc.
 *
 * Params:
 *      location_status = Combination of first four `GIT_SUBMODULE_STATUS` flags
 *      submodule = Submodule for which to get status
 *
 * Returns: 0 on success, <0 on error
 */
//GIT_EXTERN
int git_submodule_location(uint* location_status, libgit2_d.types.git_submodule* submodule);

/** @} */
