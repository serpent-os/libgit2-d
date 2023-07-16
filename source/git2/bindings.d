module git2.bindings;

import core.stdc.config;
import core.stdc.stdarg;
import core.stdc.stddef;
import std.conv;

extern (C):

alias git_indexer_progress_cb = int function (scope const ref git_indexer_progress stats, void* payload);

alias git_submodule_cb = int function (
    scope git_submodule* sm,
    const(char)* name,
    void* payload);

@safe:
@nogc:
nothrow:

int git_libgit2_version (out int major, out int minor, out int rev);

const(char)* git_libgit2_prerelease ();

enum git_feature_t
{
    GIT_FEATURE_THREADS = 1 << 0,

    GIT_FEATURE_HTTPS = 1 << 1,

    GIT_FEATURE_SSH = 1 << 2,

    GIT_FEATURE_NSEC = 1 << 3
}

alias GIT_FEATURE_THREADS = git_feature_t.GIT_FEATURE_THREADS;
alias GIT_FEATURE_HTTPS = git_feature_t.GIT_FEATURE_HTTPS;
alias GIT_FEATURE_SSH = git_feature_t.GIT_FEATURE_SSH;
alias GIT_FEATURE_NSEC = git_feature_t.GIT_FEATURE_NSEC;

int git_libgit2_features ();

enum git_libgit2_opt_t
{
    GIT_OPT_GET_MWINDOW_SIZE = 0,
    GIT_OPT_SET_MWINDOW_SIZE = 1,
    GIT_OPT_GET_MWINDOW_MAPPED_LIMIT = 2,
    GIT_OPT_SET_MWINDOW_MAPPED_LIMIT = 3,
    GIT_OPT_GET_SEARCH_PATH = 4,
    GIT_OPT_SET_SEARCH_PATH = 5,
    GIT_OPT_SET_CACHE_OBJECT_LIMIT = 6,
    GIT_OPT_SET_CACHE_MAX_SIZE = 7,
    GIT_OPT_ENABLE_CACHING = 8,
    GIT_OPT_GET_CACHED_MEMORY = 9,
    GIT_OPT_GET_TEMPLATE_PATH = 10,
    GIT_OPT_SET_TEMPLATE_PATH = 11,
    GIT_OPT_SET_SSL_CERT_LOCATIONS = 12,
    GIT_OPT_SET_USER_AGENT = 13,
    GIT_OPT_ENABLE_STRICT_OBJECT_CREATION = 14,
    GIT_OPT_ENABLE_STRICT_SYMBOLIC_REF_CREATION = 15,
    GIT_OPT_SET_SSL_CIPHERS = 16,
    GIT_OPT_GET_USER_AGENT = 17,
    GIT_OPT_ENABLE_OFS_DELTA = 18,
    GIT_OPT_ENABLE_FSYNC_GITDIR = 19,
    GIT_OPT_GET_WINDOWS_SHAREMODE = 20,
    GIT_OPT_SET_WINDOWS_SHAREMODE = 21,
    GIT_OPT_ENABLE_STRICT_HASH_VERIFICATION = 22,
    GIT_OPT_SET_ALLOCATOR = 23,
    GIT_OPT_ENABLE_UNSAVED_INDEX_SAFETY = 24,
    GIT_OPT_GET_PACK_MAX_OBJECTS = 25,
    GIT_OPT_SET_PACK_MAX_OBJECTS = 26,
    GIT_OPT_DISABLE_PACK_KEEP_FILE_CHECKS = 27,
    GIT_OPT_ENABLE_HTTP_EXPECT_CONTINUE = 28,
    GIT_OPT_GET_MWINDOW_FILE_LIMIT = 29,
    GIT_OPT_SET_MWINDOW_FILE_LIMIT = 30,
    GIT_OPT_SET_ODB_PACKED_PRIORITY = 31,
    GIT_OPT_SET_ODB_LOOSE_PRIORITY = 32,
    GIT_OPT_GET_EXTENSIONS = 33,
    GIT_OPT_SET_EXTENSIONS = 34,
    GIT_OPT_GET_OWNER_VALIDATION = 35,
    GIT_OPT_SET_OWNER_VALIDATION = 36,
    GIT_OPT_GET_HOMEDIR = 37,
    GIT_OPT_SET_HOMEDIR = 38,
    GIT_OPT_SET_SERVER_CONNECT_TIMEOUT = 39,
    GIT_OPT_GET_SERVER_CONNECT_TIMEOUT = 40,
    GIT_OPT_SET_SERVER_TIMEOUT = 41,
    GIT_OPT_GET_SERVER_TIMEOUT = 42
}

alias GIT_OPT_GET_MWINDOW_SIZE = git_libgit2_opt_t.GIT_OPT_GET_MWINDOW_SIZE;
alias GIT_OPT_SET_MWINDOW_SIZE = git_libgit2_opt_t.GIT_OPT_SET_MWINDOW_SIZE;
alias GIT_OPT_GET_MWINDOW_MAPPED_LIMIT = git_libgit2_opt_t.GIT_OPT_GET_MWINDOW_MAPPED_LIMIT;
alias GIT_OPT_SET_MWINDOW_MAPPED_LIMIT = git_libgit2_opt_t.GIT_OPT_SET_MWINDOW_MAPPED_LIMIT;
alias GIT_OPT_GET_SEARCH_PATH = git_libgit2_opt_t.GIT_OPT_GET_SEARCH_PATH;
alias GIT_OPT_SET_SEARCH_PATH = git_libgit2_opt_t.GIT_OPT_SET_SEARCH_PATH;
alias GIT_OPT_SET_CACHE_OBJECT_LIMIT = git_libgit2_opt_t.GIT_OPT_SET_CACHE_OBJECT_LIMIT;
alias GIT_OPT_SET_CACHE_MAX_SIZE = git_libgit2_opt_t.GIT_OPT_SET_CACHE_MAX_SIZE;
alias GIT_OPT_ENABLE_CACHING = git_libgit2_opt_t.GIT_OPT_ENABLE_CACHING;
alias GIT_OPT_GET_CACHED_MEMORY = git_libgit2_opt_t.GIT_OPT_GET_CACHED_MEMORY;
alias GIT_OPT_GET_TEMPLATE_PATH = git_libgit2_opt_t.GIT_OPT_GET_TEMPLATE_PATH;
alias GIT_OPT_SET_TEMPLATE_PATH = git_libgit2_opt_t.GIT_OPT_SET_TEMPLATE_PATH;
alias GIT_OPT_SET_SSL_CERT_LOCATIONS = git_libgit2_opt_t.GIT_OPT_SET_SSL_CERT_LOCATIONS;
alias GIT_OPT_SET_USER_AGENT = git_libgit2_opt_t.GIT_OPT_SET_USER_AGENT;
alias GIT_OPT_ENABLE_STRICT_OBJECT_CREATION = git_libgit2_opt_t.GIT_OPT_ENABLE_STRICT_OBJECT_CREATION;
alias GIT_OPT_ENABLE_STRICT_SYMBOLIC_REF_CREATION = git_libgit2_opt_t.GIT_OPT_ENABLE_STRICT_SYMBOLIC_REF_CREATION;
alias GIT_OPT_SET_SSL_CIPHERS = git_libgit2_opt_t.GIT_OPT_SET_SSL_CIPHERS;
alias GIT_OPT_GET_USER_AGENT = git_libgit2_opt_t.GIT_OPT_GET_USER_AGENT;
alias GIT_OPT_ENABLE_OFS_DELTA = git_libgit2_opt_t.GIT_OPT_ENABLE_OFS_DELTA;
alias GIT_OPT_ENABLE_FSYNC_GITDIR = git_libgit2_opt_t.GIT_OPT_ENABLE_FSYNC_GITDIR;
alias GIT_OPT_GET_WINDOWS_SHAREMODE = git_libgit2_opt_t.GIT_OPT_GET_WINDOWS_SHAREMODE;
alias GIT_OPT_SET_WINDOWS_SHAREMODE = git_libgit2_opt_t.GIT_OPT_SET_WINDOWS_SHAREMODE;
alias GIT_OPT_ENABLE_STRICT_HASH_VERIFICATION = git_libgit2_opt_t.GIT_OPT_ENABLE_STRICT_HASH_VERIFICATION;
alias GIT_OPT_SET_ALLOCATOR = git_libgit2_opt_t.GIT_OPT_SET_ALLOCATOR;
alias GIT_OPT_ENABLE_UNSAVED_INDEX_SAFETY = git_libgit2_opt_t.GIT_OPT_ENABLE_UNSAVED_INDEX_SAFETY;
alias GIT_OPT_GET_PACK_MAX_OBJECTS = git_libgit2_opt_t.GIT_OPT_GET_PACK_MAX_OBJECTS;
alias GIT_OPT_SET_PACK_MAX_OBJECTS = git_libgit2_opt_t.GIT_OPT_SET_PACK_MAX_OBJECTS;
alias GIT_OPT_DISABLE_PACK_KEEP_FILE_CHECKS = git_libgit2_opt_t.GIT_OPT_DISABLE_PACK_KEEP_FILE_CHECKS;
alias GIT_OPT_ENABLE_HTTP_EXPECT_CONTINUE = git_libgit2_opt_t.GIT_OPT_ENABLE_HTTP_EXPECT_CONTINUE;
alias GIT_OPT_GET_MWINDOW_FILE_LIMIT = git_libgit2_opt_t.GIT_OPT_GET_MWINDOW_FILE_LIMIT;
alias GIT_OPT_SET_MWINDOW_FILE_LIMIT = git_libgit2_opt_t.GIT_OPT_SET_MWINDOW_FILE_LIMIT;
alias GIT_OPT_SET_ODB_PACKED_PRIORITY = git_libgit2_opt_t.GIT_OPT_SET_ODB_PACKED_PRIORITY;
alias GIT_OPT_SET_ODB_LOOSE_PRIORITY = git_libgit2_opt_t.GIT_OPT_SET_ODB_LOOSE_PRIORITY;
alias GIT_OPT_GET_EXTENSIONS = git_libgit2_opt_t.GIT_OPT_GET_EXTENSIONS;
alias GIT_OPT_SET_EXTENSIONS = git_libgit2_opt_t.GIT_OPT_SET_EXTENSIONS;
alias GIT_OPT_GET_OWNER_VALIDATION = git_libgit2_opt_t.GIT_OPT_GET_OWNER_VALIDATION;
alias GIT_OPT_SET_OWNER_VALIDATION = git_libgit2_opt_t.GIT_OPT_SET_OWNER_VALIDATION;
alias GIT_OPT_GET_HOMEDIR = git_libgit2_opt_t.GIT_OPT_GET_HOMEDIR;
alias GIT_OPT_SET_HOMEDIR = git_libgit2_opt_t.GIT_OPT_SET_HOMEDIR;
alias GIT_OPT_SET_SERVER_CONNECT_TIMEOUT = git_libgit2_opt_t.GIT_OPT_SET_SERVER_CONNECT_TIMEOUT;
alias GIT_OPT_GET_SERVER_CONNECT_TIMEOUT = git_libgit2_opt_t.GIT_OPT_GET_SERVER_CONNECT_TIMEOUT;
alias GIT_OPT_SET_SERVER_TIMEOUT = git_libgit2_opt_t.GIT_OPT_SET_SERVER_TIMEOUT;
alias GIT_OPT_GET_SERVER_TIMEOUT = git_libgit2_opt_t.GIT_OPT_GET_SERVER_TIMEOUT;

int git_libgit2_opts (int option, ...);

alias git_off_t = c_long;
alias git_time_t = c_long;

alias git_object_size_t = c_ulong;

struct git_buf
{
    char* ptr;

    size_t reserved;

    size_t size;
}

void git_buf_dispose (git_buf* buffer);

enum git_oid_t
{
    GIT_OID_SHA1 = 1
}

alias GIT_OID_SHA1 = git_oid_t.GIT_OID_SHA1;

struct git_oid
{
    ubyte[20] id;
}

int git_oid_fromstr (git_oid* out_, const(char)* str);

int git_oid_fromstrp (git_oid* out_, const(char)* str);

int git_oid_fromstrn (git_oid* out_, const(char)* str, size_t length);

int git_oid_fromraw (git_oid* out_, const(ubyte)* raw);

int git_oid_fmt (char* out_, const(git_oid)* id);

int git_oid_nfmt (char* out_, size_t n, const(git_oid)* id);

int git_oid_pathfmt (char* out_, const(git_oid)* id);

char* git_oid_tostr_s (const(git_oid)* oid);

char* git_oid_tostr (char* out_, size_t n, const(git_oid)* id);

int git_oid_cpy (git_oid* out_, const(git_oid)* src);

int git_oid_cmp (const(git_oid)* a, const(git_oid)* b);

int git_oid_equal (const(git_oid)* a, const(git_oid)* b);

int git_oid_ncmp (const(git_oid)* a, const(git_oid)* b, size_t len);

int git_oid_streq (const(git_oid)* id, const(char)* str);

int git_oid_strcmp (const(git_oid)* id, const(char)* str);

int git_oid_is_zero (const(git_oid)* id);

struct git_oid_shorten;

git_oid_shorten* git_oid_shorten_new (size_t min_length);

int git_oid_shorten_add (git_oid_shorten* os, const(char)* text_id);

void git_oid_shorten_free (git_oid_shorten* os);

enum git_object_t
{
    GIT_OBJECT_ANY = -2,
    GIT_OBJECT_INVALID = -1,
    GIT_OBJECT_COMMIT = 1,
    GIT_OBJECT_TREE = 2,
    GIT_OBJECT_BLOB = 3,
    GIT_OBJECT_TAG = 4,
    GIT_OBJECT_OFS_DELTA = 6,
    GIT_OBJECT_REF_DELTA = 7
}

alias GIT_OBJECT_ANY = git_object_t.GIT_OBJECT_ANY;
alias GIT_OBJECT_INVALID = git_object_t.GIT_OBJECT_INVALID;
alias GIT_OBJECT_COMMIT = git_object_t.GIT_OBJECT_COMMIT;
alias GIT_OBJECT_TREE = git_object_t.GIT_OBJECT_TREE;
alias GIT_OBJECT_BLOB = git_object_t.GIT_OBJECT_BLOB;
alias GIT_OBJECT_TAG = git_object_t.GIT_OBJECT_TAG;
alias GIT_OBJECT_OFS_DELTA = git_object_t.GIT_OBJECT_OFS_DELTA;
alias GIT_OBJECT_REF_DELTA = git_object_t.GIT_OBJECT_REF_DELTA;

struct git_odb;

struct git_odb_backend;

struct git_odb_object;

struct git_midx_writer;

struct git_refdb;

struct git_refdb_backend;

struct git_commit_graph;

struct git_commit_graph_writer;

struct git_repository;

struct git_worktree;

struct git_object;

struct git_revwalk;

struct git_tag;

struct git_blob;

struct git_commit;

struct git_tree_entry;

struct git_tree;

struct git_treebuilder;

struct git_index;

struct git_index_iterator;

struct git_index_conflict_iterator;

struct git_config;

struct git_config_backend;

struct git_reflog_entry;

struct git_reflog;

struct git_note;

struct git_packbuilder;

struct git_time
{
    git_time_t time;
    int offset;
    char sign;
}

struct git_signature
{
    char* name;
    char* email;
    git_time when;
}

struct git_reference;

struct git_reference_iterator;

struct git_transaction;

struct git_annotated_commit;

struct git_status_list;

struct git_rebase;

enum git_reference_t
{
    GIT_REFERENCE_INVALID = 0,
    GIT_REFERENCE_DIRECT = 1,
    GIT_REFERENCE_SYMBOLIC = 2,
    GIT_REFERENCE_ALL = GIT_REFERENCE_DIRECT | GIT_REFERENCE_SYMBOLIC
}

alias GIT_REFERENCE_INVALID = git_reference_t.GIT_REFERENCE_INVALID;
alias GIT_REFERENCE_DIRECT = git_reference_t.GIT_REFERENCE_DIRECT;
alias GIT_REFERENCE_SYMBOLIC = git_reference_t.GIT_REFERENCE_SYMBOLIC;
alias GIT_REFERENCE_ALL = git_reference_t.GIT_REFERENCE_ALL;

enum git_branch_t
{
    GIT_BRANCH_LOCAL = 1,
    GIT_BRANCH_REMOTE = 2,
    GIT_BRANCH_ALL = GIT_BRANCH_LOCAL | GIT_BRANCH_REMOTE
}

alias GIT_BRANCH_LOCAL = git_branch_t.GIT_BRANCH_LOCAL;
alias GIT_BRANCH_REMOTE = git_branch_t.GIT_BRANCH_REMOTE;
alias GIT_BRANCH_ALL = git_branch_t.GIT_BRANCH_ALL;

enum git_filemode_t
{
    GIT_FILEMODE_UNREADABLE = octal!0,
    GIT_FILEMODE_TREE = octal!40000,
    GIT_FILEMODE_BLOB = octal!100644,
    GIT_FILEMODE_BLOB_EXECUTABLE = octal!100755,
    GIT_FILEMODE_LINK = octal!120000,
    GIT_FILEMODE_COMMIT = octal!160000
}

alias GIT_FILEMODE_UNREADABLE = git_filemode_t.GIT_FILEMODE_UNREADABLE;
alias GIT_FILEMODE_TREE = git_filemode_t.GIT_FILEMODE_TREE;
alias GIT_FILEMODE_BLOB = git_filemode_t.GIT_FILEMODE_BLOB;
alias GIT_FILEMODE_BLOB_EXECUTABLE = git_filemode_t.GIT_FILEMODE_BLOB_EXECUTABLE;
alias GIT_FILEMODE_LINK = git_filemode_t.GIT_FILEMODE_LINK;
alias GIT_FILEMODE_COMMIT = git_filemode_t.GIT_FILEMODE_COMMIT;

struct git_refspec;

struct git_remote;

struct git_transport;

struct git_push;

struct git_submodule;

enum git_submodule_update_t
{
    GIT_SUBMODULE_UPDATE_CHECKOUT = 1,
    GIT_SUBMODULE_UPDATE_REBASE = 2,
    GIT_SUBMODULE_UPDATE_MERGE = 3,
    GIT_SUBMODULE_UPDATE_NONE = 4,

    GIT_SUBMODULE_UPDATE_DEFAULT = 0
}

alias GIT_SUBMODULE_UPDATE_CHECKOUT = git_submodule_update_t.GIT_SUBMODULE_UPDATE_CHECKOUT;
alias GIT_SUBMODULE_UPDATE_REBASE = git_submodule_update_t.GIT_SUBMODULE_UPDATE_REBASE;
alias GIT_SUBMODULE_UPDATE_MERGE = git_submodule_update_t.GIT_SUBMODULE_UPDATE_MERGE;
alias GIT_SUBMODULE_UPDATE_NONE = git_submodule_update_t.GIT_SUBMODULE_UPDATE_NONE;
alias GIT_SUBMODULE_UPDATE_DEFAULT = git_submodule_update_t.GIT_SUBMODULE_UPDATE_DEFAULT;

enum git_submodule_ignore_t
{
    GIT_SUBMODULE_IGNORE_UNSPECIFIED = -1,

    GIT_SUBMODULE_IGNORE_NONE = 1,
    GIT_SUBMODULE_IGNORE_UNTRACKED = 2,
    GIT_SUBMODULE_IGNORE_DIRTY = 3,
    GIT_SUBMODULE_IGNORE_ALL = 4
}

alias GIT_SUBMODULE_IGNORE_UNSPECIFIED = git_submodule_ignore_t.GIT_SUBMODULE_IGNORE_UNSPECIFIED;
alias GIT_SUBMODULE_IGNORE_NONE = git_submodule_ignore_t.GIT_SUBMODULE_IGNORE_NONE;
alias GIT_SUBMODULE_IGNORE_UNTRACKED = git_submodule_ignore_t.GIT_SUBMODULE_IGNORE_UNTRACKED;
alias GIT_SUBMODULE_IGNORE_DIRTY = git_submodule_ignore_t.GIT_SUBMODULE_IGNORE_DIRTY;
alias GIT_SUBMODULE_IGNORE_ALL = git_submodule_ignore_t.GIT_SUBMODULE_IGNORE_ALL;

enum git_submodule_recurse_t
{
    GIT_SUBMODULE_RECURSE_NO = 0,
    GIT_SUBMODULE_RECURSE_YES = 1,
    GIT_SUBMODULE_RECURSE_ONDEMAND = 2
}

alias GIT_SUBMODULE_RECURSE_NO = git_submodule_recurse_t.GIT_SUBMODULE_RECURSE_NO;
alias GIT_SUBMODULE_RECURSE_YES = git_submodule_recurse_t.GIT_SUBMODULE_RECURSE_YES;
alias GIT_SUBMODULE_RECURSE_ONDEMAND = git_submodule_recurse_t.GIT_SUBMODULE_RECURSE_ONDEMAND;

struct git_writestream
{
    int function (git_writestream* stream, const(char)* buffer, size_t len) write;
    int function (git_writestream* stream) close;
    void function (git_writestream* stream) free;
}

struct git_mailmap;

int git_repository_open (scope out git_repository* out_, const(char)* path);

int git_repository_open_from_worktree (scope out git_repository* out_, git_worktree* wt);

int git_repository_wrap_odb (scope out git_repository* out_, git_odb* odb);

int git_repository_discover (
    git_buf* out_,
    const(char)* start_path,
    int across_fs,
    const(char)* ceiling_dirs);

enum git_repository_open_flag_t
{
    GIT_REPOSITORY_OPEN_NO_SEARCH = 1 << 0,

    GIT_REPOSITORY_OPEN_CROSS_FS = 1 << 1,

    GIT_REPOSITORY_OPEN_BARE = 1 << 2,

    GIT_REPOSITORY_OPEN_NO_DOTGIT = 1 << 3,

    GIT_REPOSITORY_OPEN_FROM_ENV = 1 << 4
}

alias GIT_REPOSITORY_OPEN_NO_SEARCH = git_repository_open_flag_t.GIT_REPOSITORY_OPEN_NO_SEARCH;
alias GIT_REPOSITORY_OPEN_CROSS_FS = git_repository_open_flag_t.GIT_REPOSITORY_OPEN_CROSS_FS;
alias GIT_REPOSITORY_OPEN_BARE = git_repository_open_flag_t.GIT_REPOSITORY_OPEN_BARE;
alias GIT_REPOSITORY_OPEN_NO_DOTGIT = git_repository_open_flag_t.GIT_REPOSITORY_OPEN_NO_DOTGIT;
alias GIT_REPOSITORY_OPEN_FROM_ENV = git_repository_open_flag_t.GIT_REPOSITORY_OPEN_FROM_ENV;

int git_repository_open_ext (
    scope out git_repository* out_,
    const(char)* path,
    uint flags,
    const(char)* ceiling_dirs);

int git_repository_open_bare (scope out git_repository* out_, const(char)* bare_path);

void git_repository_free (scope git_repository* repo);

int git_repository_init (
    scope out git_repository* out_,
    const(char)* path,
    uint is_bare);

enum git_repository_init_flag_t
{
    GIT_REPOSITORY_INIT_BARE = 1u << 0,

    GIT_REPOSITORY_INIT_NO_REINIT = 1u << 1,

    GIT_REPOSITORY_INIT_NO_DOTGIT_DIR = 1u << 2,

    GIT_REPOSITORY_INIT_MKDIR = 1u << 3,

    GIT_REPOSITORY_INIT_MKPATH = 1u << 4,

    GIT_REPOSITORY_INIT_EXTERNAL_TEMPLATE = 1u << 5,

    GIT_REPOSITORY_INIT_RELATIVE_GITLINK = 1u << 6
}

alias GIT_REPOSITORY_INIT_BARE = git_repository_init_flag_t.GIT_REPOSITORY_INIT_BARE;
alias GIT_REPOSITORY_INIT_NO_REINIT = git_repository_init_flag_t.GIT_REPOSITORY_INIT_NO_REINIT;
alias GIT_REPOSITORY_INIT_NO_DOTGIT_DIR = git_repository_init_flag_t.GIT_REPOSITORY_INIT_NO_DOTGIT_DIR;
alias GIT_REPOSITORY_INIT_MKDIR = git_repository_init_flag_t.GIT_REPOSITORY_INIT_MKDIR;
alias GIT_REPOSITORY_INIT_MKPATH = git_repository_init_flag_t.GIT_REPOSITORY_INIT_MKPATH;
alias GIT_REPOSITORY_INIT_EXTERNAL_TEMPLATE = git_repository_init_flag_t.GIT_REPOSITORY_INIT_EXTERNAL_TEMPLATE;
alias GIT_REPOSITORY_INIT_RELATIVE_GITLINK = git_repository_init_flag_t.GIT_REPOSITORY_INIT_RELATIVE_GITLINK;

enum git_repository_init_mode_t
{
    GIT_REPOSITORY_INIT_SHARED_UMASK = 0,

    GIT_REPOSITORY_INIT_SHARED_GROUP = octal!2775,

    GIT_REPOSITORY_INIT_SHARED_ALL = octal!2777
}

alias GIT_REPOSITORY_INIT_SHARED_UMASK = git_repository_init_mode_t.GIT_REPOSITORY_INIT_SHARED_UMASK;
alias GIT_REPOSITORY_INIT_SHARED_GROUP = git_repository_init_mode_t.GIT_REPOSITORY_INIT_SHARED_GROUP;
alias GIT_REPOSITORY_INIT_SHARED_ALL = git_repository_init_mode_t.GIT_REPOSITORY_INIT_SHARED_ALL;

struct git_repository_init_options
{
    uint version_;

    uint flags;

    uint mode;

    const(char)* workdir_path;

    const(char)* description;

    const(char)* template_path;

    const(char)* initial_head;

    const(char)* origin_url;
}

int git_repository_init_options_init (
    scope ref git_repository_init_options opts,
    uint version_);

int git_repository_init_ext (
    scope out git_repository* out_,
    const(char)* repo_path,
    scope ref git_repository_init_options opts);

int git_repository_head (git_reference** out_, scope git_repository* repo);

int git_repository_head_for_worktree (
    git_reference** out_,
    scope git_repository* repo,
    const(char)* name);

int git_repository_head_detached (scope git_repository* repo);

int git_repository_head_detached_for_worktree (
    scope git_repository* repo,
    const(char)* name);

int git_repository_head_unborn (scope git_repository* repo);

int git_repository_is_empty (scope git_repository* repo);

enum git_repository_item_t
{
    GIT_REPOSITORY_ITEM_GITDIR = 0,
    GIT_REPOSITORY_ITEM_WORKDIR = 1,
    GIT_REPOSITORY_ITEM_COMMONDIR = 2,
    GIT_REPOSITORY_ITEM_INDEX = 3,
    GIT_REPOSITORY_ITEM_OBJECTS = 4,
    GIT_REPOSITORY_ITEM_REFS = 5,
    GIT_REPOSITORY_ITEM_PACKED_REFS = 6,
    GIT_REPOSITORY_ITEM_REMOTES = 7,
    GIT_REPOSITORY_ITEM_CONFIG = 8,
    GIT_REPOSITORY_ITEM_INFO = 9,
    GIT_REPOSITORY_ITEM_HOOKS = 10,
    GIT_REPOSITORY_ITEM_LOGS = 11,
    GIT_REPOSITORY_ITEM_MODULES = 12,
    GIT_REPOSITORY_ITEM_WORKTREES = 13,
    GIT_REPOSITORY_ITEM__LAST = 14
}

