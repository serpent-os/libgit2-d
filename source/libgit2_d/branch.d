/*
 * Copyright (C) the libgit2 contributors. All rights reserved.
 *
 * This file is part of libgit2, distributed under the GNU GPL v2 with
 * a Linking Exception. For full terms see the included COPYING file.
 */
module libgit2_d.branch;


private static import libgit2_d.buffer;
private static import libgit2_d.types;

/**
 * @file git2/branch.h
 * @brief Git branch parsing routines
 * @defgroup git_branch Git branch management
 * @ingroup Git
 * @{
 */
extern (C):
nothrow @nogc:
public:

/**
 * Create a new branch pointing at a target commit
 *
 * A new direct reference will be created pointing to
 * this target commit. If `force` is true and a reference
 * already exists with the given name, it'll be replaced.
 *
 * The returned reference must be freed by the user.
 *
 * The branch name will be checked for validity.
 * See `git_tag_create()` for rules about valid names.
 *
 * @param out_ Pointer where to store the underlying reference.
 *
 * @param branch_name Name for the branch; this name is
 * validated for consistency. It should also not conflict with
 * an already existing branch name.
 *
 * @param target Commit to which this branch should point. This object
 * must belong to the given `repo`.
 *
 * @param force Overwrite existing branch.
 *
 * @return 0, git_error_code.GIT_EINVALIDSPEC or an error code.
 * A proper reference is written in the refs/heads namespace
 * pointing to the provided target commit.
 */
//GIT_EXTERN
int git_branch_create(libgit2_d.types.git_reference** out_, libgit2_d.types.git_repository* repo, const (char)* branch_name, const (libgit2_d.types.git_commit)* target, int force);

/**
 * Create a new branch pointing at a target commit
 *
 * This behaves like `git_branch_create()` but takes an annotated
 * commit, which lets you specify which extended sha syntax string was
 * specified by a user, allowing for more exact reflog messages.
 *
 * See the documentation for `git_branch_create()`.
 *
 * @see git_branch_create
 */
//GIT_EXTERN
int git_branch_create_from_annotated(libgit2_d.types.git_reference** ref_out, libgit2_d.types.git_repository* repository, const (char)* branch_name, const (libgit2_d.types.git_annotated_commit)* commit, int force);

/**
 * Delete an existing branch reference.
 *
 * Note that if the deletion succeeds, the reference object will not
 * be valid anymore, and should be freed immediately by the user using
 * `git_reference_free()`.
 *
 * @param branch A valid reference representing a branch
 * @return 0 on success, or an error code.
 */
//GIT_EXTERN
int git_branch_delete(libgit2_d.types.git_reference* branch);

/**
 * Iterator type for branches
 */
struct git_branch_iterator;

/**
 * Create an iterator which loops over the requested branches.
 *
 * @param out_ the iterator
 * @param repo Repository where to find the branches.
 * @param list_flags Filtering flags for the branch
 * listing. Valid values are git_branch_t.GIT_BRANCH_LOCAL, git_branch_t.GIT_BRANCH_REMOTE
 * or git_branch_t.GIT_BRANCH_ALL.
 *
 * @return 0 on success  or an error code
 */
//GIT_EXTERN
int git_branch_iterator_new(.git_branch_iterator** out_, libgit2_d.types.git_repository* repo, libgit2_d.types.git_branch_t list_flags);

/**
 * Retrieve the next branch from the iterator
 *
 * @param out_ the reference
 * @param out_type the type of branch (local or remote-tracking)
 * @param iter the branch iterator
 * @return 0 on success, git_error_code.GIT_ITEROVER if there are no more branches or an error
 * code.
 */
//GIT_EXTERN
int git_branch_next(libgit2_d.types.git_reference** out_, libgit2_d.types.git_branch_t* out_type, .git_branch_iterator* iter);

/**
 * Free a branch iterator
 *
 * @param iter the iterator to free
 */
//GIT_EXTERN
void git_branch_iterator_free(.git_branch_iterator* iter);

/**
 * Move/rename an existing local branch reference.
 *
 * The new branch name will be checked for validity.
 * See `git_tag_create()` for rules about valid names.
 *
 * Note that if the move succeeds, the old reference object will not
 + be valid anymore, and should be freed immediately by the user using
 + `git_reference_free()`.
 *
 * @param out_ New reference object for the updated name.
 *
 * @param branch Current underlying reference of the branch.
 *
 * @param new_branch_name Target name of the branch once the move
 * is performed; this name is validated for consistency.
 *
 * @param force Overwrite existing branch.
 *
 * @return 0 on success, git_error_code.GIT_EINVALIDSPEC or an error code.
 */
//GIT_EXTERN
int git_branch_move(libgit2_d.types.git_reference** out_, libgit2_d.types.git_reference* branch, const (char)* new_branch_name, int force);

/**
 * Lookup a branch by its name in a repository.
 *
 * The generated reference must be freed by the user.
 * The branch name will be checked for validity.
 *
 * @see git_tag_create for rules about valid names.
 *
 * @param out_ pointer to the looked-up branch reference
 * @param repo the repository to look up the branch
 * @param branch_name Name of the branch to be looked-up;
 * this name is validated for consistency.
 * @param branch_type Type of the considered branch. This should
 * be valued with either git_branch_t.GIT_BRANCH_LOCAL or git_branch_t.GIT_BRANCH_REMOTE.
 *
 * @return 0 on success; git_error_code.GIT_ENOTFOUND when no matching branch
 * exists, git_error_code.GIT_EINVALIDSPEC, otherwise an error code.
 */
