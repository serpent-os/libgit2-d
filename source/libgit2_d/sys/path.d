/*
 * Copyright (C) the libgit2 contributors. All rights reserved.
 *
 * This file is part of libgit2, distributed under the GNU GPL v2 with
 * a Linking Exception. For full terms see the included COPYING file.
 */
module libgit2_d.sys.path;


extern (C):
nothrow @nogc:
package(libgit2_d):

/**
 * The kinds of git-specific files we know about.
 *
 * The order needs to stay the same to not break the `gitfiles`
 * array in path.c
 */
enum git_path_gitfile
{
	/**
	 * Check for the .gitignore file
	 */
	GIT_PATH_GITFILE_GITIGNORE,

	/**
	 * Check for the .gitmodules file
	 */
	GIT_PATH_GITFILE_GITMODULES,

	/**
	 * Check for the .gitattributes file
	 */
	GIT_PATH_GITFILE_GITATTRIBUTES,
}

/**
 * The kinds of checks to perform according to which filesystem we are trying to
 * protect.
 */
enum git_path_fs
{
	/**
	 * Do both NTFS- and HFS-specific checks
	 */
	GIT_PATH_FS_GENERIC,

	/**
	 * Do NTFS-specific checks only
	 */
	GIT_PATH_FS_NTFS,

	/**
	 * Do HFS-specific checks only
	 */
	GIT_PATH_FS_HFS,
}

/**
 * Check whether a path component corresponds to a .git$SUFFIX
 * file.
 *
 * As some filesystems do special things to filenames when
 * writing files to disk, you cannot always do a plain string
 * comparison to verify whether a file name matches an expected
 * path or not. This function can do the comparison for you,
 * depending on the filesystem you're on.
 *
 * @param path the path component to check
 * @param pathlen the length of `path` that is to be checked
 * @param gitfile which file to check against
 * @param fs which filesystem-specific checks to use
 * @return 0 in case the file does not match, a positive value if
 *         it does; -1 in case of an error
 */
//GIT_EXTERN
int git_path_is_gitfile(const (char)* path, size_t pathlen, .git_path_gitfile gitfile, .git_path_fs fs);