alias GIT_REPOSITORY_ITEM_GITDIR = git_repository_item_t.GIT_REPOSITORY_ITEM_GITDIR;
alias GIT_REPOSITORY_ITEM_WORKDIR = git_repository_item_t.GIT_REPOSITORY_ITEM_WORKDIR;
alias GIT_REPOSITORY_ITEM_COMMONDIR = git_repository_item_t.GIT_REPOSITORY_ITEM_COMMONDIR;
alias GIT_REPOSITORY_ITEM_INDEX = git_repository_item_t.GIT_REPOSITORY_ITEM_INDEX;
alias GIT_REPOSITORY_ITEM_OBJECTS = git_repository_item_t.GIT_REPOSITORY_ITEM_OBJECTS;
alias GIT_REPOSITORY_ITEM_REFS = git_repository_item_t.GIT_REPOSITORY_ITEM_REFS;
alias GIT_REPOSITORY_ITEM_PACKED_REFS = git_repository_item_t.GIT_REPOSITORY_ITEM_PACKED_REFS;
alias GIT_REPOSITORY_ITEM_REMOTES = git_repository_item_t.GIT_REPOSITORY_ITEM_REMOTES;
alias GIT_REPOSITORY_ITEM_CONFIG = git_repository_item_t.GIT_REPOSITORY_ITEM_CONFIG;
alias GIT_REPOSITORY_ITEM_INFO = git_repository_item_t.GIT_REPOSITORY_ITEM_INFO;
alias GIT_REPOSITORY_ITEM_HOOKS = git_repository_item_t.GIT_REPOSITORY_ITEM_HOOKS;
alias GIT_REPOSITORY_ITEM_LOGS = git_repository_item_t.GIT_REPOSITORY_ITEM_LOGS;
alias GIT_REPOSITORY_ITEM_MODULES = git_repository_item_t.GIT_REPOSITORY_ITEM_MODULES;
alias GIT_REPOSITORY_ITEM_WORKTREES = git_repository_item_t.GIT_REPOSITORY_ITEM_WORKTREES;
alias GIT_REPOSITORY_ITEM__LAST = git_repository_item_t.GIT_REPOSITORY_ITEM__LAST;

int git_repository_item_path (git_buf* out_, scope const(git_repository)* repo, git_repository_item_t item);

const(char)* git_repository_path (scope const(git_repository)* repo);

const(char)* git_repository_workdir (scope const(git_repository)* repo);

const(char)* git_repository_commondir (scope const(git_repository)* repo);

int git_repository_set_workdir (
    scope git_repository* repo,
    const(char)* workdir,
    int update_gitlink);

int git_repository_is_bare (scope const(git_repository)* repo);

int git_repository_is_worktree (scope const(git_repository)* repo);

int git_repository_config (git_config** out_, scope git_repository* repo);

int git_repository_config_snapshot (git_config** out_, scope git_repository* repo);

int git_repository_odb (git_odb** out_, scope git_repository* repo);

int git_repository_refdb (git_refdb** out_, scope git_repository* repo);

int git_repository_index (git_index** out_, scope git_repository* repo);

int git_repository_message (git_buf* out_, scope git_repository* repo);

int git_repository_message_remove (scope git_repository* repo);

int git_repository_state_cleanup (scope git_repository* repo);

alias git_repository_fetchhead_foreach_cb = int function (
    const(char)* ref_name,
    const(char)* remote_url,
    const(git_oid)* oid,
    uint is_merge,
    void* payload);

int git_repository_fetchhead_foreach (
    scope git_repository* repo,
    git_repository_fetchhead_foreach_cb callback,
    void* payload);

alias git_repository_mergehead_foreach_cb = int function (
    const(git_oid)* oid,
    void* payload);

int git_repository_mergehead_foreach (
    scope git_repository* repo,
    git_repository_mergehead_foreach_cb callback,
    void* payload);

int git_repository_hashfile (
    git_oid* out_,
    scope git_repository* repo,
    const(char)* path,
    git_object_t type,
    const(char)* as_path);

int git_repository_set_head (scope git_repository* repo, const(char)* refname);

int git_repository_set_head_detached (
    scope git_repository* repo,
    const(git_oid)* committish);

int git_repository_set_head_detached_from_annotated (
    scope git_repository* repo,
    const(git_annotated_commit)* committish);

int git_repository_detach_head (scope git_repository* repo);

enum git_repository_state_t
{
    GIT_REPOSITORY_STATE_NONE = 0,
    GIT_REPOSITORY_STATE_MERGE = 1,
    GIT_REPOSITORY_STATE_REVERT = 2,
    GIT_REPOSITORY_STATE_REVERT_SEQUENCE = 3,
    GIT_REPOSITORY_STATE_CHERRYPICK = 4,
    GIT_REPOSITORY_STATE_CHERRYPICK_SEQUENCE = 5,
    GIT_REPOSITORY_STATE_BISECT = 6,
    GIT_REPOSITORY_STATE_REBASE = 7,
    GIT_REPOSITORY_STATE_REBASE_INTERACTIVE = 8,
    GIT_REPOSITORY_STATE_REBASE_MERGE = 9,
    GIT_REPOSITORY_STATE_APPLY_MAILBOX = 10,
    GIT_REPOSITORY_STATE_APPLY_MAILBOX_OR_REBASE = 11
}

alias GIT_REPOSITORY_STATE_NONE = git_repository_state_t.GIT_REPOSITORY_STATE_NONE;
alias GIT_REPOSITORY_STATE_MERGE = git_repository_state_t.GIT_REPOSITORY_STATE_MERGE;
alias GIT_REPOSITORY_STATE_REVERT = git_repository_state_t.GIT_REPOSITORY_STATE_REVERT;
alias GIT_REPOSITORY_STATE_REVERT_SEQUENCE = git_repository_state_t.GIT_REPOSITORY_STATE_REVERT_SEQUENCE;
alias GIT_REPOSITORY_STATE_CHERRYPICK = git_repository_state_t.GIT_REPOSITORY_STATE_CHERRYPICK;
alias GIT_REPOSITORY_STATE_CHERRYPICK_SEQUENCE = git_repository_state_t.GIT_REPOSITORY_STATE_CHERRYPICK_SEQUENCE;
alias GIT_REPOSITORY_STATE_BISECT = git_repository_state_t.GIT_REPOSITORY_STATE_BISECT;
alias GIT_REPOSITORY_STATE_REBASE = git_repository_state_t.GIT_REPOSITORY_STATE_REBASE;
alias GIT_REPOSITORY_STATE_REBASE_INTERACTIVE = git_repository_state_t.GIT_REPOSITORY_STATE_REBASE_INTERACTIVE;
alias GIT_REPOSITORY_STATE_REBASE_MERGE = git_repository_state_t.GIT_REPOSITORY_STATE_REBASE_MERGE;
alias GIT_REPOSITORY_STATE_APPLY_MAILBOX = git_repository_state_t.GIT_REPOSITORY_STATE_APPLY_MAILBOX;
alias GIT_REPOSITORY_STATE_APPLY_MAILBOX_OR_REBASE = git_repository_state_t.GIT_REPOSITORY_STATE_APPLY_MAILBOX_OR_REBASE;

int git_repository_state (scope git_repository* repo);

int git_repository_set_namespace (scope git_repository* repo, const(char)* nmspace);

const(char)* git_repository_get_namespace (scope git_repository* repo);

int git_repository_is_shallow (scope git_repository* repo);

int git_repository_ident (const(char*)* name, const(char*)* email, scope const(git_repository)* repo);

int git_repository_set_ident (scope git_repository* repo, const(char)* name, const(char)* email);

git_oid_t git_repository_oid_type (scope git_repository* repo);

int git_annotated_commit_from_ref (
    git_annotated_commit** out_,
    scope git_repository* repo,
    const(git_reference)* ref_);

int git_annotated_commit_from_fetchhead (
    git_annotated_commit** out_,
    scope git_repository* repo,
    const(char)* branch_name,
    const(char)* remote_url,
    const(git_oid)* id);

int git_annotated_commit_lookup (
    git_annotated_commit** out_,
    scope git_repository* repo,
    const(git_oid)* id);

int git_annotated_commit_from_revspec (
    git_annotated_commit** out_,
    scope git_repository* repo,
    const(char)* revspec);

const(git_oid)* git_annotated_commit_id (const(git_annotated_commit)* commit);

const(char)* git_annotated_commit_ref (const(git_annotated_commit)* commit);

void git_annotated_commit_free (git_annotated_commit* commit);

int git_object_lookup (
    scope out git_object* object,
    scope git_repository* repo,
    const(git_oid)* id,
    git_object_t type);

int git_object_lookup_prefix (
    scope out git_object* object_out,
    scope git_repository* repo,
    const(git_oid)* id,
    size_t len,
    git_object_t type);

int git_object_lookup_bypath (
    scope out git_object* out_,
    scope const(git_object)* treeish,
    const(char)* path,
    git_object_t type);

const(git_oid)* git_object_id (scope const(git_object)* obj);

int git_object_short_id (git_buf* out_, scope const(git_object)* obj);

git_object_t git_object_type (scope const(git_object)* obj);

git_repository* git_object_owner (scope const(git_object)* obj);

void git_object_free (scope git_object* object);

const(char)* git_object_type2string (git_object_t type);

git_object_t git_object_string2type (const(char)* str);

int git_object_typeisloose (git_object_t type);

int git_object_peel (
    scope out git_object* peeled,
    scope const(git_object)* object,
    git_object_t target_type);

int git_object_dup (scope out git_object* dest, scope git_object* source);

int git_object_rawcontent_is_valid (
    out int valid,
    const(char)* buf,
    size_t len,
    git_object_t object_type);

int git_tree_lookup (git_tree** out_, scope git_repository* repo, const(git_oid)* id);

int git_tree_lookup_prefix (
    git_tree** out_,
    scope git_repository* repo,
    const(git_oid)* id,
    size_t len);

void git_tree_free (git_tree* tree);

const(git_oid)* git_tree_id (const(git_tree)* tree);

git_repository* git_tree_owner (const(git_tree)* tree);

size_t git_tree_entrycount (const(git_tree)* tree);

const(git_tree_entry)* git_tree_entry_byname (
    const(git_tree)* tree,
    const(char)* filename);

const(git_tree_entry)* git_tree_entry_byindex (
    const(git_tree)* tree,
    size_t idx);

const(git_tree_entry)* git_tree_entry_byid (
    const(git_tree)* tree,
    const(git_oid)* id);

int git_tree_entry_bypath (
    git_tree_entry** out_,
    const(git_tree)* root,
    const(char)* path);

int git_tree_entry_dup (git_tree_entry** dest, const(git_tree_entry)* source);

void git_tree_entry_free (git_tree_entry* entry);

const(char)* git_tree_entry_name (const(git_tree_entry)* entry);

const(git_oid)* git_tree_entry_id (const(git_tree_entry)* entry);

git_object_t git_tree_entry_type (const(git_tree_entry)* entry);

git_filemode_t git_tree_entry_filemode (const(git_tree_entry)* entry);

git_filemode_t git_tree_entry_filemode_raw (const(git_tree_entry)* entry);

int git_tree_entry_cmp (const(git_tree_entry)* e1, const(git_tree_entry)* e2);

int git_tree_entry_to_object (
    scope out git_object* object_out,
    scope git_repository* repo,
    const(git_tree_entry)* entry);

int git_treebuilder_new (
    git_treebuilder** out_,
    scope git_repository* repo,
    const(git_tree)* source);

int git_treebuilder_clear (git_treebuilder* bld);

size_t git_treebuilder_entrycount (git_treebuilder* bld);

void git_treebuilder_free (git_treebuilder* bld);

const(git_tree_entry)* git_treebuilder_get (
    git_treebuilder* bld,
    const(char)* filename);

int git_treebuilder_insert (
    const(git_tree_entry*)* out_,
    git_treebuilder* bld,
    const(char)* filename,
    const(git_oid)* id,
    git_filemode_t filemode);

int git_treebuilder_remove (git_treebuilder* bld, const(char)* filename);

alias git_treebuilder_filter_cb = int function (
    const(git_tree_entry)* entry,
    void* payload);

int git_treebuilder_filter (
    git_treebuilder* bld,
    git_treebuilder_filter_cb filter,
    void* payload);

int git_treebuilder_write (git_oid* id, git_treebuilder* bld);

alias git_treewalk_cb = int function (
    const(char)* root,
    const(git_tree_entry)* entry,
    void* payload);

enum git_treewalk_mode
{
    GIT_TREEWALK_PRE = 0,
    GIT_TREEWALK_POST = 1
}

alias GIT_TREEWALK_PRE = git_treewalk_mode.GIT_TREEWALK_PRE;
alias GIT_TREEWALK_POST = git_treewalk_mode.GIT_TREEWALK_POST;

int git_tree_walk (
    const(git_tree)* tree,
    git_treewalk_mode mode,
    git_treewalk_cb callback,
    void* payload);

int git_tree_dup (git_tree** out_, git_tree* source);

enum git_tree_update_t
{
    GIT_TREE_UPDATE_UPSERT = 0,

    GIT_TREE_UPDATE_REMOVE = 1
}

alias GIT_TREE_UPDATE_UPSERT = git_tree_update_t.GIT_TREE_UPDATE_UPSERT;
alias GIT_TREE_UPDATE_REMOVE = git_tree_update_t.GIT_TREE_UPDATE_REMOVE;

struct git_tree_update
{
    git_tree_update_t action;

    git_oid id;

    git_filemode_t filemode;

    const(char)* path;
}

int git_tree_create_updated (git_oid* out_, scope git_repository* repo, git_tree* baseline, size_t nupdates, const(git_tree_update)* updates);

struct git_strarray
{
    char** strings;
    size_t count;
}

void git_strarray_dispose (scope ref git_strarray array);

int git_reference_lookup (git_reference** out_, scope git_repository* repo, const(char)* name);

int git_reference_name_to_id (
    git_oid* out_,
    scope git_repository* repo,
    const(char)* name);

int git_reference_dwim (git_reference** out_, scope git_repository* repo, const(char)* shorthand);

int git_reference_symbolic_create_matching (git_reference** out_, scope git_repository* repo, const(char)* name, const(char)* target, int force, const(char)* current_value, const(char)* log_message);

int git_reference_symbolic_create (git_reference** out_, scope git_repository* repo, const(char)* name, const(char)* target, int force, const(char)* log_message);

int git_reference_create (git_reference** out_, scope git_repository* repo, const(char)* name, const(git_oid)* id, int force, const(char)* log_message);

int git_reference_create_matching (git_reference** out_, scope git_repository* repo, const(char)* name, const(git_oid)* id, int force, const(git_oid)* current_id, const(char)* log_message);

const(git_oid)* git_reference_target (const(git_reference)* ref_);

const(git_oid)* git_reference_target_peel (const(git_reference)* ref_);

const(char)* git_reference_symbolic_target (const(git_reference)* ref_);

git_reference_t git_reference_type (const(git_reference)* ref_);

const(char)* git_reference_name (const(git_reference)* ref_);

int git_reference_resolve (git_reference** out_, const(git_reference)* ref_);

git_repository* git_reference_owner (const(git_reference)* ref_);

int git_reference_symbolic_set_target (
    git_reference** out_,
    git_reference* ref_,
    const(char)* target,
    const(char)* log_message);

int git_reference_set_target (
    git_reference** out_,
    git_reference* ref_,
    const(git_oid)* id,
    const(char)* log_message);

int git_reference_rename (
    git_reference** new_ref,
    git_reference* ref_,
    const(char)* new_name,
    int force,
    const(char)* log_message);

int git_reference_delete (git_reference* ref_);

int git_reference_remove (scope git_repository* repo, const(char)* name);

int git_reference_list (scope ref git_strarray array, scope git_repository* repo);

alias git_reference_foreach_cb = int function (git_reference* reference, void* payload);

alias git_reference_foreach_name_cb = int function (const(char)* name, void* payload);

int git_reference_foreach (
    scope git_repository* repo,
    git_reference_foreach_cb callback,
    void* payload);

int git_reference_foreach_name (
    scope git_repository* repo,
    git_reference_foreach_name_cb callback,
    void* payload);

int git_reference_dup (git_reference** dest, git_reference* source);

void git_reference_free (git_reference* ref_);

int git_reference_cmp (const(git_reference)* ref1, const(git_reference)* ref2);

int git_reference_iterator_new (
    git_reference_iterator** out_,
    scope git_repository* repo);

int git_reference_iterator_glob_new (
    git_reference_iterator** out_,
    scope git_repository* repo,
    const(char)* glob);

int git_reference_next (git_reference** out_, git_reference_iterator* iter);

int git_reference_next_name (const(char*)* out_, git_reference_iterator* iter);

void git_reference_iterator_free (git_reference_iterator* iter);

int git_reference_foreach_glob (
    scope git_repository* repo,
    const(char)* glob,
    git_reference_foreach_name_cb callback,
    void* payload);

int git_reference_has_log (scope git_repository* repo, const(char)* refname);

int git_reference_ensure_log (scope git_repository* repo, const(char)* refname);

int git_reference_is_branch (const(git_reference)* ref_);

int git_reference_is_remote (const(git_reference)* ref_);

int git_reference_is_tag (const(git_reference)* ref_);

int git_reference_is_note (const(git_reference)* ref_);

enum git_reference_format_t
{
    GIT_REFERENCE_FORMAT_NORMAL = 0u,

    GIT_REFERENCE_FORMAT_ALLOW_ONELEVEL = 1u << 0,

    GIT_REFERENCE_FORMAT_REFSPEC_PATTERN = 1u << 1,

    GIT_REFERENCE_FORMAT_REFSPEC_SHORTHAND = 1u << 2
}

alias GIT_REFERENCE_FORMAT_NORMAL = git_reference_format_t.GIT_REFERENCE_FORMAT_NORMAL;
alias GIT_REFERENCE_FORMAT_ALLOW_ONELEVEL = git_reference_format_t.GIT_REFERENCE_FORMAT_ALLOW_ONELEVEL;
alias GIT_REFERENCE_FORMAT_REFSPEC_PATTERN = git_reference_format_t.GIT_REFERENCE_FORMAT_REFSPEC_PATTERN;
alias GIT_REFERENCE_FORMAT_REFSPEC_SHORTHAND = git_reference_format_t.GIT_REFERENCE_FORMAT_REFSPEC_SHORTHAND;

int git_reference_normalize_name (
    char* buffer_out,
    size_t buffer_size,
    const(char)* name,
    uint flags);

int git_reference_peel (
    scope out git_object* out_,
    const(git_reference)* ref_,
    git_object_t type);

int git_reference_name_is_valid (out int valid, const(char)* refname);

const(char)* git_reference_shorthand (const(git_reference)* ref_);

enum git_diff_option_t
{
    GIT_DIFF_NORMAL = 0,

    GIT_DIFF_REVERSE = 1u << 0,

    GIT_DIFF_INCLUDE_IGNORED = 1u << 1,

    GIT_DIFF_RECURSE_IGNORED_DIRS = 1u << 2,

    GIT_DIFF_INCLUDE_UNTRACKED = 1u << 3,

    GIT_DIFF_RECURSE_UNTRACKED_DIRS = 1u << 4,

    GIT_DIFF_INCLUDE_UNMODIFIED = 1u << 5,

    GIT_DIFF_INCLUDE_TYPECHANGE = 1u << 6,

    GIT_DIFF_INCLUDE_TYPECHANGE_TREES = 1u << 7,

    GIT_DIFF_IGNORE_FILEMODE = 1u << 8,

    GIT_DIFF_IGNORE_SUBMODULES = 1u << 9,

    GIT_DIFF_IGNORE_CASE = 1u << 10,

    GIT_DIFF_INCLUDE_CASECHANGE = 1u << 11,

    GIT_DIFF_DISABLE_PATHSPEC_MATCH = 1u << 12,

    GIT_DIFF_SKIP_BINARY_CHECK = 1u << 13,

    GIT_DIFF_ENABLE_FAST_UNTRACKED_DIRS = 1u << 14,

    GIT_DIFF_UPDATE_INDEX = 1u << 15,

    GIT_DIFF_INCLUDE_UNREADABLE = 1u << 16,

    GIT_DIFF_INCLUDE_UNREADABLE_AS_UNTRACKED = 1u << 17,

    GIT_DIFF_INDENT_HEURISTIC = 1u << 18,

    GIT_DIFF_IGNORE_BLANK_LINES = 1u << 19,

    GIT_DIFF_FORCE_TEXT = 1u << 20,

    GIT_DIFF_FORCE_BINARY = 1u << 21,

    GIT_DIFF_IGNORE_WHITESPACE = 1u << 22,

    GIT_DIFF_IGNORE_WHITESPACE_CHANGE = 1u << 23,

    GIT_DIFF_IGNORE_WHITESPACE_EOL = 1u << 24,

    GIT_DIFF_SHOW_UNTRACKED_CONTENT = 1u << 25,

    GIT_DIFF_SHOW_UNMODIFIED = 1u << 26,

    GIT_DIFF_PATIENCE = 1u << 28,

    GIT_DIFF_MINIMAL = 1u << 29,

    GIT_DIFF_SHOW_BINARY = 1u << 30
}

alias GIT_DIFF_NORMAL = git_diff_option_t.GIT_DIFF_NORMAL;
alias GIT_DIFF_REVERSE = git_diff_option_t.GIT_DIFF_REVERSE;
alias GIT_DIFF_INCLUDE_IGNORED = git_diff_option_t.GIT_DIFF_INCLUDE_IGNORED;
alias GIT_DIFF_RECURSE_IGNORED_DIRS = git_diff_option_t.GIT_DIFF_RECURSE_IGNORED_DIRS;
alias GIT_DIFF_INCLUDE_UNTRACKED = git_diff_option_t.GIT_DIFF_INCLUDE_UNTRACKED;
alias GIT_DIFF_RECURSE_UNTRACKED_DIRS = git_diff_option_t.GIT_DIFF_RECURSE_UNTRACKED_DIRS;
alias GIT_DIFF_INCLUDE_UNMODIFIED = git_diff_option_t.GIT_DIFF_INCLUDE_UNMODIFIED;
alias GIT_DIFF_INCLUDE_TYPECHANGE = git_diff_option_t.GIT_DIFF_INCLUDE_TYPECHANGE;
alias GIT_DIFF_INCLUDE_TYPECHANGE_TREES = git_diff_option_t.GIT_DIFF_INCLUDE_TYPECHANGE_TREES;
alias GIT_DIFF_IGNORE_FILEMODE = git_diff_option_t.GIT_DIFF_IGNORE_FILEMODE;
alias GIT_DIFF_IGNORE_SUBMODULES = git_diff_option_t.GIT_DIFF_IGNORE_SUBMODULES;
alias GIT_DIFF_IGNORE_CASE = git_diff_option_t.GIT_DIFF_IGNORE_CASE;
alias GIT_DIFF_INCLUDE_CASECHANGE = git_diff_option_t.GIT_DIFF_INCLUDE_CASECHANGE;
alias GIT_DIFF_DISABLE_PATHSPEC_MATCH = git_diff_option_t.GIT_DIFF_DISABLE_PATHSPEC_MATCH;
alias GIT_DIFF_SKIP_BINARY_CHECK = git_diff_option_t.GIT_DIFF_SKIP_BINARY_CHECK;
alias GIT_DIFF_ENABLE_FAST_UNTRACKED_DIRS = git_diff_option_t.GIT_DIFF_ENABLE_FAST_UNTRACKED_DIRS;
alias GIT_DIFF_UPDATE_INDEX = git_diff_option_t.GIT_DIFF_UPDATE_INDEX;
alias GIT_DIFF_INCLUDE_UNREADABLE = git_diff_option_t.GIT_DIFF_INCLUDE_UNREADABLE;
alias GIT_DIFF_INCLUDE_UNREADABLE_AS_UNTRACKED = git_diff_option_t.GIT_DIFF_INCLUDE_UNREADABLE_AS_UNTRACKED;
alias GIT_DIFF_INDENT_HEURISTIC = git_diff_option_t.GIT_DIFF_INDENT_HEURISTIC;
alias GIT_DIFF_IGNORE_BLANK_LINES = git_diff_option_t.GIT_DIFF_IGNORE_BLANK_LINES;
alias GIT_DIFF_FORCE_TEXT = git_diff_option_t.GIT_DIFF_FORCE_TEXT;
alias GIT_DIFF_FORCE_BINARY = git_diff_option_t.GIT_DIFF_FORCE_BINARY;
alias GIT_DIFF_IGNORE_WHITESPACE = git_diff_option_t.GIT_DIFF_IGNORE_WHITESPACE;
alias GIT_DIFF_IGNORE_WHITESPACE_CHANGE = git_diff_option_t.GIT_DIFF_IGNORE_WHITESPACE_CHANGE;
alias GIT_DIFF_IGNORE_WHITESPACE_EOL = git_diff_option_t.GIT_DIFF_IGNORE_WHITESPACE_EOL;
alias GIT_DIFF_SHOW_UNTRACKED_CONTENT = git_diff_option_t.GIT_DIFF_SHOW_UNTRACKED_CONTENT;
alias GIT_DIFF_SHOW_UNMODIFIED = git_diff_option_t.GIT_DIFF_SHOW_UNMODIFIED;
alias GIT_DIFF_PATIENCE = git_diff_option_t.GIT_DIFF_PATIENCE;
alias GIT_DIFF_MINIMAL = git_diff_option_t.GIT_DIFF_MINIMAL;
alias GIT_DIFF_SHOW_BINARY = git_diff_option_t.GIT_DIFF_SHOW_BINARY;

struct git_diff;

enum git_diff_flag_t
{
    GIT_DIFF_FLAG_BINARY = 1u << 0,
    GIT_DIFF_FLAG_NOT_BINARY = 1u << 1,
    GIT_DIFF_FLAG_VALID_ID = 1u << 2,
    GIT_DIFF_FLAG_EXISTS = 1u << 3,
    GIT_DIFF_FLAG_VALID_SIZE = 1u << 4
}

alias GIT_DIFF_FLAG_BINARY = git_diff_flag_t.GIT_DIFF_FLAG_BINARY;
alias GIT_DIFF_FLAG_NOT_BINARY = git_diff_flag_t.GIT_DIFF_FLAG_NOT_BINARY;
alias GIT_DIFF_FLAG_VALID_ID = git_diff_flag_t.GIT_DIFF_FLAG_VALID_ID;
alias GIT_DIFF_FLAG_EXISTS = git_diff_flag_t.GIT_DIFF_FLAG_EXISTS;
alias GIT_DIFF_FLAG_VALID_SIZE = git_diff_flag_t.GIT_DIFF_FLAG_VALID_SIZE;

enum git_delta_t
{
    GIT_DELTA_UNMODIFIED = 0,
    GIT_DELTA_ADDED = 1,
    GIT_DELTA_DELETED = 2,
    GIT_DELTA_MODIFIED = 3,
    GIT_DELTA_RENAMED = 4,
    GIT_DELTA_COPIED = 5,
    GIT_DELTA_IGNORED = 6,
    GIT_DELTA_UNTRACKED = 7,
    GIT_DELTA_TYPECHANGE = 8,
    GIT_DELTA_UNREADABLE = 9,
    GIT_DELTA_CONFLICTED = 10
}

alias GIT_DELTA_UNMODIFIED = git_delta_t.GIT_DELTA_UNMODIFIED;
alias GIT_DELTA_ADDED = git_delta_t.GIT_DELTA_ADDED;
alias GIT_DELTA_DELETED = git_delta_t.GIT_DELTA_DELETED;
alias GIT_DELTA_MODIFIED = git_delta_t.GIT_DELTA_MODIFIED;
alias GIT_DELTA_RENAMED = git_delta_t.GIT_DELTA_RENAMED;
alias GIT_DELTA_COPIED = git_delta_t.GIT_DELTA_COPIED;
alias GIT_DELTA_IGNORED = git_delta_t.GIT_DELTA_IGNORED;
alias GIT_DELTA_UNTRACKED = git_delta_t.GIT_DELTA_UNTRACKED;
alias GIT_DELTA_TYPECHANGE = git_delta_t.GIT_DELTA_TYPECHANGE;
alias GIT_DELTA_UNREADABLE = git_delta_t.GIT_DELTA_UNREADABLE;
alias GIT_DELTA_CONFLICTED = git_delta_t.GIT_DELTA_CONFLICTED;

