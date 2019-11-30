/*
 * Copyright (C) the libgit2 contributors. All rights reserved.
 *
 * This file is part of libgit2, distributed under the GNU GPL v2 with
 * a Linking Exception. For full terms see the included COPYING file.
 */
module libgit2_d.apply;


private static import libgit2_d.diff;
private static import libgit2_d.types;

/**
 * @file git2/apply.h
 * @brief Git patch application routines
 * @defgroup git_apply Git patch application routines
 * @ingroup Git
 * @{
 */
extern (C):
nothrow @nogc:
public:

/**
 * When applying a patch, callback that will be made per delta (file).
 *
 * When the callback:
 * - returns < 0, the apply process will be aborted.
 * - returns > 0, the delta will not be applied, but the apply process
 *      continues
 * - returns 0, the delta is applied, and the apply process continues.
 *
 * @param delta The delta to be applied
 * @param payload User-specified payload
 */
alias git_apply_delta_cb = int function(const (libgit2_d.diff.git_diff_delta)* delta, void* payload);

/**
 * When applying a patch, callback that will be made per hunk.
 *
 * When the callback:
 * - returns < 0, the apply process will be aborted.
 * - returns > 0, the hunk will not be applied, but the apply process
 *      continues
 * - returns 0, the hunk is applied, and the apply process continues.
 *
 * @param hunk The hunk to be applied
 * @param payload User-specified payload
 */
alias git_apply_hunk_cb = int function(const (libgit2_d.diff.git_diff_hunk)* hunk, void* payload);

/**
 * Flags controlling the behavior of git_apply
 */
enum git_apply_flags_t
{
	/**
	 * Don't actually make changes, just test that the patch applies.
	 * This is the equivalent of `git apply --check`.
	 */
	GIT_APPLY_CHECK = 1 << 0,
}

/**
 * Apply options structure
 *
 * Initialize with `GIT_APPLY_OPTIONS_INIT`. Alternatively, you can
 * use `git_apply_options_init`.
 *
 * @see git_apply_to_tree, git_apply
 */
struct git_apply_options
{
	/**
	 * The version
	 */
	uint version_;

	/**
	 * When applying a patch, callback that will be made per delta (file).
	 */
	.git_apply_delta_cb delta_cb;

	/**
	 * When applying a patch, callback that will be made per hunk.
	 */
	.git_apply_hunk_cb hunk_cb;

	/**
	 * Payload passed to both delta_cb & hunk_cb.
	 */
	void* payload;

	/**
	 * Bitmask of git_apply_flags_t
	 */
	uint flags;
}

enum GIT_APPLY_OPTIONS_VERSION = 1;

pragma(inline, true)
pure nothrow @safe @nogc
.git_apply_options GIT_APPLY_OPTIONS_INIT()

	do
	{
		.git_apply_options OUTPUT =
		{
			version_: .GIT_APPLY_OPTIONS_VERSION,
		};

		return OUTPUT;
	}

//GIT_EXTERN
int git_apply_options_init(.git_apply_options* opts, uint version_);

/**
 * Apply a `git_diff` to a `git_tree`, and return the resulting image
 * as an index.
 *
 * @param out_ the postimage of the application
 * @param repo the repository to apply
 * @param preimage the tree to apply the diff to
 * @param diff the diff to apply
 * @param options the options for the apply (or null for defaults)
 */
//GIT_EXTERN
int git_apply_to_tree(libgit2_d.types.git_index** out_, libgit2_d.types.git_repository* repo, libgit2_d.types.git_tree* preimage, libgit2_d.diff.git_diff* diff, const (.git_apply_options)* options);

/**
 * Possible application locations for git_apply
 */
enum git_apply_location_t
{
	/**
	 * Apply the patch to the workdir, leaving the index untouched.
	 * This is the equivalent of `git apply` with no location argument.
	 */
	GIT_APPLY_LOCATION_WORKDIR = 0,

	/**
	 * Apply the patch to the index, leaving the working directory
	 * untouched.  This is the equivalent of `git apply --cached`.
	 */
	GIT_APPLY_LOCATION_INDEX = 1,

	/**
	 * Apply the patch to both the working directory and the index.
	 * This is the equivalent of `git apply --index`.
	 */
	GIT_APPLY_LOCATION_BOTH = 2,
}

/**
 * Apply a `git_diff` to the given repository, making changes directly
 * in the working directory, the index, or both.
 *
 * @param repo the repository to apply to
 * @param diff the diff to apply
 * @param location the location to apply (workdir, index or both)
 * @param options the options for the apply (or null for defaults)
 */
//GIT_EXTERN
int git_apply(libgit2_d.types.git_repository* repo, libgit2_d.diff.git_diff* diff, .git_apply_location_t location, const (.git_apply_options)* options);

/** @} */