//GIT_EXTERN
int git_branch_lookup(libgit2_d.types.git_reference** out_, libgit2_d.types.git_repository* repo, const (char)* branch_name, libgit2_d.types.git_branch_t branch_type);

/**
 * Get the branch name
 *
 * Given a reference object, this will check that it really is a branch (ie.
 * it lives under "refs/heads/" or "refs/remotes/"), and return the branch part
 * of it.
 *
 * @param out_ Pointer to the abbreviated reference name.
 *        Owned by ref, do not free.
 *
 * @param ref A reference object, ideally pointing to a branch
 *
 * @return 0 on success; GIT_EINVALID if the reference isn't either a local or
 *         remote branch, otherwise an error code.
 */
//GIT_EXTERN
int git_branch_name(const (char)** out_, const (libgit2_d.types.git_reference)* ref_);

/**
 * Get the upstream of a branch
 *
 * Given a reference, this will return a new reference object corresponding
 * to its remote tracking branch. The reference must be a local branch.
 *
 * @see git_branch_upstream_name for details on the resolution.
 *
 * @param out_ Pointer where to store the retrieved reference.
 * @param branch Current underlying reference of the branch.
 *
 * @return 0 on success; GIT_ENOTFOUND when no remote tracking
 *         reference exists, otherwise an error code.
 */
//GIT_EXTERN
int git_branch_upstream(libgit2_d.types.git_reference** out_, const (libgit2_d.types.git_reference)* branch);

/**
 * Set a branch's upstream branch
 *
 * This will update the configuration to set the branch named `branch_name` as the upstream of `branch`.
 * Pass a NULL name to unset the upstream information.
 *
 * @note the actual tracking reference must have been already created for the
 * operation to succeed.
 *
 * @param branch the branch to configure
 * @param branch_name remote-tracking or local branch to set as upstream.
 *
 * @return 0 on success; GIT_ENOTFOUND if there's no branch named `branch_name`
 *         or an error code
 */
//GIT_EXTERN
int git_branch_set_upstream(libgit2_d.types.git_reference* branch, const (char)* branch_name);

/**
 * Get the upstream name of a branch
 *
 * Given a local branch, this will return its remote-tracking branch information,
 * as a full reference name, ie. "feature/nice" would become
 * "refs/remote/origin/feature/nice", depending on that branch's configuration.
 *
 * @param out_ the buffer into which the name will be written.
 * @param repo the repository where the branches live.
 * @param refname reference name of the local branch.
 *
 * @return 0 on success, GIT_ENOTFOUND when no remote tracking reference exists,
 *         or an error code.
 */
//GIT_EXTERN
int git_branch_upstream_name(libgit2_d.buffer.git_buf* out_, libgit2_d.types.git_repository* repo, const (char)* refname);

/**
 * Determine if HEAD points to the given branch
 *
 * @param branch A reference to a local branch.
 *
 * @return 1 if HEAD points at the branch, 0 if it isn't, or a negative value
 * 		   as an error code.
 */
//GIT_EXTERN
int git_branch_is_head(const (libgit2_d.types.git_reference)* branch);

/**
 * Determine if any HEAD points to the current branch
 *
 * This will iterate over all known linked repositories (usually in the form of
 * worktrees) and report whether any HEAD is pointing at the current branch.
 *
 * @param branch A reference to a local branch.
 *
 * @return 1 if branch is checked out, 0 if it isn't, an error code otherwise.
 */
//GIT_EXTERN
int git_branch_is_checked_out(const (libgit2_d.types.git_reference)* branch);

/**
 * Find the remote name of a remote-tracking branch
 *
 * This will return the name of the remote whose fetch refspec is matching
 * the given branch. E.g. given a branch "refs/remotes/test/master", it will
 * extract the "test" part. If refspecs from multiple remotes match,
 * the function will return GIT_EAMBIGUOUS.
 *
 * @param out_ The buffer into which the name will be written.
 * @param repo The repository where the branch lives.
 * @param refname complete name of the remote tracking branch.
 *
 * @return 0 on success, GIT_ENOTFOUND when no matching remote was found,
 *         GIT_EAMBIGUOUS when the branch maps to several remotes,
 *         otherwise an error code.
 */
//GIT_EXTERN
int git_branch_remote_name(libgit2_d.buffer.git_buf* out_, libgit2_d.types.git_repository* repo, const (char)* refname);

/**
 * Retrieve the upstream remote of a local branch
 *
 * This will return the currently configured "branch.*.remote" for a given
 * branch. This branch must be local.
 *
 * @param buf the buffer into which to write the name
 * @param repo the repository in which to look
 * @param refname the full name of the branch
 * @return 0 or an error code
 */
//GIT_EXTERN
int git_branch_upstream_remote(libgit2_d.buffer.git_buf* buf, libgit2_d.types.git_repository* repo, const (char)* refname);

/** @} */