struct git_diff_file
{
    git_oid id;

    const(char)* path;

    git_object_size_t size;

    uint flags;

    ushort mode;

    ushort id_abbrev;
}

struct git_diff_delta
{
    git_delta_t status;
    uint flags;
    ushort similarity;
    ushort nfiles;
    git_diff_file old_file;
    git_diff_file new_file;
}

alias git_diff_notify_cb = int function (
    const(git_diff)* diff_so_far,
    const(git_diff_delta)* delta_to_add,
    const(char)* matched_pathspec,
    void* payload);

alias git_diff_progress_cb = int function (
    const(git_diff)* diff_so_far,
    const(char)* old_path,
    const(char)* new_path,
    void* payload);

struct git_diff_options
{
    uint version_;

    uint flags;

    git_submodule_ignore_t ignore_submodules;

    git_strarray pathspec;

    git_diff_notify_cb notify_cb;

    git_diff_progress_cb progress_cb;

    void* payload;

    uint context_lines;

    uint interhunk_lines;

    git_oid_t oid_type;

    ushort id_abbrev;

    git_off_t max_size;

    const(char)* old_prefix;

    const(char)* new_prefix;
}

int git_diff_options_init (scope ref git_diff_options opts, uint version_);

alias git_diff_file_cb = int function (
    const(git_diff_delta)* delta,
    float progress,
    void* payload);

enum git_diff_binary_t
{
    GIT_DIFF_BINARY_NONE = 0,

    GIT_DIFF_BINARY_LITERAL = 1,

    GIT_DIFF_BINARY_DELTA = 2
}

alias GIT_DIFF_BINARY_NONE = git_diff_binary_t.GIT_DIFF_BINARY_NONE;
alias GIT_DIFF_BINARY_LITERAL = git_diff_binary_t.GIT_DIFF_BINARY_LITERAL;
alias GIT_DIFF_BINARY_DELTA = git_diff_binary_t.GIT_DIFF_BINARY_DELTA;

struct git_diff_binary_file
{
    git_diff_binary_t type;

    const(char)* data;

    size_t datalen;

    size_t inflatedlen;
}

struct git_diff_binary
{
    uint contains_data;
    git_diff_binary_file old_file;
    git_diff_binary_file new_file;
}

alias git_diff_binary_cb = int function (
    const(git_diff_delta)* delta,
    const(git_diff_binary)* binary,
    void* payload);

struct git_diff_hunk
{
    int old_start;
    int old_lines;
    int new_start;
    int new_lines;
    size_t header_len;
    char[128] header;
}

alias git_diff_hunk_cb = int function (
    const(git_diff_delta)* delta,
    const(git_diff_hunk)* hunk,
    void* payload);

enum git_diff_line_t
{
    GIT_DIFF_LINE_CONTEXT = ' ',
    GIT_DIFF_LINE_ADDITION = '+',
    GIT_DIFF_LINE_DELETION = '-',

    GIT_DIFF_LINE_CONTEXT_EOFNL = '=',
    GIT_DIFF_LINE_ADD_EOFNL = '>',
    GIT_DIFF_LINE_DEL_EOFNL = '<',

    GIT_DIFF_LINE_FILE_HDR = 'F',
    GIT_DIFF_LINE_HUNK_HDR = 'H',
    GIT_DIFF_LINE_BINARY = 'B'
}

alias GIT_DIFF_LINE_CONTEXT = git_diff_line_t.GIT_DIFF_LINE_CONTEXT;
alias GIT_DIFF_LINE_ADDITION = git_diff_line_t.GIT_DIFF_LINE_ADDITION;
alias GIT_DIFF_LINE_DELETION = git_diff_line_t.GIT_DIFF_LINE_DELETION;
alias GIT_DIFF_LINE_CONTEXT_EOFNL = git_diff_line_t.GIT_DIFF_LINE_CONTEXT_EOFNL;
alias GIT_DIFF_LINE_ADD_EOFNL = git_diff_line_t.GIT_DIFF_LINE_ADD_EOFNL;
alias GIT_DIFF_LINE_DEL_EOFNL = git_diff_line_t.GIT_DIFF_LINE_DEL_EOFNL;
alias GIT_DIFF_LINE_FILE_HDR = git_diff_line_t.GIT_DIFF_LINE_FILE_HDR;
alias GIT_DIFF_LINE_HUNK_HDR = git_diff_line_t.GIT_DIFF_LINE_HUNK_HDR;
alias GIT_DIFF_LINE_BINARY = git_diff_line_t.GIT_DIFF_LINE_BINARY;

struct git_diff_line
{
    char origin;
    int old_lineno;
    int new_lineno;
    int num_lines;
    size_t content_len;
    git_off_t content_offset;
    const(char)* content;
}

alias git_diff_line_cb = int function (
    const(git_diff_delta)* delta,
    const(git_diff_hunk)* hunk,
    const(git_diff_line)* line,
    void* payload);

enum git_diff_find_t
{
    GIT_DIFF_FIND_BY_CONFIG = 0,

    GIT_DIFF_FIND_RENAMES = 1u << 0,

    GIT_DIFF_FIND_RENAMES_FROM_REWRITES = 1u << 1,

    GIT_DIFF_FIND_COPIES = 1u << 2,

    GIT_DIFF_FIND_COPIES_FROM_UNMODIFIED = 1u << 3,

    GIT_DIFF_FIND_REWRITES = 1u << 4,

    GIT_DIFF_BREAK_REWRITES = 1u << 5,

    GIT_DIFF_FIND_AND_BREAK_REWRITES = GIT_DIFF_FIND_REWRITES | GIT_DIFF_BREAK_REWRITES,

    GIT_DIFF_FIND_FOR_UNTRACKED = 1u << 6,

    GIT_DIFF_FIND_ALL = 0x0ff,

    GIT_DIFF_FIND_IGNORE_LEADING_WHITESPACE = 0,

    GIT_DIFF_FIND_IGNORE_WHITESPACE = 1u << 12,

    GIT_DIFF_FIND_DONT_IGNORE_WHITESPACE = 1u << 13,

    GIT_DIFF_FIND_EXACT_MATCH_ONLY = 1u << 14,

    GIT_DIFF_BREAK_REWRITES_FOR_RENAMES_ONLY = 1u << 15,

    GIT_DIFF_FIND_REMOVE_UNMODIFIED = 1u << 16
}

alias GIT_DIFF_FIND_BY_CONFIG = git_diff_find_t.GIT_DIFF_FIND_BY_CONFIG;
alias GIT_DIFF_FIND_RENAMES = git_diff_find_t.GIT_DIFF_FIND_RENAMES;
alias GIT_DIFF_FIND_RENAMES_FROM_REWRITES = git_diff_find_t.GIT_DIFF_FIND_RENAMES_FROM_REWRITES;
alias GIT_DIFF_FIND_COPIES = git_diff_find_t.GIT_DIFF_FIND_COPIES;
alias GIT_DIFF_FIND_COPIES_FROM_UNMODIFIED = git_diff_find_t.GIT_DIFF_FIND_COPIES_FROM_UNMODIFIED;
alias GIT_DIFF_FIND_REWRITES = git_diff_find_t.GIT_DIFF_FIND_REWRITES;
alias GIT_DIFF_BREAK_REWRITES = git_diff_find_t.GIT_DIFF_BREAK_REWRITES;
alias GIT_DIFF_FIND_AND_BREAK_REWRITES = git_diff_find_t.GIT_DIFF_FIND_AND_BREAK_REWRITES;
alias GIT_DIFF_FIND_FOR_UNTRACKED = git_diff_find_t.GIT_DIFF_FIND_FOR_UNTRACKED;
alias GIT_DIFF_FIND_ALL = git_diff_find_t.GIT_DIFF_FIND_ALL;
alias GIT_DIFF_FIND_IGNORE_LEADING_WHITESPACE = git_diff_find_t.GIT_DIFF_FIND_IGNORE_LEADING_WHITESPACE;
alias GIT_DIFF_FIND_IGNORE_WHITESPACE = git_diff_find_t.GIT_DIFF_FIND_IGNORE_WHITESPACE;
alias GIT_DIFF_FIND_DONT_IGNORE_WHITESPACE = git_diff_find_t.GIT_DIFF_FIND_DONT_IGNORE_WHITESPACE;
alias GIT_DIFF_FIND_EXACT_MATCH_ONLY = git_diff_find_t.GIT_DIFF_FIND_EXACT_MATCH_ONLY;
alias GIT_DIFF_BREAK_REWRITES_FOR_RENAMES_ONLY = git_diff_find_t.GIT_DIFF_BREAK_REWRITES_FOR_RENAMES_ONLY;
alias GIT_DIFF_FIND_REMOVE_UNMODIFIED = git_diff_find_t.GIT_DIFF_FIND_REMOVE_UNMODIFIED;

struct git_diff_similarity_metric
{
    int function (
        void** out_,
        const(git_diff_file)* file,
        const(char)* fullpath,
        void* payload) file_signature;
    int function (
        void** out_,
        const(git_diff_file)* file,
        const(char)* buf,
        size_t buflen,
        void* payload) buffer_signature;
    void function (void* sig, void* payload) free_signature;
    int function (int* score, void* siga, void* sigb, void* payload) similarity;
    void* payload;
}

struct git_diff_find_options
{
    uint version_;

    uint flags;

    ushort rename_threshold;

    ushort rename_from_rewrite_threshold;

    ushort copy_threshold;

    ushort break_rewrite_threshold;

    size_t rename_limit;

    git_diff_similarity_metric* metric;
}

int git_diff_find_options_init (scope ref git_diff_find_options opts, uint version_);

void git_diff_free (git_diff* diff);

int git_diff_tree_to_tree (
    git_diff** diff,
    scope git_repository* repo,
    git_tree* old_tree,
    git_tree* new_tree,
    scope const ref git_diff_options opts);

int git_diff_tree_to_index (
    git_diff** diff,
    scope git_repository* repo,
    git_tree* old_tree,
    git_index* index,
    scope const ref git_diff_options opts);

int git_diff_index_to_workdir (
    git_diff** diff,
    scope git_repository* repo,
    git_index* index,
    scope const ref git_diff_options opts);

int git_diff_tree_to_workdir (
    git_diff** diff,
    scope git_repository* repo,
    git_tree* old_tree,
    scope const ref git_diff_options opts);

int git_diff_tree_to_workdir_with_index (
    git_diff** diff,
    scope git_repository* repo,
    git_tree* old_tree,
    scope const ref git_diff_options opts);

int git_diff_index_to_index (
    git_diff** diff,
    scope git_repository* repo,
    git_index* old_index,
    git_index* new_index,
    scope const ref git_diff_options opts);

int git_diff_merge (git_diff* onto, const(git_diff)* from);

int git_diff_find_similar (
    git_diff* diff,
    scope const ref git_diff_find_options options);

size_t git_diff_num_deltas (const(git_diff)* diff);

size_t git_diff_num_deltas_of_type (const(git_diff)* diff, git_delta_t type);

const(git_diff_delta)* git_diff_get_delta (const(git_diff)* diff, size_t idx);

int git_diff_is_sorted_icase (const(git_diff)* diff);

int git_diff_foreach (
    git_diff* diff,
    git_diff_file_cb file_cb,
    git_diff_binary_cb binary_cb,
    git_diff_hunk_cb hunk_cb,
    git_diff_line_cb line_cb,
    void* payload);

char git_diff_status_char (git_delta_t status);

enum git_diff_format_t
{
    GIT_DIFF_FORMAT_PATCH = 1u,
    GIT_DIFF_FORMAT_PATCH_HEADER = 2u,
    GIT_DIFF_FORMAT_RAW = 3u,
    GIT_DIFF_FORMAT_NAME_ONLY = 4u,
    GIT_DIFF_FORMAT_NAME_STATUS = 5u,
    GIT_DIFF_FORMAT_PATCH_ID = 6u
}

alias GIT_DIFF_FORMAT_PATCH = git_diff_format_t.GIT_DIFF_FORMAT_PATCH;
alias GIT_DIFF_FORMAT_PATCH_HEADER = git_diff_format_t.GIT_DIFF_FORMAT_PATCH_HEADER;
alias GIT_DIFF_FORMAT_RAW = git_diff_format_t.GIT_DIFF_FORMAT_RAW;
alias GIT_DIFF_FORMAT_NAME_ONLY = git_diff_format_t.GIT_DIFF_FORMAT_NAME_ONLY;
alias GIT_DIFF_FORMAT_NAME_STATUS = git_diff_format_t.GIT_DIFF_FORMAT_NAME_STATUS;
alias GIT_DIFF_FORMAT_PATCH_ID = git_diff_format_t.GIT_DIFF_FORMAT_PATCH_ID;

int git_diff_print (
    git_diff* diff,
    git_diff_format_t format,
    git_diff_line_cb print_cb,
    void* payload);

int git_diff_to_buf (git_buf* out_, git_diff* diff, git_diff_format_t format);

int git_diff_blobs (
    const(git_blob)* old_blob,
    const(char)* old_as_path,
    const(git_blob)* new_blob,
    const(char)* new_as_path,
    scope const ref git_diff_options options,
    git_diff_file_cb file_cb,
    git_diff_binary_cb binary_cb,
    git_diff_hunk_cb hunk_cb,
    git_diff_line_cb line_cb,
    void* payload);

int git_diff_blob_to_buffer (
    const(git_blob)* old_blob,
    const(char)* old_as_path,
    const(char)* buffer,
    size_t buffer_len,
    const(char)* buffer_as_path,
    scope const ref git_diff_options options,
    git_diff_file_cb file_cb,
    git_diff_binary_cb binary_cb,
    git_diff_hunk_cb hunk_cb,
    git_diff_line_cb line_cb,
    void* payload);

int git_diff_buffers (
    const(void)* old_buffer,
    size_t old_len,
    const(char)* old_as_path,
    const(void)* new_buffer,
    size_t new_len,
    const(char)* new_as_path,
    scope const ref git_diff_options options,
    git_diff_file_cb file_cb,
    git_diff_binary_cb binary_cb,
    git_diff_hunk_cb hunk_cb,
    git_diff_line_cb line_cb,
    void* payload);

struct git_diff_parse_options
{
    uint version_;
    git_oid_t oid_type;
}

int git_diff_from_buffer (
    git_diff** out_,
    const(char)* content,
    size_t content_len);

struct git_diff_stats;

enum git_diff_stats_format_t
{
    GIT_DIFF_STATS_NONE = 0,

    GIT_DIFF_STATS_FULL = 1u << 0,

    GIT_DIFF_STATS_SHORT = 1u << 1,

    GIT_DIFF_STATS_NUMBER = 1u << 2,

    GIT_DIFF_STATS_INCLUDE_SUMMARY = 1u << 3
}

alias GIT_DIFF_STATS_NONE = git_diff_stats_format_t.GIT_DIFF_STATS_NONE;
alias GIT_DIFF_STATS_FULL = git_diff_stats_format_t.GIT_DIFF_STATS_FULL;
alias GIT_DIFF_STATS_SHORT = git_diff_stats_format_t.GIT_DIFF_STATS_SHORT;
alias GIT_DIFF_STATS_NUMBER = git_diff_stats_format_t.GIT_DIFF_STATS_NUMBER;
alias GIT_DIFF_STATS_INCLUDE_SUMMARY = git_diff_stats_format_t.GIT_DIFF_STATS_INCLUDE_SUMMARY;

int git_diff_get_stats (git_diff_stats** out_, git_diff* diff);

size_t git_diff_stats_files_changed (const(git_diff_stats)* stats);

size_t git_diff_stats_insertions (const(git_diff_stats)* stats);

size_t git_diff_stats_deletions (const(git_diff_stats)* stats);

int git_diff_stats_to_buf (
    git_buf* out_,
    const(git_diff_stats)* stats,
    git_diff_stats_format_t format,
    size_t width);

void git_diff_stats_free (git_diff_stats* stats);

struct git_diff_patchid_options
{
    uint version_;
}

int git_diff_patchid_options_init (
    scope ref git_diff_patchid_options opts,
    uint version_);

int git_diff_patchid (git_oid* out_, git_diff* diff, scope ref git_diff_patchid_options opts);

alias git_apply_delta_cb = int function (
    const(git_diff_delta)* delta,
    void* payload);

alias git_apply_hunk_cb = int function (
    const(git_diff_hunk)* hunk,
    void* payload);

enum git_apply_flags_t
{
    GIT_APPLY_CHECK = 1 << 0
}

alias GIT_APPLY_CHECK = git_apply_flags_t.GIT_APPLY_CHECK;

struct git_apply_options
{
    uint version_;

    git_apply_delta_cb delta_cb;

    git_apply_hunk_cb hunk_cb;

    void* payload;

    uint flags;
}

int git_apply_options_init (scope ref git_apply_options opts, uint version_);

int git_apply_to_tree (
    git_index** out_,
    scope git_repository* repo,
    git_tree* preimage,
    git_diff* diff,
    scope const ref git_apply_options options);

enum git_apply_location_t
{
    GIT_APPLY_LOCATION_WORKDIR = 0,

    GIT_APPLY_LOCATION_INDEX = 1,

    GIT_APPLY_LOCATION_BOTH = 2
}

alias GIT_APPLY_LOCATION_WORKDIR = git_apply_location_t.GIT_APPLY_LOCATION_WORKDIR;
alias GIT_APPLY_LOCATION_INDEX = git_apply_location_t.GIT_APPLY_LOCATION_INDEX;
alias GIT_APPLY_LOCATION_BOTH = git_apply_location_t.GIT_APPLY_LOCATION_BOTH;

int git_apply (
    scope git_repository* repo,
    git_diff* diff,
    git_apply_location_t location,
    scope const ref git_apply_options options);

enum git_attr_value_t
{
    GIT_ATTR_VALUE_UNSPECIFIED = 0,
    GIT_ATTR_VALUE_TRUE = 1,
    GIT_ATTR_VALUE_FALSE = 2,
    GIT_ATTR_VALUE_STRING = 3
}

alias GIT_ATTR_VALUE_UNSPECIFIED = git_attr_value_t.GIT_ATTR_VALUE_UNSPECIFIED;
alias GIT_ATTR_VALUE_TRUE = git_attr_value_t.GIT_ATTR_VALUE_TRUE;
alias GIT_ATTR_VALUE_FALSE = git_attr_value_t.GIT_ATTR_VALUE_FALSE;
alias GIT_ATTR_VALUE_STRING = git_attr_value_t.GIT_ATTR_VALUE_STRING;

git_attr_value_t git_attr_value (const(char)* attr);

struct git_attr_options
{
    uint version_;

    uint flags;

    git_oid* commit_id;

    git_oid attr_commit_id;
}

int git_attr_get (
    const(char*)* value_out,
    scope git_repository* repo,
    uint flags,
    const(char)* path,
    const(char)* name);

int git_attr_get_ext (
    const(char*)* value_out,
    scope git_repository* repo,
    scope ref git_attr_options opts,
    const(char)* path,
    const(char)* name);

int git_attr_get_many (
    const(char*)* values_out,
    scope git_repository* repo,
    uint flags,
    const(char)* path,
    size_t num_attr,
    const(char*)* names);

int git_attr_get_many_ext (
    const(char*)* values_out,
    scope git_repository* repo,
    scope ref git_attr_options opts,
    const(char)* path,
    size_t num_attr,
    const(char*)* names);

alias git_attr_foreach_cb = int function (const(char)* name, const(char)* value, void* payload);

int git_attr_foreach (
    scope git_repository* repo,
    uint flags,
    const(char)* path,
    git_attr_foreach_cb callback,
    void* payload);

int git_attr_foreach_ext (
    scope git_repository* repo,
    scope ref git_attr_options opts,
    const(char)* path,
    git_attr_foreach_cb callback,
    void* payload);

int git_attr_cache_flush (scope git_repository* repo);

int git_attr_add_macro (
    scope git_repository* repo,
    const(char)* name,
    const(char)* values);

int git_blob_lookup (git_blob** blob, scope git_repository* repo, const(git_oid)* id);

int git_blob_lookup_prefix (git_blob** blob, scope git_repository* repo, const(git_oid)* id, size_t len);

void git_blob_free (git_blob* blob);

const(git_oid)* git_blob_id (const(git_blob)* blob);

git_repository* git_blob_owner (const(git_blob)* blob);

const(void)* git_blob_rawcontent (const(git_blob)* blob);

git_object_size_t git_blob_rawsize (const(git_blob)* blob);

enum git_blob_filter_flag_t
{
    GIT_BLOB_FILTER_CHECK_FOR_BINARY = 1 << 0,

    GIT_BLOB_FILTER_NO_SYSTEM_ATTRIBUTES = 1 << 1,

    GIT_BLOB_FILTER_ATTRIBUTES_FROM_HEAD = 1 << 2,

    GIT_BLOB_FILTER_ATTRIBUTES_FROM_COMMIT = 1 << 3
}

alias GIT_BLOB_FILTER_CHECK_FOR_BINARY = git_blob_filter_flag_t.GIT_BLOB_FILTER_CHECK_FOR_BINARY;
alias GIT_BLOB_FILTER_NO_SYSTEM_ATTRIBUTES = git_blob_filter_flag_t.GIT_BLOB_FILTER_NO_SYSTEM_ATTRIBUTES;
alias GIT_BLOB_FILTER_ATTRIBUTES_FROM_HEAD = git_blob_filter_flag_t.GIT_BLOB_FILTER_ATTRIBUTES_FROM_HEAD;
alias GIT_BLOB_FILTER_ATTRIBUTES_FROM_COMMIT = git_blob_filter_flag_t.GIT_BLOB_FILTER_ATTRIBUTES_FROM_COMMIT;

struct git_blob_filter_options
{
    int version_;

    uint flags;

    git_oid* commit_id;

    git_oid attr_commit_id;
}

int git_blob_filter_options_init (scope ref git_blob_filter_options opts, uint version_);

int git_blob_filter (
    git_buf* out_,
    git_blob* blob,
    const(char)* as_path,
    scope ref git_blob_filter_options opts);

int git_blob_create_from_workdir (git_oid* id, scope git_repository* repo, const(char)* relative_path);

int git_blob_create_from_disk (git_oid* id, scope git_repository* repo, const(char)* path);

int git_blob_create_from_stream (
    git_writestream** out_,
    scope git_repository* repo,
    const(char)* hintpath);

int git_blob_create_from_stream_commit (git_oid* out_, git_writestream* stream);

int git_blob_create_from_buffer (
    git_oid* id,
    scope git_repository* repo,
    const(void)* buffer,
    size_t len);

int git_blob_is_binary (const(git_blob)* blob);

int git_blob_data_is_binary (const(char)* data, size_t len);

int git_blob_dup (git_blob** out_, git_blob* source);

enum git_blame_flag_t
{
    GIT_BLAME_NORMAL = 0,

    GIT_BLAME_TRACK_COPIES_SAME_FILE = 1 << 0,

    GIT_BLAME_TRACK_COPIES_SAME_COMMIT_MOVES = 1 << 1,

    GIT_BLAME_TRACK_COPIES_SAME_COMMIT_COPIES = 1 << 2,

    GIT_BLAME_TRACK_COPIES_ANY_COMMIT_COPIES = 1 << 3,

    GIT_BLAME_FIRST_PARENT = 1 << 4,

    GIT_BLAME_USE_MAILMAP = 1 << 5,

    GIT_BLAME_IGNORE_WHITESPACE = 1 << 6
}

alias GIT_BLAME_NORMAL = git_blame_flag_t.GIT_BLAME_NORMAL;
alias GIT_BLAME_TRACK_COPIES_SAME_FILE = git_blame_flag_t.GIT_BLAME_TRACK_COPIES_SAME_FILE;
alias GIT_BLAME_TRACK_COPIES_SAME_COMMIT_MOVES = git_blame_flag_t.GIT_BLAME_TRACK_COPIES_SAME_COMMIT_MOVES;
alias GIT_BLAME_TRACK_COPIES_SAME_COMMIT_COPIES = git_blame_flag_t.GIT_BLAME_TRACK_COPIES_SAME_COMMIT_COPIES;
alias GIT_BLAME_TRACK_COPIES_ANY_COMMIT_COPIES = git_blame_flag_t.GIT_BLAME_TRACK_COPIES_ANY_COMMIT_COPIES;
alias GIT_BLAME_FIRST_PARENT = git_blame_flag_t.GIT_BLAME_FIRST_PARENT;
alias GIT_BLAME_USE_MAILMAP = git_blame_flag_t.GIT_BLAME_USE_MAILMAP;
alias GIT_BLAME_IGNORE_WHITESPACE = git_blame_flag_t.GIT_BLAME_IGNORE_WHITESPACE;

struct git_blame_options
{
    uint version_;

    uint flags;

    ushort min_match_characters;

    git_oid newest_commit;

    git_oid oldest_commit;

    size_t min_line;

    size_t max_line;
}

int git_blame_options_init (scope ref git_blame_options opts, uint version_);

struct git_blame_hunk
{
    size_t lines_in_hunk;

    git_oid final_commit_id;

    size_t final_start_line_number;

    git_signature* final_signature;

    git_oid orig_commit_id;

    const(char)* orig_path;

    size_t orig_start_line_number;

    git_signature* orig_signature;

    char boundary;
}

struct git_blame;

uint git_blame_get_hunk_count (git_blame* blame);

const(git_blame_hunk)* git_blame_get_hunk_byindex (
    git_blame* blame,
    uint index);

const(git_blame_hunk)* git_blame_get_hunk_byline (
    git_blame* blame,
    size_t lineno);

int git_blame_file (
    git_blame** out_,
    scope git_repository* repo,
    const(char)* path,
    scope ref git_blame_options options);

int git_blame_buffer (
    git_blame** out_,
    git_blame* reference,
    const(char)* buffer,
    size_t buffer_len);

void git_blame_free (git_blame* blame);

int git_branch_create (
    git_reference** out_,
    scope git_repository* repo,
    const(char)* branch_name,
    const(git_commit)* target,
    int force);

int git_branch_create_from_annotated (
    git_reference** ref_out,
    scope git_repository* repository,
    const(char)* branch_name,
    const(git_annotated_commit)* commit,
    int force);

int git_branch_delete (git_reference* branch);

struct git_branch_iterator;

int git_branch_iterator_new (
    git_branch_iterator** out_,
    scope git_repository* repo,
    git_branch_t list_flags);

int git_branch_next (git_reference** out_, git_branch_t* out_type, git_branch_iterator* iter);

void git_branch_iterator_free (git_branch_iterator* iter);

int git_branch_move (
    git_reference** out_,
    git_reference* branch,
    const(char)* new_branch_name,
    int force);

int git_branch_lookup (
    git_reference** out_,
    scope git_repository* repo,
    const(char)* branch_name,
    git_branch_t branch_type);

int git_branch_name (const(char*)* out_, const(git_reference)* ref_);

int git_branch_upstream (git_reference** out_, const(git_reference)* branch);

int git_branch_set_upstream (git_reference* branch, const(char)* branch_name);

int git_branch_upstream_name (
    git_buf* out_,
    scope git_repository* repo,
    const(char)* refname);

int git_branch_is_head (const(git_reference)* branch);

int git_branch_is_checked_out (const(git_reference)* branch);

int git_branch_remote_name (
    git_buf* out_,
    scope git_repository* repo,
    const(char)* refname);

int git_branch_upstream_remote (git_buf* buf, scope git_repository* repo, const(char)* refname);

int git_branch_upstream_merge (git_buf* buf, scope git_repository* repo, const(char)* refname);

int git_branch_name_is_valid (out int valid, const(char)* name);

enum git_cert_t
{
    GIT_CERT_NONE = 0,

    GIT_CERT_X509 = 1,

    GIT_CERT_HOSTKEY_LIBSSH2 = 2,

    GIT_CERT_STRARRAY = 3
}

alias GIT_CERT_NONE = git_cert_t.GIT_CERT_NONE;
alias GIT_CERT_X509 = git_cert_t.GIT_CERT_X509;
alias GIT_CERT_HOSTKEY_LIBSSH2 = git_cert_t.GIT_CERT_HOSTKEY_LIBSSH2;
alias GIT_CERT_STRARRAY = git_cert_t.GIT_CERT_STRARRAY;

struct git_cert
{
    git_cert_t cert_type;
}

alias git_transport_certificate_check_cb = int function (git_cert* cert, int valid, const(char)* host, void* payload);

enum git_cert_ssh_t
{
    GIT_CERT_SSH_MD5 = 1 << 0,

    GIT_CERT_SSH_SHA1 = 1 << 1,

    GIT_CERT_SSH_SHA256 = 1 << 2,

    GIT_CERT_SSH_RAW = 1 << 3
}

alias GIT_CERT_SSH_MD5 = git_cert_ssh_t.GIT_CERT_SSH_MD5;
alias GIT_CERT_SSH_SHA1 = git_cert_ssh_t.GIT_CERT_SSH_SHA1;
alias GIT_CERT_SSH_SHA256 = git_cert_ssh_t.GIT_CERT_SSH_SHA256;
alias GIT_CERT_SSH_RAW = git_cert_ssh_t.GIT_CERT_SSH_RAW;

enum git_cert_ssh_raw_type_t
{
    GIT_CERT_SSH_RAW_TYPE_UNKNOWN = 0,

    GIT_CERT_SSH_RAW_TYPE_RSA = 1,

    GIT_CERT_SSH_RAW_TYPE_DSS = 2,

    GIT_CERT_SSH_RAW_TYPE_KEY_ECDSA_256 = 3,

    GIT_CERT_SSH_RAW_TYPE_KEY_ECDSA_384 = 4,

    GIT_CERT_SSH_RAW_TYPE_KEY_ECDSA_521 = 5,

    GIT_CERT_SSH_RAW_TYPE_KEY_ED25519 = 6
}

alias GIT_CERT_SSH_RAW_TYPE_UNKNOWN = git_cert_ssh_raw_type_t.GIT_CERT_SSH_RAW_TYPE_UNKNOWN;
alias GIT_CERT_SSH_RAW_TYPE_RSA = git_cert_ssh_raw_type_t.GIT_CERT_SSH_RAW_TYPE_RSA;
alias GIT_CERT_SSH_RAW_TYPE_DSS = git_cert_ssh_raw_type_t.GIT_CERT_SSH_RAW_TYPE_DSS;
alias GIT_CERT_SSH_RAW_TYPE_KEY_ECDSA_256 = git_cert_ssh_raw_type_t.GIT_CERT_SSH_RAW_TYPE_KEY_ECDSA_256;
alias GIT_CERT_SSH_RAW_TYPE_KEY_ECDSA_384 = git_cert_ssh_raw_type_t.GIT_CERT_SSH_RAW_TYPE_KEY_ECDSA_384;
alias GIT_CERT_SSH_RAW_TYPE_KEY_ECDSA_521 = git_cert_ssh_raw_type_t.GIT_CERT_SSH_RAW_TYPE_KEY_ECDSA_521;
alias GIT_CERT_SSH_RAW_TYPE_KEY_ED25519 = git_cert_ssh_raw_type_t.GIT_CERT_SSH_RAW_TYPE_KEY_ED25519;

struct git_cert_hostkey
{
    git_cert parent;

    git_cert_ssh_t type;

    ubyte[16] hash_md5;

    ubyte[20] hash_sha1;

    ubyte[32] hash_sha256;

    git_cert_ssh_raw_type_t raw_type;

    const(char)* hostkey;

    size_t hostkey_len;
}

struct git_cert_x509
{
    git_cert parent;

    void* data;

    size_t len;
}

enum git_checkout_strategy_t
{
    GIT_CHECKOUT_NONE = 0,

    GIT_CHECKOUT_SAFE = 1u << 0,

    GIT_CHECKOUT_FORCE = 1u << 1,

    GIT_CHECKOUT_RECREATE_MISSING = 1u << 2,

    GIT_CHECKOUT_ALLOW_CONFLICTS = 1u << 4,

    GIT_CHECKOUT_REMOVE_UNTRACKED = 1u << 5,

    GIT_CHECKOUT_REMOVE_IGNORED = 1u << 6,

    GIT_CHECKOUT_UPDATE_ONLY = 1u << 7,

    GIT_CHECKOUT_DONT_UPDATE_INDEX = 1u << 8,

    GIT_CHECKOUT_NO_REFRESH = 1u << 9,

    GIT_CHECKOUT_SKIP_UNMERGED = 1u << 10,

    GIT_CHECKOUT_USE_OURS = 1u << 11,

    GIT_CHECKOUT_USE_THEIRS = 1u << 12,

    GIT_CHECKOUT_DISABLE_PATHSPEC_MATCH = 1u << 13,

    GIT_CHECKOUT_SKIP_LOCKED_DIRECTORIES = 1u << 18,

    GIT_CHECKOUT_DONT_OVERWRITE_IGNORED = 1u << 19,

    GIT_CHECKOUT_CONFLICT_STYLE_MERGE = 1u << 20,

    GIT_CHECKOUT_CONFLICT_STYLE_DIFF3 = 1u << 21,

    GIT_CHECKOUT_DONT_REMOVE_EXISTING = 1u << 22,

    GIT_CHECKOUT_DONT_WRITE_INDEX = 1u << 23,

    GIT_CHECKOUT_DRY_RUN = 1u << 24,

    GIT_CHECKOUT_CONFLICT_STYLE_ZDIFF3 = 1u << 25,

    GIT_CHECKOUT_UPDATE_SUBMODULES = 1u << 16,

    GIT_CHECKOUT_UPDATE_SUBMODULES_IF_CHANGED = 1u << 17
}

alias GIT_CHECKOUT_NONE = git_checkout_strategy_t.GIT_CHECKOUT_NONE;
alias GIT_CHECKOUT_SAFE = git_checkout_strategy_t.GIT_CHECKOUT_SAFE;
alias GIT_CHECKOUT_FORCE = git_checkout_strategy_t.GIT_CHECKOUT_FORCE;
alias GIT_CHECKOUT_RECREATE_MISSING = git_checkout_strategy_t.GIT_CHECKOUT_RECREATE_MISSING;
alias GIT_CHECKOUT_ALLOW_CONFLICTS = git_checkout_strategy_t.GIT_CHECKOUT_ALLOW_CONFLICTS;
alias GIT_CHECKOUT_REMOVE_UNTRACKED = git_checkout_strategy_t.GIT_CHECKOUT_REMOVE_UNTRACKED;
alias GIT_CHECKOUT_REMOVE_IGNORED = git_checkout_strategy_t.GIT_CHECKOUT_REMOVE_IGNORED;
alias GIT_CHECKOUT_UPDATE_ONLY = git_checkout_strategy_t.GIT_CHECKOUT_UPDATE_ONLY;
alias GIT_CHECKOUT_DONT_UPDATE_INDEX = git_checkout_strategy_t.GIT_CHECKOUT_DONT_UPDATE_INDEX;
alias GIT_CHECKOUT_NO_REFRESH = git_checkout_strategy_t.GIT_CHECKOUT_NO_REFRESH;
alias GIT_CHECKOUT_SKIP_UNMERGED = git_checkout_strategy_t.GIT_CHECKOUT_SKIP_UNMERGED;
alias GIT_CHECKOUT_USE_OURS = git_checkout_strategy_t.GIT_CHECKOUT_USE_OURS;
alias GIT_CHECKOUT_USE_THEIRS = git_checkout_strategy_t.GIT_CHECKOUT_USE_THEIRS;
alias GIT_CHECKOUT_DISABLE_PATHSPEC_MATCH = git_checkout_strategy_t.GIT_CHECKOUT_DISABLE_PATHSPEC_MATCH;
alias GIT_CHECKOUT_SKIP_LOCKED_DIRECTORIES = git_checkout_strategy_t.GIT_CHECKOUT_SKIP_LOCKED_DIRECTORIES;
alias GIT_CHECKOUT_DONT_OVERWRITE_IGNORED = git_checkout_strategy_t.GIT_CHECKOUT_DONT_OVERWRITE_IGNORED;
alias GIT_CHECKOUT_CONFLICT_STYLE_MERGE = git_checkout_strategy_t.GIT_CHECKOUT_CONFLICT_STYLE_MERGE;
alias GIT_CHECKOUT_CONFLICT_STYLE_DIFF3 = git_checkout_strategy_t.GIT_CHECKOUT_CONFLICT_STYLE_DIFF3;
alias GIT_CHECKOUT_DONT_REMOVE_EXISTING = git_checkout_strategy_t.GIT_CHECKOUT_DONT_REMOVE_EXISTING;
alias GIT_CHECKOUT_DONT_WRITE_INDEX = git_checkout_strategy_t.GIT_CHECKOUT_DONT_WRITE_INDEX;
alias GIT_CHECKOUT_DRY_RUN = git_checkout_strategy_t.GIT_CHECKOUT_DRY_RUN;
alias GIT_CHECKOUT_CONFLICT_STYLE_ZDIFF3 = git_checkout_strategy_t.GIT_CHECKOUT_CONFLICT_STYLE_ZDIFF3;
alias GIT_CHECKOUT_UPDATE_SUBMODULES = git_checkout_strategy_t.GIT_CHECKOUT_UPDATE_SUBMODULES;
alias GIT_CHECKOUT_UPDATE_SUBMODULES_IF_CHANGED = git_checkout_strategy_t.GIT_CHECKOUT_UPDATE_SUBMODULES_IF_CHANGED;

enum git_checkout_notify_t
{
    GIT_CHECKOUT_NOTIFY_NONE = 0,

    GIT_CHECKOUT_NOTIFY_CONFLICT = 1u << 0,

    GIT_CHECKOUT_NOTIFY_DIRTY = 1u << 1,

    GIT_CHECKOUT_NOTIFY_UPDATED = 1u << 2,

    GIT_CHECKOUT_NOTIFY_UNTRACKED = 1u << 3,

    GIT_CHECKOUT_NOTIFY_IGNORED = 1u << 4,

    GIT_CHECKOUT_NOTIFY_ALL = 0x0FFFFu
}

alias GIT_CHECKOUT_NOTIFY_NONE = git_checkout_notify_t.GIT_CHECKOUT_NOTIFY_NONE;
alias GIT_CHECKOUT_NOTIFY_CONFLICT = git_checkout_notify_t.GIT_CHECKOUT_NOTIFY_CONFLICT;
alias GIT_CHECKOUT_NOTIFY_DIRTY = git_checkout_notify_t.GIT_CHECKOUT_NOTIFY_DIRTY;
alias GIT_CHECKOUT_NOTIFY_UPDATED = git_checkout_notify_t.GIT_CHECKOUT_NOTIFY_UPDATED;
alias GIT_CHECKOUT_NOTIFY_UNTRACKED = git_checkout_notify_t.GIT_CHECKOUT_NOTIFY_UNTRACKED;
alias GIT_CHECKOUT_NOTIFY_IGNORED = git_checkout_notify_t.GIT_CHECKOUT_NOTIFY_IGNORED;
alias GIT_CHECKOUT_NOTIFY_ALL = git_checkout_notify_t.GIT_CHECKOUT_NOTIFY_ALL;

struct git_checkout_perfdata
{
    size_t mkdir_calls;
    size_t stat_calls;
    size_t chmod_calls;
}

alias git_checkout_notify_cb = int function (
    git_checkout_notify_t why,
    const(char)* path,
    const(git_diff_file)* baseline,
    const(git_diff_file)* target,
    const(git_diff_file)* workdir,
    void* payload);

alias git_checkout_progress_cb = void function (
    const(char)* path,
    size_t completed_steps,
    size_t total_steps,
    void* payload);

alias git_checkout_perfdata_cb = void function (
    const(git_checkout_perfdata)* perfdata,
    void* payload);

struct git_checkout_options
{
    uint version_;

    uint checkout_strategy;

    int disable_filters;
    uint dir_mode;
    uint file_mode;
    int file_open_flags;

    uint notify_flags;

    git_checkout_notify_cb notify_cb;

    void* notify_payload;

    git_checkout_progress_cb progress_cb;

    void* progress_payload;

    git_strarray paths;

    git_tree* baseline;

    git_index* baseline_index;

    const(char)* target_directory;

    const(char)* ancestor_label;
    const(char)* our_label;
    const(char)* their_label;

    git_checkout_perfdata_cb perfdata_cb;

    void* perfdata_payload;
}

int git_checkout_options_init (scope ref git_checkout_options opts, uint version_);

int git_checkout_head (scope git_repository* repo, scope const ref git_checkout_options opts);

int git_checkout_index (
    scope git_repository* repo,
    git_index* index,
    scope const ref git_checkout_options opts);

int git_checkout_tree (
    scope git_repository* repo,
    scope const(git_object)* treeish,
    scope const ref git_checkout_options opts);

struct git_oidarray
{
    git_oid* ids;
    size_t count;
}

void git_oidarray_dispose (git_oidarray* array);

struct git_indexer;

struct git_indexer_progress
{
    uint total_objects;

    uint indexed_objects;

    uint received_objects;

    uint local_objects;

    uint total_deltas;

    uint indexed_deltas;

    size_t received_bytes;
}

struct git_indexer_options
{
    uint version_;

    git_indexer_progress_cb progress_cb;

    void* progress_cb_payload;

    ubyte verify;
}

int git_indexer_options_init (scope ref git_indexer_options opts, uint version_);

int git_indexer_new (
    git_indexer** out_,
    const(char)* path,
    uint mode,
    git_odb* odb,
    scope ref git_indexer_options opts);

int git_indexer_append (git_indexer* idx, const(void)* data, size_t size, scope ref git_indexer_progress stats);

int git_indexer_commit (git_indexer* idx, scope ref git_indexer_progress stats);

const(git_oid)* git_indexer_hash (const(git_indexer)* idx);

const(char)* git_indexer_name (const(git_indexer)* idx);

void git_indexer_free (git_indexer* idx);

struct git_index_time
{
    int seconds;

    uint nanoseconds;
}

struct git_index_entry
{
    git_index_time ctime;
    git_index_time mtime;

    uint dev;
    uint ino;
    uint mode;
    uint uid;
    uint gid;
    uint file_size;

    git_oid id;

    ushort flags;
    ushort flags_extended;

    const(char)* path;
}

enum git_index_entry_flag_t
{
    GIT_INDEX_ENTRY_EXTENDED = 0x4000,
    GIT_INDEX_ENTRY_VALID = 0x8000
}

alias GIT_INDEX_ENTRY_EXTENDED = git_index_entry_flag_t.GIT_INDEX_ENTRY_EXTENDED;
alias GIT_INDEX_ENTRY_VALID = git_index_entry_flag_t.GIT_INDEX_ENTRY_VALID;

enum git_index_entry_extended_flag_t
{
    GIT_INDEX_ENTRY_INTENT_TO_ADD = 1 << 13,
    GIT_INDEX_ENTRY_SKIP_WORKTREE = 1 << 14,

    GIT_INDEX_ENTRY_EXTENDED_FLAGS = GIT_INDEX_ENTRY_INTENT_TO_ADD | GIT_INDEX_ENTRY_SKIP_WORKTREE,

    GIT_INDEX_ENTRY_UPTODATE = 1 << 2
}

alias GIT_INDEX_ENTRY_INTENT_TO_ADD = git_index_entry_extended_flag_t.GIT_INDEX_ENTRY_INTENT_TO_ADD;
alias GIT_INDEX_ENTRY_SKIP_WORKTREE = git_index_entry_extended_flag_t.GIT_INDEX_ENTRY_SKIP_WORKTREE;
alias GIT_INDEX_ENTRY_EXTENDED_FLAGS = git_index_entry_extended_flag_t.GIT_INDEX_ENTRY_EXTENDED_FLAGS;
alias GIT_INDEX_ENTRY_UPTODATE = git_index_entry_extended_flag_t.GIT_INDEX_ENTRY_UPTODATE;

enum git_index_capability_t
{
    GIT_INDEX_CAPABILITY_IGNORE_CASE = 1,
    GIT_INDEX_CAPABILITY_NO_FILEMODE = 2,
    GIT_INDEX_CAPABILITY_NO_SYMLINKS = 4,
    GIT_INDEX_CAPABILITY_FROM_OWNER = -1
}

alias GIT_INDEX_CAPABILITY_IGNORE_CASE = git_index_capability_t.GIT_INDEX_CAPABILITY_IGNORE_CASE;
alias GIT_INDEX_CAPABILITY_NO_FILEMODE = git_index_capability_t.GIT_INDEX_CAPABILITY_NO_FILEMODE;
alias GIT_INDEX_CAPABILITY_NO_SYMLINKS = git_index_capability_t.GIT_INDEX_CAPABILITY_NO_SYMLINKS;
alias GIT_INDEX_CAPABILITY_FROM_OWNER = git_index_capability_t.GIT_INDEX_CAPABILITY_FROM_OWNER;

alias git_index_matched_path_cb = int function (
    const(char)* path,
    const(char)* matched_pathspec,
    void* payload);

enum git_index_add_option_t
{
    GIT_INDEX_ADD_DEFAULT = 0,
    GIT_INDEX_ADD_FORCE = 1u << 0,
    GIT_INDEX_ADD_DISABLE_PATHSPEC_MATCH = 1u << 1,
    GIT_INDEX_ADD_CHECK_PATHSPEC = 1u << 2
}

alias GIT_INDEX_ADD_DEFAULT = git_index_add_option_t.GIT_INDEX_ADD_DEFAULT;
alias GIT_INDEX_ADD_FORCE = git_index_add_option_t.GIT_INDEX_ADD_FORCE;
alias GIT_INDEX_ADD_DISABLE_PATHSPEC_MATCH = git_index_add_option_t.GIT_INDEX_ADD_DISABLE_PATHSPEC_MATCH;
alias GIT_INDEX_ADD_CHECK_PATHSPEC = git_index_add_option_t.GIT_INDEX_ADD_CHECK_PATHSPEC;

enum git_index_stage_t
{
    GIT_INDEX_STAGE_ANY = -1,

    GIT_INDEX_STAGE_NORMAL = 0,

    GIT_INDEX_STAGE_ANCESTOR = 1,

    GIT_INDEX_STAGE_OURS = 2,

    GIT_INDEX_STAGE_THEIRS = 3
}

alias GIT_INDEX_STAGE_ANY = git_index_stage_t.GIT_INDEX_STAGE_ANY;
alias GIT_INDEX_STAGE_NORMAL = git_index_stage_t.GIT_INDEX_STAGE_NORMAL;
alias GIT_INDEX_STAGE_ANCESTOR = git_index_stage_t.GIT_INDEX_STAGE_ANCESTOR;
alias GIT_INDEX_STAGE_OURS = git_index_stage_t.GIT_INDEX_STAGE_OURS;
alias GIT_INDEX_STAGE_THEIRS = git_index_stage_t.GIT_INDEX_STAGE_THEIRS;

int git_index_open (git_index** out_, const(char)* index_path);

int git_index_new (git_index** out_);

void git_index_free (git_index* index);

git_repository* git_index_owner (const(git_index)* index);

int git_index_caps (const(git_index)* index);

int git_index_set_caps (git_index* index, int caps);

uint git_index_version (git_index* index);

int git_index_set_version (git_index* index, uint version_);

int git_index_read (git_index* index, int force);

int git_index_write (git_index* index);

const(char)* git_index_path (const(git_index)* index);

const(git_oid)* git_index_checksum (git_index* index);

int git_index_read_tree (git_index* index, const(git_tree)* tree);

int git_index_write_tree (git_oid* out_, git_index* index);

int git_index_write_tree_to (git_oid* out_, git_index* index, scope git_repository* repo);

size_t git_index_entrycount (const(git_index)* index);

int git_index_clear (git_index* index);

const(git_index_entry)* git_index_get_byindex (git_index* index, size_t n);

const(git_index_entry)* git_index_get_bypath (
    git_index* index,
    const(char)* path,
    int stage);

int git_index_remove (git_index* index, const(char)* path, int stage);

int git_index_remove_directory (git_index* index, const(char)* dir, int stage);

int git_index_add (git_index* index, const(git_index_entry)* source_entry);

int git_index_entry_stage (const(git_index_entry)* entry);

int git_index_entry_is_conflict (const(git_index_entry)* entry);

int git_index_iterator_new (
    git_index_iterator** iterator_out,
    git_index* index);

int git_index_iterator_next (
    const(git_index_entry*)* out_,
    git_index_iterator* iterator);

void git_index_iterator_free (git_index_iterator* iterator);

int git_index_add_bypath (git_index* index, const(char)* path);

int git_index_add_from_buffer (
    git_index* index,
    const(git_index_entry)* entry,
    const(void)* buffer,
    size_t len);

int git_index_remove_bypath (git_index* index, const(char)* path);

int git_index_add_all (
    git_index* index,
    scope const ref git_strarray pathspec,
    uint flags,
    git_index_matched_path_cb callback,
    void* payload);

int git_index_remove_all (
    git_index* index,
    scope const ref git_strarray pathspec,
    git_index_matched_path_cb callback,
    void* payload);

int git_index_update_all (
    git_index* index,
    scope const ref git_strarray pathspec,
    git_index_matched_path_cb callback,
    void* payload);

int git_index_find (size_t* at_pos, git_index* index, const(char)* path);

int git_index_find_prefix (size_t* at_pos, git_index* index, const(char)* prefix);

int git_index_conflict_add (
    git_index* index,
    const(git_index_entry)* ancestor_entry,
    const(git_index_entry)* our_entry,
    const(git_index_entry)* their_entry);

int git_index_conflict_get (
    const(git_index_entry*)* ancestor_out,
    const(git_index_entry*)* our_out,
    const(git_index_entry*)* their_out,
    git_index* index,
    const(char)* path);

int git_index_conflict_remove (git_index* index, const(char)* path);

int git_index_conflict_cleanup (git_index* index);

int git_index_has_conflicts (const(git_index)* index);

int git_index_conflict_iterator_new (
    git_index_conflict_iterator** iterator_out,
    git_index* index);

int git_index_conflict_next (
    const(git_index_entry*)* ancestor_out,
    const(git_index_entry*)* our_out,
    const(git_index_entry*)* their_out,
    git_index_conflict_iterator* iterator);

void git_index_conflict_iterator_free (git_index_conflict_iterator* iterator);

struct git_merge_file_input
{
    uint version_;

    const(char)* ptr;

    size_t size;

    const(char)* path;

    uint mode;
}

int git_merge_file_input_init (git_merge_file_input* opts, uint version_);

enum git_merge_flag_t
{
    GIT_MERGE_FIND_RENAMES = 1 << 0,

    GIT_MERGE_FAIL_ON_CONFLICT = 1 << 1,

    GIT_MERGE_SKIP_REUC = 1 << 2,

    GIT_MERGE_NO_RECURSIVE = 1 << 3,

    GIT_MERGE_VIRTUAL_BASE = 1 << 4
}

alias GIT_MERGE_FIND_RENAMES = git_merge_flag_t.GIT_MERGE_FIND_RENAMES;
alias GIT_MERGE_FAIL_ON_CONFLICT = git_merge_flag_t.GIT_MERGE_FAIL_ON_CONFLICT;
alias GIT_MERGE_SKIP_REUC = git_merge_flag_t.GIT_MERGE_SKIP_REUC;
alias GIT_MERGE_NO_RECURSIVE = git_merge_flag_t.GIT_MERGE_NO_RECURSIVE;
alias GIT_MERGE_VIRTUAL_BASE = git_merge_flag_t.GIT_MERGE_VIRTUAL_BASE;

enum git_merge_file_favor_t
{
    GIT_MERGE_FILE_FAVOR_NORMAL = 0,

    GIT_MERGE_FILE_FAVOR_OURS = 1,

    GIT_MERGE_FILE_FAVOR_THEIRS = 2,

    GIT_MERGE_FILE_FAVOR_UNION = 3
}

alias GIT_MERGE_FILE_FAVOR_NORMAL = git_merge_file_favor_t.GIT_MERGE_FILE_FAVOR_NORMAL;
alias GIT_MERGE_FILE_FAVOR_OURS = git_merge_file_favor_t.GIT_MERGE_FILE_FAVOR_OURS;
alias GIT_MERGE_FILE_FAVOR_THEIRS = git_merge_file_favor_t.GIT_MERGE_FILE_FAVOR_THEIRS;
alias GIT_MERGE_FILE_FAVOR_UNION = git_merge_file_favor_t.GIT_MERGE_FILE_FAVOR_UNION;

enum git_merge_file_flag_t
{
    GIT_MERGE_FILE_DEFAULT = 0,

    GIT_MERGE_FILE_STYLE_MERGE = 1 << 0,

    GIT_MERGE_FILE_STYLE_DIFF3 = 1 << 1,

    GIT_MERGE_FILE_SIMPLIFY_ALNUM = 1 << 2,

    GIT_MERGE_FILE_IGNORE_WHITESPACE = 1 << 3,

    GIT_MERGE_FILE_IGNORE_WHITESPACE_CHANGE = 1 << 4,

    GIT_MERGE_FILE_IGNORE_WHITESPACE_EOL = 1 << 5,

    GIT_MERGE_FILE_DIFF_PATIENCE = 1 << 6,

    GIT_MERGE_FILE_DIFF_MINIMAL = 1 << 7,

    GIT_MERGE_FILE_STYLE_ZDIFF3 = 1 << 8,

    GIT_MERGE_FILE_ACCEPT_CONFLICTS = 1 << 9
}

alias GIT_MERGE_FILE_DEFAULT = git_merge_file_flag_t.GIT_MERGE_FILE_DEFAULT;
alias GIT_MERGE_FILE_STYLE_MERGE = git_merge_file_flag_t.GIT_MERGE_FILE_STYLE_MERGE;
alias GIT_MERGE_FILE_STYLE_DIFF3 = git_merge_file_flag_t.GIT_MERGE_FILE_STYLE_DIFF3;
alias GIT_MERGE_FILE_SIMPLIFY_ALNUM = git_merge_file_flag_t.GIT_MERGE_FILE_SIMPLIFY_ALNUM;
alias GIT_MERGE_FILE_IGNORE_WHITESPACE = git_merge_file_flag_t.GIT_MERGE_FILE_IGNORE_WHITESPACE;
alias GIT_MERGE_FILE_IGNORE_WHITESPACE_CHANGE = git_merge_file_flag_t.GIT_MERGE_FILE_IGNORE_WHITESPACE_CHANGE;
alias GIT_MERGE_FILE_IGNORE_WHITESPACE_EOL = git_merge_file_flag_t.GIT_MERGE_FILE_IGNORE_WHITESPACE_EOL;
alias GIT_MERGE_FILE_DIFF_PATIENCE = git_merge_file_flag_t.GIT_MERGE_FILE_DIFF_PATIENCE;
alias GIT_MERGE_FILE_DIFF_MINIMAL = git_merge_file_flag_t.GIT_MERGE_FILE_DIFF_MINIMAL;
alias GIT_MERGE_FILE_STYLE_ZDIFF3 = git_merge_file_flag_t.GIT_MERGE_FILE_STYLE_ZDIFF3;
alias GIT_MERGE_FILE_ACCEPT_CONFLICTS = git_merge_file_flag_t.GIT_MERGE_FILE_ACCEPT_CONFLICTS;

struct git_merge_file_options
{
    uint version_;

    const(char)* ancestor_label;

    const(char)* our_label;

    const(char)* their_label;

    git_merge_file_favor_t favor;

    uint flags;

    ushort marker_size;
}

int git_merge_file_options_init (scope ref git_merge_file_options opts, uint version_);

struct git_merge_file_result
{
    uint automergeable;

    const(char)* path;

    uint mode;

    const(char)* ptr;

    size_t len;
}

struct git_merge_options
{
    uint version_;

    uint flags;

    uint rename_threshold;

    uint target_limit;

    git_diff_similarity_metric* metric;

    uint recursion_limit;

    const(char)* default_driver;

    git_merge_file_favor_t file_favor;

    uint file_flags;
}

int git_merge_options_init (scope ref git_merge_options opts, uint version_);

enum git_merge_analysis_t
{
    GIT_MERGE_ANALYSIS_NONE = 0,

    GIT_MERGE_ANALYSIS_NORMAL = 1 << 0,

    GIT_MERGE_ANALYSIS_UP_TO_DATE = 1 << 1,

    GIT_MERGE_ANALYSIS_FASTFORWARD = 1 << 2,

    GIT_MERGE_ANALYSIS_UNBORN = 1 << 3
}

alias GIT_MERGE_ANALYSIS_NONE = git_merge_analysis_t.GIT_MERGE_ANALYSIS_NONE;
alias GIT_MERGE_ANALYSIS_NORMAL = git_merge_analysis_t.GIT_MERGE_ANALYSIS_NORMAL;
alias GIT_MERGE_ANALYSIS_UP_TO_DATE = git_merge_analysis_t.GIT_MERGE_ANALYSIS_UP_TO_DATE;
alias GIT_MERGE_ANALYSIS_FASTFORWARD = git_merge_analysis_t.GIT_MERGE_ANALYSIS_FASTFORWARD;
alias GIT_MERGE_ANALYSIS_UNBORN = git_merge_analysis_t.GIT_MERGE_ANALYSIS_UNBORN;

enum git_merge_preference_t
{
    GIT_MERGE_PREFERENCE_NONE = 0,

    GIT_MERGE_PREFERENCE_NO_FASTFORWARD = 1 << 0,

    GIT_MERGE_PREFERENCE_FASTFORWARD_ONLY = 1 << 1
}

alias GIT_MERGE_PREFERENCE_NONE = git_merge_preference_t.GIT_MERGE_PREFERENCE_NONE;
alias GIT_MERGE_PREFERENCE_NO_FASTFORWARD = git_merge_preference_t.GIT_MERGE_PREFERENCE_NO_FASTFORWARD;
alias GIT_MERGE_PREFERENCE_FASTFORWARD_ONLY = git_merge_preference_t.GIT_MERGE_PREFERENCE_FASTFORWARD_ONLY;

int git_merge_analysis (
    git_merge_analysis_t* analysis_out,
    git_merge_preference_t* preference_out,
    scope git_repository* repo,
    const(git_annotated_commit*)* their_heads,
    size_t their_heads_len);

int git_merge_analysis_for_ref (
    git_merge_analysis_t* analysis_out,
    git_merge_preference_t* preference_out,
    scope git_repository* repo,
    git_reference* our_ref,
    const(git_annotated_commit*)* their_heads,
    size_t their_heads_len);

int git_merge_base (
    git_oid* out_,
    scope git_repository* repo,
    const(git_oid)* one,
    const(git_oid)* two);

int git_merge_bases (
    git_oidarray* out_,
    scope git_repository* repo,
    const(git_oid)* one,
    const(git_oid)* two);

int git_merge_base_many (
    git_oid* out_,
    scope git_repository* repo,
    size_t length,
    const(git_oid)* input_array);

int git_merge_bases_many (
    git_oidarray* out_,
    scope git_repository* repo,
    size_t length,
    const(git_oid)* input_array);

int git_merge_base_octopus (
    git_oid* out_,
    scope git_repository* repo,
    size_t length,
    const(git_oid)* input_array);

int git_merge_file (
    git_merge_file_result* out_,
    const(git_merge_file_input)* ancestor,
    const(git_merge_file_input)* ours,
    const(git_merge_file_input)* theirs,
    scope const ref git_merge_file_options opts);

int git_merge_file_from_index (
    git_merge_file_result* out_,
    scope git_repository* repo,
    const(git_index_entry)* ancestor,
    const(git_index_entry)* ours,
    const(git_index_entry)* theirs,
    scope const ref git_merge_file_options opts);

void git_merge_file_result_free (git_merge_file_result* result);

int git_merge_trees (
    git_index** out_,
    scope git_repository* repo,
    const(git_tree)* ancestor_tree,
    const(git_tree)* our_tree,
    const(git_tree)* their_tree,
    scope const ref git_merge_options opts);

int git_merge_commits (
    git_index** out_,
    scope git_repository* repo,
    const(git_commit)* our_commit,
    const(git_commit)* their_commit,
    scope const ref git_merge_options opts);

int git_merge (
    scope git_repository* repo,
    const(git_annotated_commit*)* their_heads,
    size_t their_heads_len,
    scope const ref git_merge_options merge_opts,
    scope const ref git_checkout_options checkout_opts);

struct git_cherrypick_options
{
    uint version_;

    uint mainline;

    git_merge_options merge_opts;
    git_checkout_options checkout_opts;
}

int git_cherrypick_options_init (scope ref git_cherrypick_options opts, uint version_);

int git_cherrypick_commit (
    git_index** out_,
    scope git_repository* repo,
    git_commit* cherrypick_commit,
    git_commit* our_commit,
    uint mainline,
    scope const ref git_merge_options merge_options);

int git_cherrypick (
    scope git_repository* repo,
    git_commit* commit,
    scope const ref git_cherrypick_options cherrypick_options);

enum git_direction
{
    GIT_DIRECTION_FETCH = 0,
    GIT_DIRECTION_PUSH = 1
}

alias GIT_DIRECTION_FETCH = git_direction.GIT_DIRECTION_FETCH;
alias GIT_DIRECTION_PUSH = git_direction.GIT_DIRECTION_PUSH;

struct git_remote_head
{
    int local;
    git_oid oid;
    git_oid loid;
    char* name;

    char* symref_target;
}

int git_refspec_parse (git_refspec** refspec, const(char)* input, int is_fetch);

void git_refspec_free (git_refspec* refspec);

const(char)* git_refspec_src (const(git_refspec)* refspec);

const(char)* git_refspec_dst (const(git_refspec)* refspec);

const(char)* git_refspec_string (const(git_refspec)* refspec);

int git_refspec_force (const(git_refspec)* refspec);

git_direction git_refspec_direction (const(git_refspec)* spec);

int git_refspec_src_matches (const(git_refspec)* refspec, const(char)* refname);

int git_refspec_dst_matches (const(git_refspec)* refspec, const(char)* refname);

int git_refspec_transform (git_buf* out_, const(git_refspec)* spec, const(char)* name);

int git_refspec_rtransform (git_buf* out_, const(git_refspec)* spec, const(char)* name);

enum git_credential_t
{
    GIT_CREDENTIAL_USERPASS_PLAINTEXT = 1u << 0,

    GIT_CREDENTIAL_SSH_KEY = 1u << 1,

    GIT_CREDENTIAL_SSH_CUSTOM = 1u << 2,

    GIT_CREDENTIAL_DEFAULT = 1u << 3,

    GIT_CREDENTIAL_SSH_INTERACTIVE = 1u << 4,

    GIT_CREDENTIAL_USERNAME = 1u << 5,

    GIT_CREDENTIAL_SSH_MEMORY = 1u << 6
}

alias GIT_CREDENTIAL_USERPASS_PLAINTEXT = git_credential_t.GIT_CREDENTIAL_USERPASS_PLAINTEXT;
alias GIT_CREDENTIAL_SSH_KEY = git_credential_t.GIT_CREDENTIAL_SSH_KEY;
alias GIT_CREDENTIAL_SSH_CUSTOM = git_credential_t.GIT_CREDENTIAL_SSH_CUSTOM;
alias GIT_CREDENTIAL_DEFAULT = git_credential_t.GIT_CREDENTIAL_DEFAULT;
alias GIT_CREDENTIAL_SSH_INTERACTIVE = git_credential_t.GIT_CREDENTIAL_SSH_INTERACTIVE;
alias GIT_CREDENTIAL_USERNAME = git_credential_t.GIT_CREDENTIAL_USERNAME;
alias GIT_CREDENTIAL_SSH_MEMORY = git_credential_t.GIT_CREDENTIAL_SSH_MEMORY;

alias git_credential_default = git_credential;

alias git_credential_acquire_cb = int function (
    git_credential** out_,
    const(char)* url,
    const(char)* username_from_url,
    uint allowed_types,
    void* payload);

void git_credential_free (git_credential* cred);

int git_credential_has_username (git_credential* cred);

const(char)* git_credential_get_username (git_credential* cred);

int git_credential_userpass_plaintext_new (
    git_credential** out_,
    const(char)* username,
    const(char)* password);

int git_credential_default_new (git_credential** out_);

int git_credential_username_new (git_credential** out_, const(char)* username);

int git_credential_ssh_key_new (
    git_credential** out_,
    const(char)* username,
    const(char)* publickey,
    const(char)* privatekey,
    const(char)* passphrase);

int git_credential_ssh_key_memory_new (
    git_credential** out_,
    const(char)* username,
    const(char)* publickey,
    const(char)* privatekey,
    const(char)* passphrase);

struct _LIBSSH2_SESSION;
alias LIBSSH2_SESSION = _LIBSSH2_SESSION;
struct _LIBSSH2_USERAUTH_KBDINT_PROMPT;
alias LIBSSH2_USERAUTH_KBDINT_PROMPT = _LIBSSH2_USERAUTH_KBDINT_PROMPT;
struct _LIBSSH2_USERAUTH_KBDINT_RESPONSE;
alias LIBSSH2_USERAUTH_KBDINT_RESPONSE = _LIBSSH2_USERAUTH_KBDINT_RESPONSE;

alias git_credential_ssh_interactive_cb = void function (
    const(char)* name,
    int name_len,
    const(char)* instruction,
    int instruction_len,
    int num_prompts,
    const(LIBSSH2_USERAUTH_KBDINT_PROMPT)* prompts,
    LIBSSH2_USERAUTH_KBDINT_RESPONSE* responses,
    void** abstract_);

int git_credential_ssh_interactive_new (
    git_credential** out_,
    const(char)* username,
    git_credential_ssh_interactive_cb prompt_callback,
    void* payload);

int git_credential_ssh_key_from_agent (
    git_credential** out_,
    const(char)* username);

alias git_credential_sign_cb = int function (
    LIBSSH2_SESSION* session,
    ubyte** sig,
    size_t* sig_len,
    const(ubyte)* data,
    size_t data_len,
    void** abstract_);

int git_credential_ssh_custom_new (
    git_credential** out_,
    const(char)* username,
    const(char)* publickey,
    size_t publickey_len,
    git_credential_sign_cb sign_callback,
    void* payload);

alias git_transport_message_cb = int function (const(char)* str, int len, void* payload);

alias git_transport_cb = int function (git_transport** out_, scope git_remote* owner, void* param);

enum git_packbuilder_stage_t
{
    GIT_PACKBUILDER_ADDING_OBJECTS = 0,
    GIT_PACKBUILDER_DELTAFICATION = 1
}

alias GIT_PACKBUILDER_ADDING_OBJECTS = git_packbuilder_stage_t.GIT_PACKBUILDER_ADDING_OBJECTS;
alias GIT_PACKBUILDER_DELTAFICATION = git_packbuilder_stage_t.GIT_PACKBUILDER_DELTAFICATION;

int git_packbuilder_new (git_packbuilder** out_, scope git_repository* repo);

uint git_packbuilder_set_threads (git_packbuilder* pb, uint n);

int git_packbuilder_insert (git_packbuilder* pb, const(git_oid)* id, const(char)* name);

int git_packbuilder_insert_tree (git_packbuilder* pb, const(git_oid)* id);

int git_packbuilder_insert_commit (git_packbuilder* pb, const(git_oid)* id);

int git_packbuilder_insert_walk (git_packbuilder* pb, git_revwalk* walk);

int git_packbuilder_insert_recur (git_packbuilder* pb, const(git_oid)* id, const(char)* name);

int git_packbuilder_write_buf (git_buf* buf, git_packbuilder* pb);

int git_packbuilder_write (
    git_packbuilder* pb,
    const(char)* path,
    uint mode,
    git_indexer_progress_cb progress_cb,
    void* progress_cb_payload);

const(git_oid)* git_packbuilder_hash (git_packbuilder* pb);

const(char)* git_packbuilder_name (git_packbuilder* pb);

alias git_packbuilder_foreach_cb = int function (void* buf, size_t size, void* payload);

int git_packbuilder_foreach (git_packbuilder* pb, git_packbuilder_foreach_cb cb, void* payload);

size_t git_packbuilder_object_count (git_packbuilder* pb);

size_t git_packbuilder_written (git_packbuilder* pb);

alias git_packbuilder_progress = int function (
    int stage,
    uint current,
    uint total,
    void* payload);

int git_packbuilder_set_callbacks (
    git_packbuilder* pb,
    git_packbuilder_progress progress_cb,
    void* progress_cb_payload);

void git_packbuilder_free (git_packbuilder* pb);

enum git_proxy_t
{
    GIT_PROXY_NONE = 0,

    GIT_PROXY_AUTO = 1,

    GIT_PROXY_SPECIFIED = 2
}

alias GIT_PROXY_NONE = git_proxy_t.GIT_PROXY_NONE;
alias GIT_PROXY_AUTO = git_proxy_t.GIT_PROXY_AUTO;
alias GIT_PROXY_SPECIFIED = git_proxy_t.GIT_PROXY_SPECIFIED;

struct git_proxy_options
{
    uint version_;

    git_proxy_t type;

    const(char)* url;

    git_credential_acquire_cb credentials;

    git_transport_certificate_check_cb certificate_check;

    void* payload;
}

int git_proxy_options_init (scope ref git_proxy_options opts, uint version_);

int git_remote_create (
    scope out git_remote* out_,
    scope git_repository* repo,
    const(char)* name,
    const(char)* url);

enum git_remote_redirect_t
{
    GIT_REMOTE_REDIRECT_NONE = 1 << 0,

    GIT_REMOTE_REDIRECT_INITIAL = 1 << 1,

    GIT_REMOTE_REDIRECT_ALL = 1 << 2
}

alias GIT_REMOTE_REDIRECT_NONE = git_remote_redirect_t.GIT_REMOTE_REDIRECT_NONE;
alias GIT_REMOTE_REDIRECT_INITIAL = git_remote_redirect_t.GIT_REMOTE_REDIRECT_INITIAL;
alias GIT_REMOTE_REDIRECT_ALL = git_remote_redirect_t.GIT_REMOTE_REDIRECT_ALL;

enum git_remote_create_flags
{
    GIT_REMOTE_CREATE_SKIP_INSTEADOF = 1 << 0,

    GIT_REMOTE_CREATE_SKIP_DEFAULT_FETCHSPEC = 1 << 1
}

alias GIT_REMOTE_CREATE_SKIP_INSTEADOF = git_remote_create_flags.GIT_REMOTE_CREATE_SKIP_INSTEADOF;
alias GIT_REMOTE_CREATE_SKIP_DEFAULT_FETCHSPEC = git_remote_create_flags.GIT_REMOTE_CREATE_SKIP_DEFAULT_FETCHSPEC;

struct git_remote_create_options
{
    uint version_;

    git_repository* repository;

    const(char)* name;

    const(char)* fetchspec;

    uint flags;
}

int git_remote_create_options_init (
    scope ref git_remote_create_options opts,
    uint version_);

int git_remote_create_with_opts (
    scope out git_remote* out_,
    const(char)* url,
    scope const ref git_remote_create_options opts);

int git_remote_create_with_fetchspec (
    scope out git_remote* out_,
    scope git_repository* repo,
    const(char)* name,
    const(char)* url,
    const(char)* fetch);

int git_remote_create_anonymous (
    scope out git_remote* out_,
    scope git_repository* repo,
    const(char)* url);

int git_remote_create_detached (scope out git_remote* out_, const(char)* url);

int git_remote_lookup (scope out git_remote* out_, scope git_repository* repo, const(char)* name);

int git_remote_dup (scope out git_remote* dest, scope git_remote* source);

git_repository* git_remote_owner (scope const(git_remote)* remote);

const(char)* git_remote_name (scope const(git_remote)* remote);

const(char)* git_remote_url (scope const(git_remote)* remote);

const(char)* git_remote_pushurl (scope const(git_remote)* remote);

int git_remote_set_url (scope git_repository* repo, const(char)* remote, const(char)* url);

int git_remote_set_pushurl (scope git_repository* repo, const(char)* remote, const(char)* url);

int git_remote_set_instance_url (scope git_remote* remote, const(char)* url);

int git_remote_set_instance_pushurl (scope git_remote* remote, const(char)* url);

int git_remote_add_fetch (scope git_repository* repo, const(char)* remote, const(char)* refspec);

int git_remote_get_fetch_refspecs (scope ref git_strarray array, scope const(git_remote)* remote);

int git_remote_add_push (scope git_repository* repo, const(char)* remote, const(char)* refspec);

int git_remote_get_push_refspecs (scope ref git_strarray array, scope const(git_remote)* remote);

size_t git_remote_refspec_count (scope const(git_remote)* remote);

const(git_refspec)* git_remote_get_refspec (scope const(git_remote)* remote, size_t n);

int git_remote_ls (const(git_remote_head**)* out_, size_t* size, scope git_remote* remote);

int git_remote_connected (scope const(git_remote)* remote);

int git_remote_stop (scope git_remote* remote);

int git_remote_disconnect (scope git_remote* remote);

void git_remote_free (scope git_remote* remote);

int git_remote_list (scope ref git_strarray out_, scope git_repository* repo);

enum git_remote_completion_t
{
    GIT_REMOTE_COMPLETION_DOWNLOAD = 0,
    GIT_REMOTE_COMPLETION_INDEXING = 1,
    GIT_REMOTE_COMPLETION_ERROR = 2
}

alias GIT_REMOTE_COMPLETION_DOWNLOAD = git_remote_completion_t.GIT_REMOTE_COMPLETION_DOWNLOAD;
alias GIT_REMOTE_COMPLETION_INDEXING = git_remote_completion_t.GIT_REMOTE_COMPLETION_INDEXING;
alias GIT_REMOTE_COMPLETION_ERROR = git_remote_completion_t.GIT_REMOTE_COMPLETION_ERROR;

alias git_push_transfer_progress_cb = int function (
    uint current,
    uint total,
    size_t bytes,
    void* payload);

struct git_push_update
{
    char* src_refname;

    char* dst_refname;

    git_oid src;

    git_oid dst;
}

alias git_push_negotiation = int function (const(git_push_update*)* updates, size_t len, void* payload);

alias git_push_update_reference_cb = int function (const(char)* refname, const(char)* status, void* data);

alias git_url_resolve_cb = int function (git_buf* url_resolved, const(char)* url, int direction, void* payload);

alias git_remote_ready_cb = int function (scope git_remote* remote, int direction, void* payload);

struct git_remote_callbacks
{
    uint version_;

    git_transport_message_cb sideband_progress;

    int function (git_remote_completion_t type, void* data) completion;

    git_credential_acquire_cb credentials;

    git_transport_certificate_check_cb certificate_check;

    git_indexer_progress_cb transfer_progress;

    int function (const(char)* refname, const(git_oid)* a, const(git_oid)* b, void* data) update_tips;

    git_packbuilder_progress pack_progress;

    git_push_transfer_progress_cb push_transfer_progress;

    git_push_update_reference_cb push_update_reference;

    git_push_negotiation push_negotiation;

    git_transport_cb transport;

    git_remote_ready_cb remote_ready;

    void* payload;

    git_url_resolve_cb resolve_url;
}

int git_remote_init_callbacks (git_remote_callbacks* opts, uint version_);

enum git_fetch_prune_t
{
    GIT_FETCH_PRUNE_UNSPECIFIED = 0,

    GIT_FETCH_PRUNE = 1,

    GIT_FETCH_NO_PRUNE = 2
}

alias GIT_FETCH_PRUNE_UNSPECIFIED = git_fetch_prune_t.GIT_FETCH_PRUNE_UNSPECIFIED;
alias GIT_FETCH_PRUNE = git_fetch_prune_t.GIT_FETCH_PRUNE;
alias GIT_FETCH_NO_PRUNE = git_fetch_prune_t.GIT_FETCH_NO_PRUNE;

enum git_remote_autotag_option_t
{
    GIT_REMOTE_DOWNLOAD_TAGS_UNSPECIFIED = 0,

    GIT_REMOTE_DOWNLOAD_TAGS_AUTO = 1,

    GIT_REMOTE_DOWNLOAD_TAGS_NONE = 2,

    GIT_REMOTE_DOWNLOAD_TAGS_ALL = 3
}

alias GIT_REMOTE_DOWNLOAD_TAGS_UNSPECIFIED = git_remote_autotag_option_t.GIT_REMOTE_DOWNLOAD_TAGS_UNSPECIFIED;
alias GIT_REMOTE_DOWNLOAD_TAGS_AUTO = git_remote_autotag_option_t.GIT_REMOTE_DOWNLOAD_TAGS_AUTO;
alias GIT_REMOTE_DOWNLOAD_TAGS_NONE = git_remote_autotag_option_t.GIT_REMOTE_DOWNLOAD_TAGS_NONE;
alias GIT_REMOTE_DOWNLOAD_TAGS_ALL = git_remote_autotag_option_t.GIT_REMOTE_DOWNLOAD_TAGS_ALL;

enum git_fetch_depth_t
{
    GIT_FETCH_DEPTH_FULL = 0,

    GIT_FETCH_DEPTH_UNSHALLOW = 2147483647
}

alias GIT_FETCH_DEPTH_FULL = git_fetch_depth_t.GIT_FETCH_DEPTH_FULL;
alias GIT_FETCH_DEPTH_UNSHALLOW = git_fetch_depth_t.GIT_FETCH_DEPTH_UNSHALLOW;

struct git_fetch_options
{
    int version_;

    git_remote_callbacks callbacks;

    git_fetch_prune_t prune;

    int update_fetchhead;

    git_remote_autotag_option_t download_tags;

    git_proxy_options proxy_opts;

    int depth;

    git_remote_redirect_t follow_redirects;

    git_strarray custom_headers;
}

int git_fetch_options_init (scope ref git_fetch_options opts, uint version_);

struct git_push_options
{
    uint version_;

    uint pb_parallelism;

    git_remote_callbacks callbacks;

    git_proxy_options proxy_opts;

    git_remote_redirect_t follow_redirects;

    git_strarray custom_headers;
}

int git_push_options_init (scope ref git_push_options opts, uint version_);

struct git_remote_connect_options
{
    uint version_;

    git_remote_callbacks callbacks;

    git_proxy_options proxy_opts;

    git_remote_redirect_t follow_redirects;

    git_strarray custom_headers;
}

int git_remote_connect_options_init (
    scope ref git_remote_connect_options opts,
    uint version_);

int git_remote_connect (
    scope git_remote* remote,
    git_direction direction,
    const(git_remote_callbacks)* callbacks,
    scope const ref git_proxy_options proxy_opts,
    scope const ref git_strarray custom_headers);

int git_remote_connect_ext (
    scope git_remote* remote,
    git_direction direction,
    scope const ref git_remote_connect_options opts);

int git_remote_download (
    scope git_remote* remote,
    scope const ref git_strarray refspecs,
    scope const ref git_fetch_options opts);

int git_remote_upload (
    scope git_remote* remote,
    scope const ref git_strarray refspecs,
    scope const ref git_push_options opts);

int git_remote_update_tips (
    scope git_remote* remote,
    const(git_remote_callbacks)* callbacks,
    int update_fetchhead,
    git_remote_autotag_option_t download_tags,
    const(char)* reflog_message);

int git_remote_fetch (
    scope git_remote* remote,
    scope const ref git_strarray refspecs,
    scope const ref git_fetch_options opts,
    const(char)* reflog_message);

int git_remote_prune (
    scope git_remote* remote,
    const(git_remote_callbacks)* callbacks);

int git_remote_push (
    scope git_remote* remote,
    scope const ref git_strarray refspecs,
    scope const ref git_push_options opts);

const(git_indexer_progress)* git_remote_stats (scope git_remote* remote);

git_remote_autotag_option_t git_remote_autotag (scope const(git_remote)* remote);

int git_remote_set_autotag (scope git_repository* repo, const(char)* remote, git_remote_autotag_option_t value);

int git_remote_prune_refs (scope const(git_remote)* remote);

int git_remote_rename (
    scope ref git_strarray problems,
    scope git_repository* repo,
    const(char)* name,
    const(char)* new_name);

int git_remote_name_is_valid (out int valid, const(char)* remote_name);

int git_remote_delete (scope git_repository* repo, const(char)* name);

int git_remote_default_branch (git_buf* out_, scope git_remote* remote);

enum git_clone_local_t
{
    GIT_CLONE_LOCAL_AUTO = 0,

    GIT_CLONE_LOCAL = 1,

    GIT_CLONE_NO_LOCAL = 2,

    GIT_CLONE_LOCAL_NO_LINKS = 3
}

alias GIT_CLONE_LOCAL_AUTO = git_clone_local_t.GIT_CLONE_LOCAL_AUTO;
alias GIT_CLONE_LOCAL = git_clone_local_t.GIT_CLONE_LOCAL;
alias GIT_CLONE_NO_LOCAL = git_clone_local_t.GIT_CLONE_NO_LOCAL;
alias GIT_CLONE_LOCAL_NO_LINKS = git_clone_local_t.GIT_CLONE_LOCAL_NO_LINKS;

alias git_remote_create_cb = int function (
    scope out git_remote* out_,
    scope git_repository* repo,
    const(char)* name,
    const(char)* url,
    void* payload);

alias git_repository_create_cb = int function (
    scope out git_repository* out_,
    const(char)* path,
    int bare,
    void* payload);

struct git_clone_options
{
    uint version_;

    git_checkout_options checkout_opts;

    git_fetch_options fetch_opts;

    int bare;

    git_clone_local_t local;

    const(char)* checkout_branch;

    git_repository_create_cb repository_cb;

    void* repository_cb_payload;

    git_remote_create_cb remote_cb;

    void* remote_cb_payload;
}

int git_clone_options_init (scope ref git_clone_options opts, uint version_);

int git_clone (
    scope out git_repository* out_,
    const(char)* url,
    const(char)* local_path,
    scope const ref git_clone_options options);

int git_commit_lookup (
    git_commit** commit,
    scope git_repository* repo,
    const(git_oid)* id);

int git_commit_lookup_prefix (
    git_commit** commit,
    scope git_repository* repo,
    const(git_oid)* id,
    size_t len);

void git_commit_free (git_commit* commit);

const(git_oid)* git_commit_id (const(git_commit)* commit);

git_repository* git_commit_owner (const(git_commit)* commit);

const(char)* git_commit_message_encoding (const(git_commit)* commit);

const(char)* git_commit_message (const(git_commit)* commit);

const(char)* git_commit_message_raw (const(git_commit)* commit);

const(char)* git_commit_summary (git_commit* commit);

const(char)* git_commit_body (git_commit* commit);

git_time_t git_commit_time (const(git_commit)* commit);

int git_commit_time_offset (const(git_commit)* commit);

const(git_signature)* git_commit_committer (const(git_commit)* commit);

const(git_signature)* git_commit_author (const(git_commit)* commit);

int git_commit_committer_with_mailmap (
    git_signature** out_,
    const(git_commit)* commit,
    const(git_mailmap)* mailmap);

int git_commit_author_with_mailmap (
    git_signature** out_,
    const(git_commit)* commit,
    const(git_mailmap)* mailmap);

const(char)* git_commit_raw_header (const(git_commit)* commit);

int git_commit_tree (git_tree** tree_out, const(git_commit)* commit);

const(git_oid)* git_commit_tree_id (const(git_commit)* commit);

uint git_commit_parentcount (const(git_commit)* commit);

int git_commit_parent (git_commit** out_, const(git_commit)* commit, uint n);

const(git_oid)* git_commit_parent_id (const(git_commit)* commit, uint n);

int git_commit_nth_gen_ancestor (
    git_commit** ancestor,
    const(git_commit)* commit,
    uint n);

int git_commit_header_field (git_buf* out_, const(git_commit)* commit, const(char)* field);

int git_commit_extract_signature (git_buf* signature, git_buf* signed_data, scope git_repository* repo, git_oid* commit_id, const(char)* field);

int git_commit_create (
    git_oid* id,
    scope git_repository* repo,
    const(char)* update_ref,
    const(git_signature)* author,
    const(git_signature)* committer,
    const(char)* message_encoding,
    const(char)* message,
    const(git_tree)* tree,
    size_t parent_count,
    const(git_commit)** parents);

int git_commit_create_v (
    git_oid* id,
    scope git_repository* repo,
    const(char)* update_ref,
    const(git_signature)* author,
    const(git_signature)* committer,
    const(char)* message_encoding,
    const(char)* message,
    const(git_tree)* tree,
    size_t parent_count,
    ...);

int git_commit_amend (
    git_oid* id,
    const(git_commit)* commit_to_amend,
    const(char)* update_ref,
    const(git_signature)* author,
    const(git_signature)* committer,
    const(char)* message_encoding,
    const(char)* message,
    const(git_tree)* tree);

int git_commit_create_buffer (
    git_buf* out_,
    scope git_repository* repo,
    const(git_signature)* author,
    const(git_signature)* committer,
    const(char)* message_encoding,
    const(char)* message,
    const(git_tree)* tree,
    size_t parent_count,
    const(git_commit)** parents);

int git_commit_create_with_signature (
    git_oid* out_,
    scope git_repository* repo,
    const(char)* commit_content,
    const(char)* signature,
    const(char)* signature_field);

int git_commit_dup (git_commit** out_, git_commit* source);

alias git_commit_create_cb = int function (
    git_oid* out_,
    const(git_signature)* author,
    const(git_signature)* committer,
    const(char)* message_encoding,
    const(char)* message,
    const(git_tree)* tree,
    size_t parent_count,
    const(git_commit)*[] parents,
    void* payload);

enum git_config_level_t
{
    GIT_CONFIG_LEVEL_PROGRAMDATA = 1,

    GIT_CONFIG_LEVEL_SYSTEM = 2,

    GIT_CONFIG_LEVEL_XDG = 3,

    GIT_CONFIG_LEVEL_GLOBAL = 4,

    GIT_CONFIG_LEVEL_LOCAL = 5,

    GIT_CONFIG_LEVEL_APP = 6,

    GIT_CONFIG_HIGHEST_LEVEL = -1
}

alias GIT_CONFIG_LEVEL_PROGRAMDATA = git_config_level_t.GIT_CONFIG_LEVEL_PROGRAMDATA;
alias GIT_CONFIG_LEVEL_SYSTEM = git_config_level_t.GIT_CONFIG_LEVEL_SYSTEM;
alias GIT_CONFIG_LEVEL_XDG = git_config_level_t.GIT_CONFIG_LEVEL_XDG;
alias GIT_CONFIG_LEVEL_GLOBAL = git_config_level_t.GIT_CONFIG_LEVEL_GLOBAL;
alias GIT_CONFIG_LEVEL_LOCAL = git_config_level_t.GIT_CONFIG_LEVEL_LOCAL;
alias GIT_CONFIG_LEVEL_APP = git_config_level_t.GIT_CONFIG_LEVEL_APP;
alias GIT_CONFIG_HIGHEST_LEVEL = git_config_level_t.GIT_CONFIG_HIGHEST_LEVEL;

struct git_config_entry
{
    const(char)* name;
    const(char)* value;
    uint include_depth;
    git_config_level_t level;
    void function (git_config_entry* entry) free;
    void* payload;
}

void git_config_entry_free (git_config_entry* entry);

alias git_config_foreach_cb = int function (const(git_config_entry)* entry, void* payload);

struct git_config_iterator;

enum git_configmap_t
{
    GIT_CONFIGMAP_FALSE = 0,
    GIT_CONFIGMAP_TRUE = 1,
    GIT_CONFIGMAP_INT32 = 2,
    GIT_CONFIGMAP_STRING = 3
}

alias GIT_CONFIGMAP_FALSE = git_configmap_t.GIT_CONFIGMAP_FALSE;
alias GIT_CONFIGMAP_TRUE = git_configmap_t.GIT_CONFIGMAP_TRUE;
alias GIT_CONFIGMAP_INT32 = git_configmap_t.GIT_CONFIGMAP_INT32;
alias GIT_CONFIGMAP_STRING = git_configmap_t.GIT_CONFIGMAP_STRING;

struct git_configmap
{
    git_configmap_t type;
    const(char)* str_match;
    int map_value;
}

int git_config_find_global (git_buf* out_);

int git_config_find_xdg (git_buf* out_);

int git_config_find_system (git_buf* out_);

int git_config_find_programdata (git_buf* out_);

int git_config_open_default (git_config** out_);

int git_config_new (git_config** out_);

int git_config_add_file_ondisk (
    git_config* cfg,
    const(char)* path,
    git_config_level_t level,
    scope const(git_repository)* repo,
    int force);

int git_config_open_ondisk (git_config** out_, const(char)* path);

int git_config_open_level (
    git_config** out_,
    const(git_config)* parent,
    git_config_level_t level);

int git_config_open_global (git_config** out_, git_config* config);

int git_config_snapshot (git_config** out_, git_config* config);

void git_config_free (git_config* cfg);

int git_config_get_entry (
    git_config_entry** out_,
    const(git_config)* cfg,
    const(char)* name);

int git_config_get_int32 (out int out_, const(git_config)* cfg, const(char)* name);

int git_config_get_int64 (long* out_, const(git_config)* cfg, const(char)* name);

int git_config_get_bool (out int out_, const(git_config)* cfg, const(char)* name);

int git_config_get_path (git_buf* out_, const(git_config)* cfg, const(char)* name);

int git_config_get_string (const(char*)* out_, const(git_config)* cfg, const(char)* name);

int git_config_get_string_buf (git_buf* out_, const(git_config)* cfg, const(char)* name);

int git_config_get_multivar_foreach (const(git_config)* cfg, const(char)* name, const(char)* regexp, git_config_foreach_cb callback, void* payload);

int git_config_multivar_iterator_new (git_config_iterator** out_, const(git_config)* cfg, const(char)* name, const(char)* regexp);

int git_config_next (git_config_entry** entry, git_config_iterator* iter);

void git_config_iterator_free (git_config_iterator* iter);

int git_config_set_int32 (git_config* cfg, const(char)* name, int value);

int git_config_set_int64 (git_config* cfg, const(char)* name, long value);

int git_config_set_bool (git_config* cfg, const(char)* name, int value);

int git_config_set_string (git_config* cfg, const(char)* name, const(char)* value);

int git_config_set_multivar (git_config* cfg, const(char)* name, const(char)* regexp, const(char)* value);

int git_config_delete_entry (git_config* cfg, const(char)* name);

int git_config_delete_multivar (git_config* cfg, const(char)* name, const(char)* regexp);

int git_config_foreach (
    const(git_config)* cfg,
    git_config_foreach_cb callback,
    void* payload);

int git_config_iterator_new (git_config_iterator** out_, const(git_config)* cfg);

int git_config_iterator_glob_new (git_config_iterator** out_, const(git_config)* cfg, const(char)* regexp);

int git_config_foreach_match (
    const(git_config)* cfg,
    const(char)* regexp,
    git_config_foreach_cb callback,
    void* payload);

int git_config_get_mapped (
    out int out_,
    const(git_config)* cfg,
    const(char)* name,
    const(git_configmap)* maps,
    size_t map_n);

int git_config_lookup_map_value (
    out int out_,
    const(git_configmap)* maps,
    size_t map_n,
    const(char)* value);

int git_config_parse_bool (out int out_, const(char)* value);

int git_config_parse_int32 (out int out_, const(char)* value);

int git_config_parse_int64 (long* out_, const(char)* value);

int git_config_parse_path (git_buf* out_, const(char)* value);

int git_config_backend_foreach_match (
    git_config_backend* backend,
    const(char)* regexp,
    git_config_foreach_cb callback,
    void* payload);

int git_config_lock (git_transaction** tx, git_config* cfg);

enum git_describe_strategy_t
{
    GIT_DESCRIBE_DEFAULT = 0,
    GIT_DESCRIBE_TAGS = 1,
    GIT_DESCRIBE_ALL = 2
}

alias GIT_DESCRIBE_DEFAULT = git_describe_strategy_t.GIT_DESCRIBE_DEFAULT;
alias GIT_DESCRIBE_TAGS = git_describe_strategy_t.GIT_DESCRIBE_TAGS;
alias GIT_DESCRIBE_ALL = git_describe_strategy_t.GIT_DESCRIBE_ALL;

struct git_describe_options
{
    uint version_;

    uint max_candidates_tags;
    uint describe_strategy;
    const(char)* pattern;

    int only_follow_first_parent;

    int show_commit_oid_as_fallback;
}

int git_describe_options_init (scope ref git_describe_options opts, uint version_);

struct git_describe_format_options
{
    uint version_;

    uint abbreviated_size;

    int always_use_long_format;

    const(char)* dirty_suffix;
}

int git_describe_format_options_init (scope ref git_describe_format_options opts, uint version_);

struct git_describe_result;

int git_describe_commit (
    git_describe_result** result,
    scope git_object* committish,
    scope ref git_describe_options opts);

int git_describe_workdir (
    git_describe_result** out_,
    scope git_repository* repo,
    scope ref git_describe_options opts);

int git_describe_format (
    git_buf* out_,
    const(git_describe_result)* result,
    scope const ref git_describe_format_options opts);

void git_describe_result_free (git_describe_result* result);

enum git_error_code
{
    GIT_OK = 0,

    GIT_ERROR = -1,
    GIT_ENOTFOUND = -3,
    GIT_EEXISTS = -4,
    GIT_EAMBIGUOUS = -5,
    GIT_EBUFS = -6,

    GIT_EUSER = -7,

    GIT_EBAREREPO = -8,
    GIT_EUNBORNBRANCH = -9,
    GIT_EUNMERGED = -10,
    GIT_ENONFASTFORWARD = -11,
    GIT_EINVALIDSPEC = -12,
    GIT_ECONFLICT = -13,
    GIT_ELOCKED = -14,
    GIT_EMODIFIED = -15,
    GIT_EAUTH = -16,
    GIT_ECERTIFICATE = -17,
    GIT_EAPPLIED = -18,
    GIT_EPEEL = -19,
    GIT_EEOF = -20,
    GIT_EINVALID = -21,
    GIT_EUNCOMMITTED = -22,
    GIT_EDIRECTORY = -23,
    GIT_EMERGECONFLICT = -24,

    GIT_PASSTHROUGH = -30,
    GIT_ITEROVER = -31,
    GIT_RETRY = -32,
    GIT_EMISMATCH = -33,
    GIT_EINDEXDIRTY = -34,
    GIT_EAPPLYFAIL = -35,
    GIT_EOWNER = -36,
    GIT_TIMEOUT = -37
}

alias GIT_OK = git_error_code.GIT_OK;
alias GIT_ERROR = git_error_code.GIT_ERROR;
alias GIT_ENOTFOUND = git_error_code.GIT_ENOTFOUND;
alias GIT_EEXISTS = git_error_code.GIT_EEXISTS;
alias GIT_EAMBIGUOUS = git_error_code.GIT_EAMBIGUOUS;
alias GIT_EBUFS = git_error_code.GIT_EBUFS;
alias GIT_EUSER = git_error_code.GIT_EUSER;
alias GIT_EBAREREPO = git_error_code.GIT_EBAREREPO;
alias GIT_EUNBORNBRANCH = git_error_code.GIT_EUNBORNBRANCH;
alias GIT_EUNMERGED = git_error_code.GIT_EUNMERGED;
alias GIT_ENONFASTFORWARD = git_error_code.GIT_ENONFASTFORWARD;
alias GIT_EINVALIDSPEC = git_error_code.GIT_EINVALIDSPEC;
alias GIT_ECONFLICT = git_error_code.GIT_ECONFLICT;
alias GIT_ELOCKED = git_error_code.GIT_ELOCKED;
alias GIT_EMODIFIED = git_error_code.GIT_EMODIFIED;
alias GIT_EAUTH = git_error_code.GIT_EAUTH;
alias GIT_ECERTIFICATE = git_error_code.GIT_ECERTIFICATE;
alias GIT_EAPPLIED = git_error_code.GIT_EAPPLIED;
alias GIT_EPEEL = git_error_code.GIT_EPEEL;
alias GIT_EEOF = git_error_code.GIT_EEOF;
alias GIT_EINVALID = git_error_code.GIT_EINVALID;
alias GIT_EUNCOMMITTED = git_error_code.GIT_EUNCOMMITTED;
alias GIT_EDIRECTORY = git_error_code.GIT_EDIRECTORY;
alias GIT_EMERGECONFLICT = git_error_code.GIT_EMERGECONFLICT;
alias GIT_PASSTHROUGH = git_error_code.GIT_PASSTHROUGH;
alias GIT_ITEROVER = git_error_code.GIT_ITEROVER;
alias GIT_RETRY = git_error_code.GIT_RETRY;
alias GIT_EMISMATCH = git_error_code.GIT_EMISMATCH;
alias GIT_EINDEXDIRTY = git_error_code.GIT_EINDEXDIRTY;
alias GIT_EAPPLYFAIL = git_error_code.GIT_EAPPLYFAIL;
alias GIT_EOWNER = git_error_code.GIT_EOWNER;
alias GIT_TIMEOUT = git_error_code.GIT_TIMEOUT;

struct git_error
{
    char* message;
    int klass;
}

enum git_error_t
{
    GIT_ERROR_NONE = 0,
    GIT_ERROR_NOMEMORY = 1,
    GIT_ERROR_OS = 2,
    GIT_ERROR_INVALID = 3,
    GIT_ERROR_REFERENCE = 4,
    GIT_ERROR_ZLIB = 5,
    GIT_ERROR_REPOSITORY = 6,
    GIT_ERROR_CONFIG = 7,
    GIT_ERROR_REGEX = 8,
    GIT_ERROR_ODB = 9,
    GIT_ERROR_INDEX = 10,
    GIT_ERROR_OBJECT = 11,
    GIT_ERROR_NET = 12,
    GIT_ERROR_TAG = 13,
    GIT_ERROR_TREE = 14,
    GIT_ERROR_INDEXER = 15,
    GIT_ERROR_SSL = 16,
    GIT_ERROR_SUBMODULE = 17,
    GIT_ERROR_THREAD = 18,
    GIT_ERROR_STASH = 19,
    GIT_ERROR_CHECKOUT = 20,
    GIT_ERROR_FETCHHEAD = 21,
    GIT_ERROR_MERGE = 22,
    GIT_ERROR_SSH = 23,
    GIT_ERROR_FILTER = 24,
    GIT_ERROR_REVERT = 25,
    GIT_ERROR_CALLBACK = 26,
    GIT_ERROR_CHERRYPICK = 27,
    GIT_ERROR_DESCRIBE = 28,
    GIT_ERROR_REBASE = 29,
    GIT_ERROR_FILESYSTEM = 30,
    GIT_ERROR_PATCH = 31,
    GIT_ERROR_WORKTREE = 32,
    GIT_ERROR_SHA = 33,
    GIT_ERROR_HTTP = 34,
    GIT_ERROR_INTERNAL = 35,
    GIT_ERROR_GRAFTS = 36
}

alias GIT_ERROR_NONE = git_error_t.GIT_ERROR_NONE;
alias GIT_ERROR_NOMEMORY = git_error_t.GIT_ERROR_NOMEMORY;
alias GIT_ERROR_OS = git_error_t.GIT_ERROR_OS;
alias GIT_ERROR_INVALID = git_error_t.GIT_ERROR_INVALID;
alias GIT_ERROR_REFERENCE = git_error_t.GIT_ERROR_REFERENCE;
alias GIT_ERROR_ZLIB = git_error_t.GIT_ERROR_ZLIB;
alias GIT_ERROR_REPOSITORY = git_error_t.GIT_ERROR_REPOSITORY;
alias GIT_ERROR_CONFIG = git_error_t.GIT_ERROR_CONFIG;
alias GIT_ERROR_REGEX = git_error_t.GIT_ERROR_REGEX;
alias GIT_ERROR_ODB = git_error_t.GIT_ERROR_ODB;
alias GIT_ERROR_INDEX = git_error_t.GIT_ERROR_INDEX;
alias GIT_ERROR_OBJECT = git_error_t.GIT_ERROR_OBJECT;
alias GIT_ERROR_NET = git_error_t.GIT_ERROR_NET;
alias GIT_ERROR_TAG = git_error_t.GIT_ERROR_TAG;
alias GIT_ERROR_TREE = git_error_t.GIT_ERROR_TREE;
alias GIT_ERROR_INDEXER = git_error_t.GIT_ERROR_INDEXER;
alias GIT_ERROR_SSL = git_error_t.GIT_ERROR_SSL;
alias GIT_ERROR_SUBMODULE = git_error_t.GIT_ERROR_SUBMODULE;
alias GIT_ERROR_THREAD = git_error_t.GIT_ERROR_THREAD;
alias GIT_ERROR_STASH = git_error_t.GIT_ERROR_STASH;
alias GIT_ERROR_CHECKOUT = git_error_t.GIT_ERROR_CHECKOUT;
alias GIT_ERROR_FETCHHEAD = git_error_t.GIT_ERROR_FETCHHEAD;
alias GIT_ERROR_MERGE = git_error_t.GIT_ERROR_MERGE;
alias GIT_ERROR_SSH = git_error_t.GIT_ERROR_SSH;
alias GIT_ERROR_FILTER = git_error_t.GIT_ERROR_FILTER;
alias GIT_ERROR_REVERT = git_error_t.GIT_ERROR_REVERT;
alias GIT_ERROR_CALLBACK = git_error_t.GIT_ERROR_CALLBACK;
alias GIT_ERROR_CHERRYPICK = git_error_t.GIT_ERROR_CHERRYPICK;
alias GIT_ERROR_DESCRIBE = git_error_t.GIT_ERROR_DESCRIBE;
alias GIT_ERROR_REBASE = git_error_t.GIT_ERROR_REBASE;
alias GIT_ERROR_FILESYSTEM = git_error_t.GIT_ERROR_FILESYSTEM;
alias GIT_ERROR_PATCH = git_error_t.GIT_ERROR_PATCH;
alias GIT_ERROR_WORKTREE = git_error_t.GIT_ERROR_WORKTREE;
alias GIT_ERROR_SHA = git_error_t.GIT_ERROR_SHA;
alias GIT_ERROR_HTTP = git_error_t.GIT_ERROR_HTTP;
alias GIT_ERROR_INTERNAL = git_error_t.GIT_ERROR_INTERNAL;
alias GIT_ERROR_GRAFTS = git_error_t.GIT_ERROR_GRAFTS;

const(git_error)* git_error_last ();

void git_error_clear ();

void git_error_set (int error_class, const(char)* fmt, ...);

int git_error_set_str (int error_class, const(char)* string);

void git_error_set_oom ();

enum git_filter_mode_t
{
    GIT_FILTER_TO_WORKTREE = 0,
    GIT_FILTER_SMUDGE = GIT_FILTER_TO_WORKTREE,
    GIT_FILTER_TO_ODB = 1,
    GIT_FILTER_CLEAN = GIT_FILTER_TO_ODB
}

alias GIT_FILTER_TO_WORKTREE = git_filter_mode_t.GIT_FILTER_TO_WORKTREE;
alias GIT_FILTER_SMUDGE = git_filter_mode_t.GIT_FILTER_SMUDGE;
alias GIT_FILTER_TO_ODB = git_filter_mode_t.GIT_FILTER_TO_ODB;
alias GIT_FILTER_CLEAN = git_filter_mode_t.GIT_FILTER_CLEAN;

enum git_filter_flag_t
{
    GIT_FILTER_DEFAULT = 0u,

    GIT_FILTER_ALLOW_UNSAFE = 1u << 0,

    GIT_FILTER_NO_SYSTEM_ATTRIBUTES = 1u << 1,

    GIT_FILTER_ATTRIBUTES_FROM_HEAD = 1u << 2,

    GIT_FILTER_ATTRIBUTES_FROM_COMMIT = 1u << 3
}

alias GIT_FILTER_DEFAULT = git_filter_flag_t.GIT_FILTER_DEFAULT;
alias GIT_FILTER_ALLOW_UNSAFE = git_filter_flag_t.GIT_FILTER_ALLOW_UNSAFE;
alias GIT_FILTER_NO_SYSTEM_ATTRIBUTES = git_filter_flag_t.GIT_FILTER_NO_SYSTEM_ATTRIBUTES;
alias GIT_FILTER_ATTRIBUTES_FROM_HEAD = git_filter_flag_t.GIT_FILTER_ATTRIBUTES_FROM_HEAD;
alias GIT_FILTER_ATTRIBUTES_FROM_COMMIT = git_filter_flag_t.GIT_FILTER_ATTRIBUTES_FROM_COMMIT;

struct git_filter_options
{
    uint version_;

    uint flags;

    git_oid* commit_id;

    git_oid attr_commit_id;
}

struct git_filter;

struct git_filter_list;

int git_filter_list_load (
    git_filter_list** filters,
    scope git_repository* repo,
    git_blob* blob,
    const(char)* path,
    git_filter_mode_t mode,
    uint flags);

int git_filter_list_load_ext (
    git_filter_list** filters,
    scope git_repository* repo,
    git_blob* blob,
    const(char)* path,
    git_filter_mode_t mode,
    scope ref git_filter_options opts);

int git_filter_list_contains (git_filter_list* filters, const(char)* name);

int git_filter_list_apply_to_buffer (
    git_buf* out_,
    git_filter_list* filters,
    const(char)* in_,
    size_t in_len);

int git_filter_list_apply_to_file (
    git_buf* out_,
    git_filter_list* filters,
    scope git_repository* repo,
    const(char)* path);

int git_filter_list_apply_to_blob (
    git_buf* out_,
    git_filter_list* filters,
    git_blob* blob);

int git_filter_list_stream_buffer (
    git_filter_list* filters,
    const(char)* buffer,
    size_t len,
    git_writestream* target);

int git_filter_list_stream_file (
    git_filter_list* filters,
    scope git_repository* repo,
    const(char)* path,
    git_writestream* target);

int git_filter_list_stream_blob (
    git_filter_list* filters,
    git_blob* blob,
    git_writestream* target);

void git_filter_list_free (git_filter_list* filters);

struct git_rebase_options
{
    uint version_;

    int quiet;

    int inmemory;

    const(char)* rewrite_notes_ref;

    git_merge_options merge_options;

    git_checkout_options checkout_options;

    git_commit_create_cb commit_create_cb;

    int function (git_buf*, git_buf*, const(char)*, void*) signing_cb;

    void* payload;
}

enum git_rebase_operation_t
{
    GIT_REBASE_OPERATION_PICK = 0,

    GIT_REBASE_OPERATION_REWORD = 1,

    GIT_REBASE_OPERATION_EDIT = 2,

    GIT_REBASE_OPERATION_SQUASH = 3,

    GIT_REBASE_OPERATION_FIXUP = 4,

    GIT_REBASE_OPERATION_EXEC = 5
}

alias GIT_REBASE_OPERATION_PICK = git_rebase_operation_t.GIT_REBASE_OPERATION_PICK;
alias GIT_REBASE_OPERATION_REWORD = git_rebase_operation_t.GIT_REBASE_OPERATION_REWORD;
alias GIT_REBASE_OPERATION_EDIT = git_rebase_operation_t.GIT_REBASE_OPERATION_EDIT;
alias GIT_REBASE_OPERATION_SQUASH = git_rebase_operation_t.GIT_REBASE_OPERATION_SQUASH;
alias GIT_REBASE_OPERATION_FIXUP = git_rebase_operation_t.GIT_REBASE_OPERATION_FIXUP;
alias GIT_REBASE_OPERATION_EXEC = git_rebase_operation_t.GIT_REBASE_OPERATION_EXEC;

struct git_rebase_operation
{
    git_rebase_operation_t type;

    const git_oid id;

    const(char)* exec;
}

int git_rebase_options_init (scope ref git_rebase_options opts, uint version_);

int git_rebase_init (
    git_rebase** out_,
    scope git_repository* repo,
    const(git_annotated_commit)* branch,
    const(git_annotated_commit)* upstream,
    const(git_annotated_commit)* onto,
    scope const ref git_rebase_options opts);

int git_rebase_open (
    git_rebase** out_,
    scope git_repository* repo,
    scope const ref git_rebase_options opts);

const(char)* git_rebase_orig_head_name (git_rebase* rebase);

const(git_oid)* git_rebase_orig_head_id (git_rebase* rebase);

const(char)* git_rebase_onto_name (git_rebase* rebase);

const(git_oid)* git_rebase_onto_id (git_rebase* rebase);

size_t git_rebase_operation_entrycount (git_rebase* rebase);

size_t git_rebase_operation_current (git_rebase* rebase);

git_rebase_operation* git_rebase_operation_byindex (
    git_rebase* rebase,
    size_t idx);

int git_rebase_next (git_rebase_operation** operation, git_rebase* rebase);

int git_rebase_inmemory_index (git_index** index, git_rebase* rebase);

int git_rebase_commit (
    git_oid* id,
    git_rebase* rebase,
    const(git_signature)* author,
    const(git_signature)* committer,
    const(char)* message_encoding,
    const(char)* message);

int git_rebase_abort (git_rebase* rebase);

int git_rebase_finish (git_rebase* rebase, const(git_signature)* signature);

void git_rebase_free (git_rebase* rebase);

enum git_trace_level_t
{
    GIT_TRACE_NONE = 0,

    GIT_TRACE_FATAL = 1,

    GIT_TRACE_ERROR = 2,

    GIT_TRACE_WARN = 3,

    GIT_TRACE_INFO = 4,

    GIT_TRACE_DEBUG = 5,

    GIT_TRACE_TRACE = 6
}

alias GIT_TRACE_NONE = git_trace_level_t.GIT_TRACE_NONE;
alias GIT_TRACE_FATAL = git_trace_level_t.GIT_TRACE_FATAL;
alias GIT_TRACE_ERROR = git_trace_level_t.GIT_TRACE_ERROR;
alias GIT_TRACE_WARN = git_trace_level_t.GIT_TRACE_WARN;
alias GIT_TRACE_INFO = git_trace_level_t.GIT_TRACE_INFO;
alias GIT_TRACE_DEBUG = git_trace_level_t.GIT_TRACE_DEBUG;
alias GIT_TRACE_TRACE = git_trace_level_t.GIT_TRACE_TRACE;

alias git_trace_cb = void function (git_trace_level_t level, const(char)* msg);

int git_trace_set (git_trace_level_t level, git_trace_cb cb);

struct git_revert_options
{
    uint version_;

    uint mainline;

    git_merge_options merge_opts;
    git_checkout_options checkout_opts;
}

int git_revert_options_init (scope ref git_revert_options opts, uint version_);

int git_revert_commit (
    git_index** out_,
    scope git_repository* repo,
    git_commit* revert_commit,
    git_commit* our_commit,
    uint mainline,
    scope const ref git_merge_options merge_options);

int git_revert (
    scope git_repository* repo,
    git_commit* commit,
    scope const ref git_revert_options given_opts);

int git_revparse_single (
    scope out git_object* out_,
    scope git_repository* repo,
    const(char)* spec);

int git_revparse_ext (
    scope out git_object* object_out,
    git_reference** reference_out,
    scope git_repository* repo,
    const(char)* spec);

enum git_revspec_t
{
    GIT_REVSPEC_SINGLE = 1 << 0,

    GIT_REVSPEC_RANGE = 1 << 1,

    GIT_REVSPEC_MERGE_BASE = 1 << 2
}

alias GIT_REVSPEC_SINGLE = git_revspec_t.GIT_REVSPEC_SINGLE;
alias GIT_REVSPEC_RANGE = git_revspec_t.GIT_REVSPEC_RANGE;
alias GIT_REVSPEC_MERGE_BASE = git_revspec_t.GIT_REVSPEC_MERGE_BASE;

struct git_revspec
{
    git_object* from;

    git_object* to;

    uint flags;
}

int git_revparse (
    git_revspec* revspec,
    scope git_repository* repo,
    const(char)* spec);

enum git_stash_flags
{
    GIT_STASH_DEFAULT = 0,

    GIT_STASH_KEEP_INDEX = 1 << 0,

    GIT_STASH_INCLUDE_UNTRACKED = 1 << 1,

    GIT_STASH_INCLUDE_IGNORED = 1 << 2,

    GIT_STASH_KEEP_ALL = 1 << 3
}

alias GIT_STASH_DEFAULT = git_stash_flags.GIT_STASH_DEFAULT;
alias GIT_STASH_KEEP_INDEX = git_stash_flags.GIT_STASH_KEEP_INDEX;
alias GIT_STASH_INCLUDE_UNTRACKED = git_stash_flags.GIT_STASH_INCLUDE_UNTRACKED;
alias GIT_STASH_INCLUDE_IGNORED = git_stash_flags.GIT_STASH_INCLUDE_IGNORED;
alias GIT_STASH_KEEP_ALL = git_stash_flags.GIT_STASH_KEEP_ALL;

int git_stash_save (
    git_oid* out_,
    scope git_repository* repo,
    const(git_signature)* stasher,
    const(char)* message,
    uint flags);

struct git_stash_save_options
{
    uint version_;

    uint flags;

    const(git_signature)* stasher;

    const(char)* message;

    git_strarray paths;
}

int git_stash_save_options_init (scope ref git_stash_save_options opts, uint version_);

int git_stash_save_with_opts (
    git_oid* out_,
    scope git_repository* repo,
    scope const ref git_stash_save_options opts);

enum git_stash_apply_flags
{
    GIT_STASH_APPLY_DEFAULT = 0,

    GIT_STASH_APPLY_REINSTATE_INDEX = 1 << 0
}

alias GIT_STASH_APPLY_DEFAULT = git_stash_apply_flags.GIT_STASH_APPLY_DEFAULT;
alias GIT_STASH_APPLY_REINSTATE_INDEX = git_stash_apply_flags.GIT_STASH_APPLY_REINSTATE_INDEX;

enum git_stash_apply_progress_t
{
    GIT_STASH_APPLY_PROGRESS_NONE = 0,

    GIT_STASH_APPLY_PROGRESS_LOADING_STASH = 1,

    GIT_STASH_APPLY_PROGRESS_ANALYZE_INDEX = 2,

    GIT_STASH_APPLY_PROGRESS_ANALYZE_MODIFIED = 3,

    GIT_STASH_APPLY_PROGRESS_ANALYZE_UNTRACKED = 4,

    GIT_STASH_APPLY_PROGRESS_CHECKOUT_UNTRACKED = 5,

    GIT_STASH_APPLY_PROGRESS_CHECKOUT_MODIFIED = 6,

    GIT_STASH_APPLY_PROGRESS_DONE = 7
}

alias GIT_STASH_APPLY_PROGRESS_NONE = git_stash_apply_progress_t.GIT_STASH_APPLY_PROGRESS_NONE;
alias GIT_STASH_APPLY_PROGRESS_LOADING_STASH = git_stash_apply_progress_t.GIT_STASH_APPLY_PROGRESS_LOADING_STASH;
alias GIT_STASH_APPLY_PROGRESS_ANALYZE_INDEX = git_stash_apply_progress_t.GIT_STASH_APPLY_PROGRESS_ANALYZE_INDEX;
alias GIT_STASH_APPLY_PROGRESS_ANALYZE_MODIFIED = git_stash_apply_progress_t.GIT_STASH_APPLY_PROGRESS_ANALYZE_MODIFIED;
alias GIT_STASH_APPLY_PROGRESS_ANALYZE_UNTRACKED = git_stash_apply_progress_t.GIT_STASH_APPLY_PROGRESS_ANALYZE_UNTRACKED;
alias GIT_STASH_APPLY_PROGRESS_CHECKOUT_UNTRACKED = git_stash_apply_progress_t.GIT_STASH_APPLY_PROGRESS_CHECKOUT_UNTRACKED;
alias GIT_STASH_APPLY_PROGRESS_CHECKOUT_MODIFIED = git_stash_apply_progress_t.GIT_STASH_APPLY_PROGRESS_CHECKOUT_MODIFIED;
alias GIT_STASH_APPLY_PROGRESS_DONE = git_stash_apply_progress_t.GIT_STASH_APPLY_PROGRESS_DONE;

alias git_stash_apply_progress_cb = int function (
    git_stash_apply_progress_t progress,
    void* payload);

struct git_stash_apply_options
{
    uint version_;

    uint flags;

    git_checkout_options checkout_options;

    git_stash_apply_progress_cb progress_cb;
    void* progress_payload;
}

int git_stash_apply_options_init (scope ref git_stash_apply_options opts, uint version_);

int git_stash_apply (
    scope git_repository* repo,
    size_t index,
    scope const ref git_stash_apply_options options);

alias git_stash_cb = int function (
    size_t index,
    const(char)* message,
    const(git_oid)* stash_id,
    void* payload);

int git_stash_foreach (
    scope git_repository* repo,
    git_stash_cb callback,
    void* payload);

int git_stash_drop (scope git_repository* repo, size_t index);

int git_stash_pop (
    scope git_repository* repo,
    size_t index,
    scope const ref git_stash_apply_options options);

enum git_status_t
{
    GIT_STATUS_CURRENT = 0,

    GIT_STATUS_INDEX_NEW = 1u << 0,
    GIT_STATUS_INDEX_MODIFIED = 1u << 1,
    GIT_STATUS_INDEX_DELETED = 1u << 2,
    GIT_STATUS_INDEX_RENAMED = 1u << 3,
    GIT_STATUS_INDEX_TYPECHANGE = 1u << 4,

    GIT_STATUS_WT_NEW = 1u << 7,
    GIT_STATUS_WT_MODIFIED = 1u << 8,
    GIT_STATUS_WT_DELETED = 1u << 9,
    GIT_STATUS_WT_TYPECHANGE = 1u << 10,
    GIT_STATUS_WT_RENAMED = 1u << 11,
    GIT_STATUS_WT_UNREADABLE = 1u << 12,

    GIT_STATUS_IGNORED = 1u << 14,
    GIT_STATUS_CONFLICTED = 1u << 15
}

alias GIT_STATUS_CURRENT = git_status_t.GIT_STATUS_CURRENT;
alias GIT_STATUS_INDEX_NEW = git_status_t.GIT_STATUS_INDEX_NEW;
alias GIT_STATUS_INDEX_MODIFIED = git_status_t.GIT_STATUS_INDEX_MODIFIED;
alias GIT_STATUS_INDEX_DELETED = git_status_t.GIT_STATUS_INDEX_DELETED;
alias GIT_STATUS_INDEX_RENAMED = git_status_t.GIT_STATUS_INDEX_RENAMED;
alias GIT_STATUS_INDEX_TYPECHANGE = git_status_t.GIT_STATUS_INDEX_TYPECHANGE;
alias GIT_STATUS_WT_NEW = git_status_t.GIT_STATUS_WT_NEW;
alias GIT_STATUS_WT_MODIFIED = git_status_t.GIT_STATUS_WT_MODIFIED;
alias GIT_STATUS_WT_DELETED = git_status_t.GIT_STATUS_WT_DELETED;
alias GIT_STATUS_WT_TYPECHANGE = git_status_t.GIT_STATUS_WT_TYPECHANGE;
alias GIT_STATUS_WT_RENAMED = git_status_t.GIT_STATUS_WT_RENAMED;
alias GIT_STATUS_WT_UNREADABLE = git_status_t.GIT_STATUS_WT_UNREADABLE;
alias GIT_STATUS_IGNORED = git_status_t.GIT_STATUS_IGNORED;
alias GIT_STATUS_CONFLICTED = git_status_t.GIT_STATUS_CONFLICTED;

alias git_status_cb = int function (
    const(char)* path,
    uint status_flags,
    void* payload);

enum git_status_show_t
{
    GIT_STATUS_SHOW_INDEX_AND_WORKDIR = 0,

    GIT_STATUS_SHOW_INDEX_ONLY = 1,

    GIT_STATUS_SHOW_WORKDIR_ONLY = 2
}

alias GIT_STATUS_SHOW_INDEX_AND_WORKDIR = git_status_show_t.GIT_STATUS_SHOW_INDEX_AND_WORKDIR;
alias GIT_STATUS_SHOW_INDEX_ONLY = git_status_show_t.GIT_STATUS_SHOW_INDEX_ONLY;
alias GIT_STATUS_SHOW_WORKDIR_ONLY = git_status_show_t.GIT_STATUS_SHOW_WORKDIR_ONLY;

enum git_status_opt_t
{
    GIT_STATUS_OPT_INCLUDE_UNTRACKED = 1u << 0,

    GIT_STATUS_OPT_INCLUDE_IGNORED = 1u << 1,

    GIT_STATUS_OPT_INCLUDE_UNMODIFIED = 1u << 2,

    GIT_STATUS_OPT_EXCLUDE_SUBMODULES = 1u << 3,

    GIT_STATUS_OPT_RECURSE_UNTRACKED_DIRS = 1u << 4,

    GIT_STATUS_OPT_DISABLE_PATHSPEC_MATCH = 1u << 5,

    GIT_STATUS_OPT_RECURSE_IGNORED_DIRS = 1u << 6,

    GIT_STATUS_OPT_RENAMES_HEAD_TO_INDEX = 1u << 7,

    GIT_STATUS_OPT_RENAMES_INDEX_TO_WORKDIR = 1u << 8,

    GIT_STATUS_OPT_SORT_CASE_SENSITIVELY = 1u << 9,

    GIT_STATUS_OPT_SORT_CASE_INSENSITIVELY = 1u << 10,

    GIT_STATUS_OPT_RENAMES_FROM_REWRITES = 1u << 11,

    GIT_STATUS_OPT_NO_REFRESH = 1u << 12,

    GIT_STATUS_OPT_UPDATE_INDEX = 1u << 13,

    GIT_STATUS_OPT_INCLUDE_UNREADABLE = 1u << 14,

    GIT_STATUS_OPT_INCLUDE_UNREADABLE_AS_UNTRACKED = 1u << 15
}

alias GIT_STATUS_OPT_INCLUDE_UNTRACKED = git_status_opt_t.GIT_STATUS_OPT_INCLUDE_UNTRACKED;
alias GIT_STATUS_OPT_INCLUDE_IGNORED = git_status_opt_t.GIT_STATUS_OPT_INCLUDE_IGNORED;
alias GIT_STATUS_OPT_INCLUDE_UNMODIFIED = git_status_opt_t.GIT_STATUS_OPT_INCLUDE_UNMODIFIED;
alias GIT_STATUS_OPT_EXCLUDE_SUBMODULES = git_status_opt_t.GIT_STATUS_OPT_EXCLUDE_SUBMODULES;
alias GIT_STATUS_OPT_RECURSE_UNTRACKED_DIRS = git_status_opt_t.GIT_STATUS_OPT_RECURSE_UNTRACKED_DIRS;
alias GIT_STATUS_OPT_DISABLE_PATHSPEC_MATCH = git_status_opt_t.GIT_STATUS_OPT_DISABLE_PATHSPEC_MATCH;
alias GIT_STATUS_OPT_RECURSE_IGNORED_DIRS = git_status_opt_t.GIT_STATUS_OPT_RECURSE_IGNORED_DIRS;
alias GIT_STATUS_OPT_RENAMES_HEAD_TO_INDEX = git_status_opt_t.GIT_STATUS_OPT_RENAMES_HEAD_TO_INDEX;
alias GIT_STATUS_OPT_RENAMES_INDEX_TO_WORKDIR = git_status_opt_t.GIT_STATUS_OPT_RENAMES_INDEX_TO_WORKDIR;
alias GIT_STATUS_OPT_SORT_CASE_SENSITIVELY = git_status_opt_t.GIT_STATUS_OPT_SORT_CASE_SENSITIVELY;
alias GIT_STATUS_OPT_SORT_CASE_INSENSITIVELY = git_status_opt_t.GIT_STATUS_OPT_SORT_CASE_INSENSITIVELY;
alias GIT_STATUS_OPT_RENAMES_FROM_REWRITES = git_status_opt_t.GIT_STATUS_OPT_RENAMES_FROM_REWRITES;
alias GIT_STATUS_OPT_NO_REFRESH = git_status_opt_t.GIT_STATUS_OPT_NO_REFRESH;
alias GIT_STATUS_OPT_UPDATE_INDEX = git_status_opt_t.GIT_STATUS_OPT_UPDATE_INDEX;
alias GIT_STATUS_OPT_INCLUDE_UNREADABLE = git_status_opt_t.GIT_STATUS_OPT_INCLUDE_UNREADABLE;
alias GIT_STATUS_OPT_INCLUDE_UNREADABLE_AS_UNTRACKED = git_status_opt_t.GIT_STATUS_OPT_INCLUDE_UNREADABLE_AS_UNTRACKED;

struct git_status_options
{
    uint version_;

    git_status_show_t show;

    uint flags;

    git_strarray pathspec;

    git_tree* baseline;

    ushort rename_threshold;
}

int git_status_options_init (scope ref git_status_options opts, uint version_);

struct git_status_entry
{
    git_status_t status;
    git_diff_delta* head_to_index;
    git_diff_delta* index_to_workdir;
}

int git_status_foreach (
    scope git_repository* repo,
    git_status_cb callback,
    void* payload);

int git_status_foreach_ext (
    scope git_repository* repo,
    scope const ref git_status_options opts,
    git_status_cb callback,
    void* payload);

int git_status_file (
    out uint status_flags,
    scope git_repository* repo,
    const(char)* path);

int git_status_list_new (
    git_status_list** out_,
    scope git_repository* repo,
    scope const ref git_status_options opts);

size_t git_status_list_entrycount (git_status_list* statuslist);

const(git_status_entry)* git_status_byindex (
    git_status_list* statuslist,
    size_t idx);

void git_status_list_free (git_status_list* statuslist);

int git_status_should_ignore (
    out int ignored,
    scope git_repository* repo,
    const(char)* path);

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
    GIT_SUBMODULE_STATUS_WD_UNTRACKED = 1u << 13
}

alias GIT_SUBMODULE_STATUS_IN_HEAD = git_submodule_status_t.GIT_SUBMODULE_STATUS_IN_HEAD;
alias GIT_SUBMODULE_STATUS_IN_INDEX = git_submodule_status_t.GIT_SUBMODULE_STATUS_IN_INDEX;
alias GIT_SUBMODULE_STATUS_IN_CONFIG = git_submodule_status_t.GIT_SUBMODULE_STATUS_IN_CONFIG;
alias GIT_SUBMODULE_STATUS_IN_WD = git_submodule_status_t.GIT_SUBMODULE_STATUS_IN_WD;
alias GIT_SUBMODULE_STATUS_INDEX_ADDED = git_submodule_status_t.GIT_SUBMODULE_STATUS_INDEX_ADDED;
alias GIT_SUBMODULE_STATUS_INDEX_DELETED = git_submodule_status_t.GIT_SUBMODULE_STATUS_INDEX_DELETED;
alias GIT_SUBMODULE_STATUS_INDEX_MODIFIED = git_submodule_status_t.GIT_SUBMODULE_STATUS_INDEX_MODIFIED;
alias GIT_SUBMODULE_STATUS_WD_UNINITIALIZED = git_submodule_status_t.GIT_SUBMODULE_STATUS_WD_UNINITIALIZED;
alias GIT_SUBMODULE_STATUS_WD_ADDED = git_submodule_status_t.GIT_SUBMODULE_STATUS_WD_ADDED;
alias GIT_SUBMODULE_STATUS_WD_DELETED = git_submodule_status_t.GIT_SUBMODULE_STATUS_WD_DELETED;
alias GIT_SUBMODULE_STATUS_WD_MODIFIED = git_submodule_status_t.GIT_SUBMODULE_STATUS_WD_MODIFIED;
alias GIT_SUBMODULE_STATUS_WD_INDEX_MODIFIED = git_submodule_status_t.GIT_SUBMODULE_STATUS_WD_INDEX_MODIFIED;
alias GIT_SUBMODULE_STATUS_WD_WD_MODIFIED = git_submodule_status_t.GIT_SUBMODULE_STATUS_WD_WD_MODIFIED;
alias GIT_SUBMODULE_STATUS_WD_UNTRACKED = git_submodule_status_t.GIT_SUBMODULE_STATUS_WD_UNTRACKED;

struct git_submodule_update_options
{
    uint version_;

    git_checkout_options checkout_opts;

    git_fetch_options fetch_opts;

    int allow_fetch;
}

int git_submodule_update_options_init (
    scope ref git_submodule_update_options opts,
    uint version_);

int git_submodule_update (scope git_submodule* submodule, int init, scope ref git_submodule_update_options options);

int git_submodule_lookup (
    scope out git_submodule* out_,
    scope git_repository* repo,
    const(char)* name);

int git_submodule_dup (scope out git_submodule* out_, scope git_submodule* source);

void git_submodule_free (scope git_submodule* submodule);

int git_submodule_foreach (
    scope git_repository* repo,
    git_submodule_cb callback,
    void* payload);

int git_submodule_add_setup (
    scope out git_submodule* out_,
    scope git_repository* repo,
    const(char)* url,
    const(char)* path,
    int use_gitlink);

int git_submodule_clone (
    scope out git_repository* out_,
    scope git_submodule* submodule,
    scope const ref git_submodule_update_options opts);

int git_submodule_add_finalize (scope git_submodule* submodule);

int git_submodule_add_to_index (scope git_submodule* submodule, int write_index);

git_repository* git_submodule_owner (scope git_submodule* submodule);

const(char)* git_submodule_name (scope git_submodule* submodule);

const(char)* git_submodule_path (scope git_submodule* submodule);

const(char)* git_submodule_url (scope git_submodule* submodule);

int git_submodule_resolve_url (git_buf* out_, scope git_repository* repo, const(char)* url);

const(char)* git_submodule_branch (scope git_submodule* submodule);

int git_submodule_set_branch (scope git_repository* repo, const(char)* name, const(char)* branch);

int git_submodule_set_url (scope git_repository* repo, const(char)* name, const(char)* url);

const(git_oid)* git_submodule_index_id (scope git_submodule* submodule);

const(git_oid)* git_submodule_head_id (scope git_submodule* submodule);

const(git_oid)* git_submodule_wd_id (scope git_submodule* submodule);

git_submodule_ignore_t git_submodule_ignore (scope git_submodule* submodule);

int git_submodule_set_ignore (
    scope git_repository* repo,
    const(char)* name,
    git_submodule_ignore_t ignore);

git_submodule_update_t git_submodule_update_strategy (scope git_submodule* submodule);

int git_submodule_set_update (
    scope git_repository* repo,
    const(char)* name,
    git_submodule_update_t update);

git_submodule_recurse_t git_submodule_fetch_recurse_submodules (
    scope git_submodule* submodule);

int git_submodule_set_fetch_recurse_submodules (
    scope git_repository* repo,
    const(char)* name,
    git_submodule_recurse_t fetch_recurse_submodules);

int git_submodule_init (scope git_submodule* submodule, int overwrite);

int git_submodule_repo_init (
    scope out git_repository* out_,
    scope const(git_submodule)* sm,
    int use_gitlink);

int git_submodule_sync (scope git_submodule* submodule);

int git_submodule_open (scope out git_repository* repo, scope git_submodule* submodule);

int git_submodule_reload (scope git_submodule* submodule, int force);

int git_submodule_status (
    out uint status,
    scope git_repository* repo,
    const(char)* name,
    git_submodule_ignore_t ignore);

int git_submodule_location (out uint location_status, scope git_submodule* submodule);

int git_worktree_list (scope ref git_strarray out_, scope git_repository* repo);

int git_worktree_lookup (git_worktree** out_, scope git_repository* repo, const(char)* name);

int git_worktree_open_from_repository (git_worktree** out_, scope git_repository* repo);

void git_worktree_free (git_worktree* wt);

int git_worktree_validate (const(git_worktree)* wt);

struct git_worktree_add_options
{
    uint version_;

    int lock;
    git_reference* ref_;

    git_checkout_options checkout_options;
}

int git_worktree_add_options_init (
    scope ref git_worktree_add_options opts,
    uint version_);

int git_worktree_add (
    git_worktree** out_,
    scope git_repository* repo,
    const(char)* name,
    const(char)* path,
    scope const ref git_worktree_add_options opts);

int git_worktree_lock (git_worktree* wt, const(char)* reason);

int git_worktree_unlock (git_worktree* wt);

int git_worktree_is_locked (git_buf* reason, const(git_worktree)* wt);

const(char)* git_worktree_name (const(git_worktree)* wt);

const(char)* git_worktree_path (const(git_worktree)* wt);

enum git_worktree_prune_t
{
    GIT_WORKTREE_PRUNE_VALID = 1u << 0,

    GIT_WORKTREE_PRUNE_LOCKED = 1u << 1,

    GIT_WORKTREE_PRUNE_WORKING_TREE = 1u << 2
}

alias GIT_WORKTREE_PRUNE_VALID = git_worktree_prune_t.GIT_WORKTREE_PRUNE_VALID;
alias GIT_WORKTREE_PRUNE_LOCKED = git_worktree_prune_t.GIT_WORKTREE_PRUNE_LOCKED;
alias GIT_WORKTREE_PRUNE_WORKING_TREE = git_worktree_prune_t.GIT_WORKTREE_PRUNE_WORKING_TREE;

struct git_worktree_prune_options
{
    uint version_;

    uint flags;
}

int git_worktree_prune_options_init (
    scope ref git_worktree_prune_options opts,
    uint version_);

int git_worktree_is_prunable (
    git_worktree* wt,
    scope ref git_worktree_prune_options opts);

int git_worktree_prune (git_worktree* wt, scope ref git_worktree_prune_options opts);

struct git_credential_userpass_payload
{
    const(char)* username;
    const(char)* password;
}

int git_credential_userpass (
    git_credential** out_,
    const(char)* url,
    const(char)* user_from_url,
    uint allowed_types,
    void* payload);

struct git_credential
{
    git_credential_t credtype;

    void function (git_credential* cred) free;
}

struct git_credential_userpass_plaintext
{
    git_credential parent;
    char* username;
    char* password;
}

struct git_credential_username
{
    git_credential parent;
    char[1] username;
}

struct git_credential_ssh_key
{
    git_credential parent;
    char* username;
    char* publickey;
    char* privatekey;
    char* passphrase;
}

struct git_credential_ssh_interactive
{
    git_credential parent;
    char* username;

    git_credential_ssh_interactive_cb prompt_callback;

    void* payload;
}

struct git_credential_ssh_custom
{
    git_credential parent;
    char* username;
    char* publickey;
    size_t publickey_len;

    git_credential_sign_cb sign_callback;

    void* payload;
}

alias git_attr_t = git_attr_value_t;

int git_blob_create_fromworkdir (git_oid* id, scope git_repository* repo, const(char)* relative_path);
int git_blob_create_fromdisk (git_oid* id, scope git_repository* repo, const(char)* path);
int git_blob_create_fromstream (
    git_writestream** out_,
    scope git_repository* repo,
    const(char)* hintpath);
int git_blob_create_fromstream_commit (git_oid* out_, git_writestream* stream);
int git_blob_create_frombuffer (
    git_oid* id,
    scope git_repository* repo,
    const(void)* buffer,
    size_t len);

int git_blob_filtered_content (
    git_buf* out_,
    git_blob* blob,
    const(char)* as_path,
    int check_for_binary_data);

int git_filter_list_stream_data (
    git_filter_list* filters,
    git_buf* data,
    git_writestream* target);

int git_filter_list_apply_to_data (
    git_buf* out_,
    git_filter_list* filters,
    git_buf* in_);

int git_treebuilder_write_with_buffer (
    git_oid* oid,
    git_treebuilder* bld,
    git_buf* tree);

int git_buf_grow (git_buf* buffer, size_t target_size);

int git_buf_set (git_buf* buffer, const(void)* data, size_t datalen);

int git_buf_is_binary (const(git_buf)* buf);

int git_buf_contains_nul (const(git_buf)* buf);

void git_buf_free (git_buf* buffer);

alias git_commit_signing_cb = int function (
    git_buf* signature,
    git_buf* signature_field,
    const(char)* commit_content,
    void* payload);

alias git_cvar_map = git_configmap;

enum git_diff_format_email_flags_t
{
    GIT_DIFF_FORMAT_EMAIL_NONE = 0,

    GIT_DIFF_FORMAT_EMAIL_EXCLUDE_SUBJECT_PATCH_MARKER = 1 << 0
}

alias GIT_DIFF_FORMAT_EMAIL_NONE = git_diff_format_email_flags_t.GIT_DIFF_FORMAT_EMAIL_NONE;
alias GIT_DIFF_FORMAT_EMAIL_EXCLUDE_SUBJECT_PATCH_MARKER = git_diff_format_email_flags_t.GIT_DIFF_FORMAT_EMAIL_EXCLUDE_SUBJECT_PATCH_MARKER;

struct git_diff_format_email_options
{
    uint version_;

    uint flags;

    size_t patch_no;

    size_t total_patches;

    const(git_oid)* id;

    const(char)* summary;

    const(char)* body_;

    const(git_signature)* author;
}

int git_diff_format_email (
    git_buf* out_,
    git_diff* diff,
    scope const ref git_diff_format_email_options opts);

int git_diff_commit_as_email (
    git_buf* out_,
    scope git_repository* repo,
    git_commit* commit,
    size_t patch_no,
    size_t total_patches,
    uint flags,
    scope const ref git_diff_options diff_opts);

int git_diff_format_email_options_init (
    scope ref git_diff_format_email_options opts,
    uint version_);

const(git_error)* giterr_last ();

void giterr_clear ();

void giterr_set_str (int error_class, const(char)* string);

void giterr_set_oom ();

int git_index_add_frombuffer (
    git_index* index,
    const(git_index_entry)* entry,
    const(void)* buffer,
    size_t len);

size_t git_object__size (git_object_t type);

int git_remote_is_valid_name (const(char)* remote_name);

int git_reference_is_valid_name (const(char)* refname);

int git_tag_create_frombuffer (
    git_oid* oid,
    scope git_repository* repo,
    const(char)* buffer,
    int force);

alias git_revparse_mode_t = git_revspec_t;

alias git_cred = git_credential;
alias git_cred_userpass_plaintext = git_credential_userpass_plaintext;
alias git_cred_username = git_credential_username;
alias git_cred_default = git_credential;
alias git_cred_ssh_key = git_credential_ssh_key;
alias git_cred_ssh_interactive = git_credential_ssh_interactive;
alias git_cred_ssh_custom = git_credential_ssh_custom;

alias git_cred_acquire_cb = int function ();
alias git_cred_sign_callback = int function ();
alias git_cred_sign_cb = int function ();
alias git_cred_ssh_interactive_callback = void function ();
alias git_cred_ssh_interactive_cb = void function ();

void git_cred_free (git_credential* cred);
int git_cred_has_username (git_credential* cred);
const(char)* git_cred_get_username (git_credential* cred);
int git_cred_userpass_plaintext_new (
    git_credential** out_,
    const(char)* username,
    const(char)* password);
int git_cred_default_new (git_credential** out_);
int git_cred_username_new (git_credential** out_, const(char)* username);
int git_cred_ssh_key_new (
    git_credential** out_,
    const(char)* username,
    const(char)* publickey,
    const(char)* privatekey,
    const(char)* passphrase);
int git_cred_ssh_key_memory_new (
    git_credential** out_,
    const(char)* username,
    const(char)* publickey,
    const(char)* privatekey,
    const(char)* passphrase);
int git_cred_ssh_interactive_new (
    git_credential** out_,
    const(char)* username,
    git_credential_ssh_interactive_cb prompt_callback,
    void* payload);
int git_cred_ssh_key_from_agent (git_credential** out_, const(char)* username);
int git_cred_ssh_custom_new (
    git_credential** out_,
    const(char)* username,
    const(char)* publickey,
    size_t publickey_len,
    git_credential_sign_cb sign_callback,
    void* payload);

alias git_cred_userpass_payload = git_credential_userpass_payload;

int git_cred_userpass (
    git_credential** out_,
    const(char)* url,
    const(char)* user_from_url,
    uint allowed_types,
    void* payload);

alias git_trace_callback = void function ();

int git_oid_iszero (const(git_oid)* id);

void git_oidarray_free (git_oidarray* array);

alias git_transfer_progress = git_indexer_progress;

alias git_transfer_progress_cb = int function ();

alias git_push_transfer_progress = int function ();

alias git_headlist_cb = int function (git_remote_head* rhead, void* payload);

int git_strarray_copy (scope ref git_strarray tgt, scope const ref git_strarray src);

void git_strarray_free (scope ref git_strarray array);

int git_blame_init_options (scope git_blame_options* opts, uint version_);
int git_checkout_init_options (scope git_checkout_options* opts, uint version_);
int git_cherrypick_init_options (scope git_cherrypick_options* opts, uint version_);
int git_clone_init_options (scope git_clone_options* opts, uint version_);
int git_describe_init_options (scope git_describe_options* opts, uint version_);
int git_describe_init_format_options (scope ref git_describe_format_options opts, uint version_);
int git_diff_init_options (scope git_diff_options* opts, uint version_);
int git_diff_find_init_options (scope git_diff_find_options* opts, uint version_);
int git_diff_format_email_init_options (scope git_diff_format_email_options* opts, uint version_);
int git_diff_patchid_init_options (scope git_diff_patchid_options* opts, uint version_);
int git_fetch_init_options (scope git_fetch_options* opts, uint version_);
int git_indexer_init_options (scope git_indexer_options* opts, uint version_);
int git_merge_init_options (scope git_merge_options* opts, uint version_);
int git_merge_file_init_input (git_merge_file_input* input, uint version_);
int git_merge_file_init_options (scope git_merge_file_options* opts, uint version_);
int git_proxy_init_options (scope git_proxy_options* opts, uint version_);
int git_push_init_options (scope git_push_options* opts, uint version_);
int git_rebase_init_options (scope git_rebase_options* opts, uint version_);
int git_remote_create_init_options (scope git_remote_create_options* opts, uint version_);
int git_repository_init_init_options (scope git_repository_init_options* opts, uint version_);
int git_revert_init_options (scope git_revert_options* opts, uint version_);
int git_stash_apply_init_options (scope git_stash_apply_options* opts, uint version_);
int git_status_init_options (scope git_status_options* opts, uint version_);
int git_submodule_update_init_options (scope git_submodule_update_options* opts, uint version_);
int git_worktree_add_init_options (scope git_worktree_add_options* opts, uint version_);
int git_worktree_prune_init_options (scope git_worktree_prune_options* opts, uint version_);

enum git_email_create_flags_t
{
    GIT_EMAIL_CREATE_DEFAULT = 0,

    GIT_EMAIL_CREATE_OMIT_NUMBERS = 1u << 0,

    GIT_EMAIL_CREATE_ALWAYS_NUMBER = 1u << 1,

    GIT_EMAIL_CREATE_NO_RENAMES = 1u << 2
}

alias GIT_EMAIL_CREATE_DEFAULT = git_email_create_flags_t.GIT_EMAIL_CREATE_DEFAULT;
alias GIT_EMAIL_CREATE_OMIT_NUMBERS = git_email_create_flags_t.GIT_EMAIL_CREATE_OMIT_NUMBERS;
alias GIT_EMAIL_CREATE_ALWAYS_NUMBER = git_email_create_flags_t.GIT_EMAIL_CREATE_ALWAYS_NUMBER;
alias GIT_EMAIL_CREATE_NO_RENAMES = git_email_create_flags_t.GIT_EMAIL_CREATE_NO_RENAMES;

struct git_email_create_options
{
    uint version_;

    uint flags;

    git_diff_options diff_opts;

    git_diff_find_options diff_find_opts;

    const(char)* subject_prefix;

    size_t start_number;

    size_t reroll_number;
}

int git_email_create_from_diff (
    git_buf* out_,
    git_diff* diff,
    size_t patch_idx,
    size_t patch_count,
    const(git_oid)* commit_id,
    const(char)* summary,
    const(char)* body_,
    const(git_signature)* author,
    scope const ref git_email_create_options opts);

int git_email_create_from_commit (
    git_buf* out_,
    git_commit* commit,
    scope const ref git_email_create_options opts);

int git_libgit2_init ();

int git_libgit2_shutdown ();

int git_graph_ahead_behind (size_t* ahead, size_t* behind, scope git_repository* repo, const(git_oid)* local, const(git_oid)* upstream);

int git_graph_descendant_of (
    scope git_repository* repo,
    const(git_oid)* commit,
    const(git_oid)* ancestor);

int git_graph_reachable_from_any (
    scope git_repository* repo,
    const(git_oid)* commit,
    const(git_oid)* descendant_array,
    size_t length);

int git_ignore_add_rule (scope git_repository* repo, const(char)* rules);

int git_ignore_clear_internal_rules (scope git_repository* repo);

int git_ignore_path_is_ignored (
    out int ignored,
    scope git_repository* repo,
    const(char)* path);

int git_mailmap_new (git_mailmap** out_);

void git_mailmap_free (git_mailmap* mm);

int git_mailmap_add_entry (
    git_mailmap* mm,
    const(char)* real_name,
    const(char)* real_email,
    const(char)* replace_name,
    const(char)* replace_email);

int git_mailmap_from_buffer (git_mailmap** out_, const(char)* buf, size_t len);

int git_mailmap_from_repository (git_mailmap** out_, scope git_repository* repo);

int git_mailmap_resolve (
    const(char*)* real_name,
    const(char*)* real_email,
    const(git_mailmap)* mm,
    const(char)* name,
    const(char)* email);

int git_mailmap_resolve_signature (
    git_signature** out_,
    const(git_mailmap)* mm,
    const(git_signature)* sig);

int git_message_prettify (git_buf* out_, const(char)* message, int strip_comments, char comment_char);

struct git_message_trailer
{
    const(char)* key;
    const(char)* value;
}

struct git_message_trailer_array
{
    git_message_trailer* trailers;
    size_t count;

    char* _trailer_block;
}

int git_message_trailers (git_message_trailer_array* arr, const(char)* message);

void git_message_trailer_array_free (git_message_trailer_array* arr);

alias git_note_foreach_cb = int function (
    const(git_oid)* blob_id,
    const(git_oid)* annotated_object_id,
    void* payload);

struct git_iterator;
alias git_note_iterator = git_iterator;

int git_note_iterator_new (
    git_note_iterator** out_,
    scope git_repository* repo,
    const(char)* notes_ref);

int git_note_commit_iterator_new (
    git_note_iterator** out_,
    git_commit* notes_commit);

void git_note_iterator_free (git_note_iterator* it);

int git_note_next (
    git_oid* note_id,
    git_oid* annotated_id,
    git_note_iterator* it);

int git_note_read (
    git_note** out_,
    scope git_repository* repo,
    const(char)* notes_ref,
    const(git_oid)* oid);

int git_note_commit_read (
    git_note** out_,
    scope git_repository* repo,
    git_commit* notes_commit,
    const(git_oid)* oid);

const(git_signature)* git_note_author (const(git_note)* note);

const(git_signature)* git_note_committer (const(git_note)* note);

const(char)* git_note_message (const(git_note)* note);

const(git_oid)* git_note_id (const(git_note)* note);

int git_note_create (
    git_oid* out_,
    scope git_repository* repo,
    const(char)* notes_ref,
    const(git_signature)* author,
    const(git_signature)* committer,
    const(git_oid)* oid,
    const(char)* note,
    int force);

int git_note_commit_create (
    git_oid* notes_commit_out,
    git_oid* notes_blob_out,
    scope git_repository* repo,
    git_commit* parent,
    const(git_signature)* author,
    const(git_signature)* committer,
    const(git_oid)* oid,
    const(char)* note,
    int allow_note_overwrite);

int git_note_remove (
    scope git_repository* repo,
    const(char)* notes_ref,
    const(git_signature)* author,
    const(git_signature)* committer,
    const(git_oid)* oid);

int git_note_commit_remove (
    git_oid* notes_commit_out,
    scope git_repository* repo,
    git_commit* notes_commit,
    const(git_signature)* author,
    const(git_signature)* committer,
    const(git_oid)* oid);

void git_note_free (git_note* note);

int git_note_default_ref (git_buf* out_, scope git_repository* repo);

int git_note_foreach (
    scope git_repository* repo,
    const(char)* notes_ref,
    git_note_foreach_cb note_cb,
    void* payload);

enum git_odb_lookup_flags_t
{
    GIT_ODB_LOOKUP_NO_REFRESH = 1 << 0
}

alias GIT_ODB_LOOKUP_NO_REFRESH = git_odb_lookup_flags_t.GIT_ODB_LOOKUP_NO_REFRESH;

alias git_odb_foreach_cb = int function (const(git_oid)* id, void* payload);

struct git_odb_options
{
    uint version_;

    git_oid_t oid_type;
}

int git_odb_new (git_odb** out_);

int git_odb_open (git_odb** out_, const(char)* objects_dir);

int git_odb_add_disk_alternate (git_odb* odb, const(char)* path);

void git_odb_free (git_odb* db);

int git_odb_read (git_odb_object** out_, git_odb* db, const(git_oid)* id);

int git_odb_read_prefix (git_odb_object** out_, git_odb* db, const(git_oid)* short_id, size_t len);

int git_odb_read_header (size_t* len_out, git_object_t* type_out, git_odb* db, const(git_oid)* id);

int git_odb_exists (git_odb* db, const(git_oid)* id);

int git_odb_exists_ext (git_odb* db, const(git_oid)* id, uint flags);

int git_odb_exists_prefix (
    git_oid* out_,
    git_odb* db,
    const(git_oid)* short_id,
    size_t len);

struct git_odb_expand_id
{
    git_oid id;

    ushort length;

    git_object_t type;
}

int git_odb_expand_ids (git_odb* db, git_odb_expand_id* ids, size_t count);

int git_odb_refresh (git_odb* db);

int git_odb_foreach (git_odb* db, git_odb_foreach_cb cb, void* payload);

int git_odb_write (git_oid* out_, git_odb* odb, const(void)* data, size_t len, git_object_t type);

int git_odb_open_wstream (git_odb_stream** out_, git_odb* db, git_object_size_t size, git_object_t type);

int git_odb_stream_write (git_odb_stream* stream, const(char)* buffer, size_t len);

int git_odb_stream_finalize_write (git_oid* out_, git_odb_stream* stream);

int git_odb_stream_read (git_odb_stream* stream, char* buffer, size_t len);

void git_odb_stream_free (git_odb_stream* stream);

int git_odb_open_rstream (
    git_odb_stream** out_,
    size_t* len,
    git_object_t* type,
    git_odb* db,
    const(git_oid)* oid);

int git_odb_write_pack (
    git_odb_writepack** out_,
    git_odb* db,
    git_indexer_progress_cb progress_cb,
    void* progress_payload);

int git_odb_write_multi_pack_index (git_odb* db);

int git_odb_hash (git_oid* out_, const(void)* data, size_t len, git_object_t type);

int git_odb_hashfile (git_oid* out_, const(char)* path, git_object_t type);

int git_odb_object_dup (git_odb_object** dest, git_odb_object* source);

void git_odb_object_free (git_odb_object* object);

const(git_oid)* git_odb_object_id (git_odb_object* object);

const(void)* git_odb_object_data (git_odb_object* object);

size_t git_odb_object_size (git_odb_object* object);

git_object_t git_odb_object_type (git_odb_object* object);

int git_odb_add_backend (git_odb* odb, git_odb_backend* backend, int priority);

int git_odb_add_alternate (git_odb* odb, git_odb_backend* backend, int priority);

size_t git_odb_num_backends (git_odb* odb);

int git_odb_get_backend (git_odb_backend** out_, git_odb* odb, size_t pos);

int git_odb_set_commit_graph (git_odb* odb, git_commit_graph* cgraph);

struct git_odb_backend_pack_options
{
    uint version_;

    git_oid_t oid_type;
}

int git_odb_backend_pack (git_odb_backend** out_, const(char)* objects_dir);

int git_odb_backend_one_pack (git_odb_backend** out_, const(char)* index_file);

enum git_odb_backend_loose_flag_t
{
    GIT_ODB_BACKEND_LOOSE_FSYNC = 1 << 0
}

alias GIT_ODB_BACKEND_LOOSE_FSYNC = git_odb_backend_loose_flag_t.GIT_ODB_BACKEND_LOOSE_FSYNC;

struct git_odb_backend_loose_options
{
    uint version_;

    uint flags;

    int compression_level;

    uint dir_mode;

    uint file_mode;

    git_oid_t oid_type;
}

int git_odb_backend_loose (
    git_odb_backend** out_,
    const(char)* objects_dir,
    int compression_level,
    int do_fsync,
    uint dir_mode,
    uint file_mode);

enum git_odb_stream_t
{
    GIT_STREAM_RDONLY = 1 << 1,
    GIT_STREAM_WRONLY = 1 << 2,
    GIT_STREAM_RW = GIT_STREAM_RDONLY | GIT_STREAM_WRONLY
}

alias GIT_STREAM_RDONLY = git_odb_stream_t.GIT_STREAM_RDONLY;
alias GIT_STREAM_WRONLY = git_odb_stream_t.GIT_STREAM_WRONLY;
alias GIT_STREAM_RW = git_odb_stream_t.GIT_STREAM_RW;

struct git_odb_stream
{
    git_odb_backend* backend;
    uint mode;
    void* hash_ctx;

    git_object_size_t declared_size;
    git_object_size_t received_bytes;

    int function (git_odb_stream* stream, char* buffer, size_t len) read;

    int function (git_odb_stream* stream, const(char)* buffer, size_t len) write;

    int function (git_odb_stream* stream, const(git_oid)* oid) finalize_write;

    void function (git_odb_stream* stream) free;
}

struct git_odb_writepack
{
    git_odb_backend* backend;

    int function (git_odb_writepack* writepack, const(void)* data, size_t size, git_indexer_progress* stats) append;
    int function (git_odb_writepack* writepack, git_indexer_progress* stats) commit;
    void function (git_odb_writepack* writepack) free;
}

struct git_patch;

git_repository* git_patch_owner (const(git_patch)* patch);

int git_patch_from_diff (git_patch** out_, git_diff* diff, size_t idx);

int git_patch_from_blobs (
    git_patch** out_,
    const(git_blob)* old_blob,
    const(char)* old_as_path,
    const(git_blob)* new_blob,
    const(char)* new_as_path,
    scope const ref git_diff_options opts);

int git_patch_from_blob_and_buffer (
    git_patch** out_,
    const(git_blob)* old_blob,
    const(char)* old_as_path,
    const(void)* buffer,
    size_t buffer_len,
    const(char)* buffer_as_path,
    scope const ref git_diff_options opts);

int git_patch_from_buffers (
    git_patch** out_,
    const(void)* old_buffer,
    size_t old_len,
    const(char)* old_as_path,
    const(void)* new_buffer,
    size_t new_len,
    const(char)* new_as_path,
    scope const ref git_diff_options opts);

void git_patch_free (git_patch* patch);

const(git_diff_delta)* git_patch_get_delta (const(git_patch)* patch);

size_t git_patch_num_hunks (const(git_patch)* patch);

int git_patch_line_stats (
    size_t* total_context,
    size_t* total_additions,
    size_t* total_deletions,
    const(git_patch)* patch);

int git_patch_get_hunk (
    const(git_diff_hunk*)* out_,
    size_t* lines_in_hunk,
    git_patch* patch,
    size_t hunk_idx);

int git_patch_num_lines_in_hunk (const(git_patch)* patch, size_t hunk_idx);

int git_patch_get_line_in_hunk (
    const(git_diff_line*)* out_,
    git_patch* patch,
    size_t hunk_idx,
    size_t line_of_hunk);

size_t git_patch_size (
    git_patch* patch,
    int include_context,
    int include_hunk_headers,
    int include_file_headers);

int git_patch_print (
    git_patch* patch,
    git_diff_line_cb print_cb,
    void* payload);

int git_patch_to_buf (git_buf* out_, git_patch* patch);

struct git_pathspec;

struct git_pathspec_match_list;

enum git_pathspec_flag_t
{
    GIT_PATHSPEC_DEFAULT = 0,

    GIT_PATHSPEC_IGNORE_CASE = 1u << 0,

    GIT_PATHSPEC_USE_CASE = 1u << 1,

    GIT_PATHSPEC_NO_GLOB = 1u << 2,

    GIT_PATHSPEC_NO_MATCH_ERROR = 1u << 3,

    GIT_PATHSPEC_FIND_FAILURES = 1u << 4,

    GIT_PATHSPEC_FAILURES_ONLY = 1u << 5
}

alias GIT_PATHSPEC_DEFAULT = git_pathspec_flag_t.GIT_PATHSPEC_DEFAULT;
alias GIT_PATHSPEC_IGNORE_CASE = git_pathspec_flag_t.GIT_PATHSPEC_IGNORE_CASE;
alias GIT_PATHSPEC_USE_CASE = git_pathspec_flag_t.GIT_PATHSPEC_USE_CASE;
alias GIT_PATHSPEC_NO_GLOB = git_pathspec_flag_t.GIT_PATHSPEC_NO_GLOB;
alias GIT_PATHSPEC_NO_MATCH_ERROR = git_pathspec_flag_t.GIT_PATHSPEC_NO_MATCH_ERROR;
alias GIT_PATHSPEC_FIND_FAILURES = git_pathspec_flag_t.GIT_PATHSPEC_FIND_FAILURES;
alias GIT_PATHSPEC_FAILURES_ONLY = git_pathspec_flag_t.GIT_PATHSPEC_FAILURES_ONLY;

int git_pathspec_new (git_pathspec** out_, scope const ref git_strarray pathspec);

void git_pathspec_free (git_pathspec* ps);

int git_pathspec_matches_path (
    const(git_pathspec)* ps,
    uint flags,
    const(char)* path);

int git_pathspec_match_workdir (
    git_pathspec_match_list** out_,
    scope git_repository* repo,
    uint flags,
    git_pathspec* ps);

int git_pathspec_match_index (
    git_pathspec_match_list** out_,
    git_index* index,
    uint flags,
    git_pathspec* ps);

int git_pathspec_match_tree (
    git_pathspec_match_list** out_,
    git_tree* tree,
    uint flags,
    git_pathspec* ps);

int git_pathspec_match_diff (
    git_pathspec_match_list** out_,
    git_diff* diff,
    uint flags,
    git_pathspec* ps);

void git_pathspec_match_list_free (git_pathspec_match_list* m);

size_t git_pathspec_match_list_entrycount (const(git_pathspec_match_list)* m);

const(char)* git_pathspec_match_list_entry (
    const(git_pathspec_match_list)* m,
    size_t pos);

const(git_diff_delta)* git_pathspec_match_list_diff_entry (
    const(git_pathspec_match_list)* m,
    size_t pos);

size_t git_pathspec_match_list_failed_entrycount (
    const(git_pathspec_match_list)* m);

const(char)* git_pathspec_match_list_failed_entry (
    const(git_pathspec_match_list)* m,
    size_t pos);

int git_refdb_new (git_refdb** out_, scope git_repository* repo);

int git_refdb_open (git_refdb** out_, scope git_repository* repo);

int git_refdb_compress (git_refdb* refdb);

void git_refdb_free (git_refdb* refdb);

int git_reflog_read (git_reflog** out_, scope git_repository* repo, const(char)* name);

int git_reflog_write (git_reflog* reflog);

int git_reflog_append (git_reflog* reflog, const(git_oid)* id, const(git_signature)* committer, const(char)* msg);

int git_reflog_rename (scope git_repository* repo, const(char)* old_name, const(char)* name);

int git_reflog_delete (scope git_repository* repo, const(char)* name);

size_t git_reflog_entrycount (git_reflog* reflog);

const(git_reflog_entry)* git_reflog_entry_byindex (const(git_reflog)* reflog, size_t idx);

int git_reflog_drop (
    git_reflog* reflog,
    size_t idx,
    int rewrite_previous_entry);

const(git_oid)* git_reflog_entry_id_old (const(git_reflog_entry)* entry);

const(git_oid)* git_reflog_entry_id_new (const(git_reflog_entry)* entry);

const(git_signature)* git_reflog_entry_committer (const(git_reflog_entry)* entry);

const(char)* git_reflog_entry_message (const(git_reflog_entry)* entry);

void git_reflog_free (git_reflog* reflog);

enum git_reset_t
{
    GIT_RESET_SOFT = 1,
    GIT_RESET_MIXED = 2,
    GIT_RESET_HARD = 3
}

alias GIT_RESET_SOFT = git_reset_t.GIT_RESET_SOFT;
alias GIT_RESET_MIXED = git_reset_t.GIT_RESET_MIXED;
alias GIT_RESET_HARD = git_reset_t.GIT_RESET_HARD;

int git_reset (
    scope git_repository* repo,
    scope const(git_object)* target,
    git_reset_t reset_type,
    scope const ref git_checkout_options checkout_opts);

int git_reset_from_annotated (
    scope git_repository* repo,
    const(git_annotated_commit)* commit,
    git_reset_t reset_type,
    scope const ref git_checkout_options checkout_opts);

int git_reset_default (
    scope git_repository* repo,
    scope const(git_object)* target,
    scope const ref git_strarray pathspecs);

enum git_sort_t
{
    GIT_SORT_NONE = 0,

    GIT_SORT_TOPOLOGICAL = 1 << 0,

    GIT_SORT_TIME = 1 << 1,

    GIT_SORT_REVERSE = 1 << 2
}

alias GIT_SORT_NONE = git_sort_t.GIT_SORT_NONE;
alias GIT_SORT_TOPOLOGICAL = git_sort_t.GIT_SORT_TOPOLOGICAL;
alias GIT_SORT_TIME = git_sort_t.GIT_SORT_TIME;
alias GIT_SORT_REVERSE = git_sort_t.GIT_SORT_REVERSE;

int git_revwalk_new (git_revwalk** out_, scope git_repository* repo);

int git_revwalk_reset (git_revwalk* walker);

int git_revwalk_push (git_revwalk* walk, const(git_oid)* id);

int git_revwalk_push_glob (git_revwalk* walk, const(char)* glob);

int git_revwalk_push_head (git_revwalk* walk);

int git_revwalk_hide (git_revwalk* walk, const(git_oid)* commit_id);

int git_revwalk_hide_glob (git_revwalk* walk, const(char)* glob);

int git_revwalk_hide_head (git_revwalk* walk);

int git_revwalk_push_ref (git_revwalk* walk, const(char)* refname);

int git_revwalk_hide_ref (git_revwalk* walk, const(char)* refname);

int git_revwalk_next (git_oid* out_, git_revwalk* walk);

int git_revwalk_sorting (git_revwalk* walk, uint sort_mode);

int git_revwalk_push_range (git_revwalk* walk, const(char)* range);

int git_revwalk_simplify_first_parent (git_revwalk* walk);

void git_revwalk_free (git_revwalk* walk);

git_repository* git_revwalk_repository (git_revwalk* walk);

alias git_revwalk_hide_cb = int function (
    const(git_oid)* commit_id,
    void* payload);

int git_revwalk_add_hide_cb (
    git_revwalk* walk,
    git_revwalk_hide_cb hide_cb,
    void* payload);

int git_signature_new (git_signature** out_, const(char)* name, const(char)* email, git_time_t time, int offset);

int git_signature_now (git_signature** out_, const(char)* name, const(char)* email);

int git_signature_default (git_signature** out_, scope git_repository* repo);

int git_signature_from_buffer (git_signature** out_, const(char)* buf);

int git_signature_dup (git_signature** dest, const(git_signature)* sig);

void git_signature_free (git_signature* sig);

int git_tag_lookup (git_tag** out_, scope git_repository* repo, const(git_oid)* id);

int git_tag_lookup_prefix (
    git_tag** out_,
    scope git_repository* repo,
    const(git_oid)* id,
    size_t len);

void git_tag_free (git_tag* tag);

const(git_oid)* git_tag_id (const(git_tag)* tag);

git_repository* git_tag_owner (const(git_tag)* tag);

int git_tag_target (scope out git_object* target_out, const(git_tag)* tag);

const(git_oid)* git_tag_target_id (const(git_tag)* tag);

git_object_t git_tag_target_type (const(git_tag)* tag);

const(char)* git_tag_name (const(git_tag)* tag);

const(git_signature)* git_tag_tagger (const(git_tag)* tag);

const(char)* git_tag_message (const(git_tag)* tag);

int git_tag_create (
    git_oid* oid,
    scope git_repository* repo,
    const(char)* tag_name,
    scope const(git_object)* target,
    const(git_signature)* tagger,
    const(char)* message,
    int force);

int git_tag_annotation_create (
    git_oid* oid,
    scope git_repository* repo,
    const(char)* tag_name,
    scope const(git_object)* target,
    const(git_signature)* tagger,
    const(char)* message);

int git_tag_create_from_buffer (
    git_oid* oid,
    scope git_repository* repo,
    const(char)* buffer,
    int force);

int git_tag_create_lightweight (
    git_oid* oid,
    scope git_repository* repo,
    const(char)* tag_name,
    scope const(git_object)* target,
    int force);

int git_tag_delete (scope git_repository* repo, const(char)* tag_name);

int git_tag_list (scope ref git_strarray tag_names, scope git_repository* repo);

int git_tag_list_match (
    scope ref git_strarray tag_names,
    const(char)* pattern,
    scope git_repository* repo);

alias git_tag_foreach_cb = int function (const(char)* name, git_oid* oid, void* payload);

int git_tag_foreach (
    scope git_repository* repo,
    git_tag_foreach_cb callback,
    void* payload);

int git_tag_peel (scope out git_object* tag_target_out, const(git_tag)* tag);

int git_tag_dup (git_tag** out_, git_tag* source);

int git_tag_name_is_valid (out int valid, const(char)* name);

int git_transaction_new (git_transaction** out_, scope git_repository* repo);

int git_transaction_lock_ref (git_transaction* tx, const(char)* refname);

int git_transaction_set_target (git_transaction* tx, const(char)* refname, const(git_oid)* target, const(git_signature)* sig, const(char)* msg);

int git_transaction_set_symbolic_target (git_transaction* tx, const(char)* refname, const(char)* target, const(git_signature)* sig, const(char)* msg);

int git_transaction_set_reflog (git_transaction* tx, const(char)* refname, const(git_reflog)* reflog);

int git_transaction_remove (git_transaction* tx, const(char)* refname);

int git_transaction_commit (git_transaction* tx);

void git_transaction_free (git_transaction* tx);

