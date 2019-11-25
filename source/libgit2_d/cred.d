/*
 * Copyright (C) the libgit2 contributors. All rights reserved.
 *
 * This file is part of libgit2, distributed under the GNU GPL v2 with
 * a Linking Exception. For full terms see the included COPYING file.
 */
module libgit2_d.cred;


private static import libgit2_d.sys.cred;

/**
 * @file git2/cred.h
 * @brief Git authentication & credential management
 * @defgroup git_cred Authentication & credential management
 * @ingroup Git
 * @{
 */
extern (C):
nothrow @nogc:
public:

/**
 * Supported credential types
 *
 * This represents the various types of authentication methods supported by
 * the library.
 */
enum git_credtype_t
{
	/**
	 * A vanilla user/password request
	 * @see git_cred_userpass_plaintext_new
	 */
	GIT_CREDTYPE_USERPASS_PLAINTEXT = 1u << 0,

	/**
	 * An SSH key-based authentication request
	 * @see git_cred_ssh_key_new
	 */
	GIT_CREDTYPE_SSH_KEY = 1u << 1,

	/**
	 * An SSH key-based authentication request, with a custom signature
	 * @see git_cred_ssh_custom_new
	 */
	GIT_CREDTYPE_SSH_CUSTOM = 1u << 2,

	/**
	 * An NTLM/Negotiate-based authentication request.
	 * @see git_cred_default
	 */
	GIT_CREDTYPE_DEFAULT = 1u << 3,

	/**
	 * An SSH interactive authentication request
	 * @see git_cred_ssh_interactive_new
	 */
	GIT_CREDTYPE_SSH_INTERACTIVE = 1u << 4,

	/**
	 * Username-only authentication request
	 *
	 * Used as a pre-authentication step if the underlying transport
	 * (eg. SSH, with no username in its URL) does not know which username
	 * to use.
	 *
	 * @see git_cred_username_new
	 */
	GIT_CREDTYPE_USERNAME = 1u << 5,

	/**
	 * An SSH key-based authentication request
	 *
	 * Allows credentials to be read from memory instead of files.
	 * Note that because of differences in crypto backend support, it might
	 * not be functional.
	 *
	 * @see git_cred_ssh_key_memory_new
	 */
	GIT_CREDTYPE_SSH_MEMORY = 1u << 6,
}

/**
 * The base structure for all credential types
 */
alias git_cred = libgit2_d.sys.cred.git_cred;

alias git_cred_userpass_plaintext = libgit2_d.sys.cred.git_cred_userpass_plaintext;

//ToDo:
version (none) {
	/**
	 * Username-only credential information
	 */
	alias git_cred_username = libgit2_d.sys.cred.git_cred_username;
}

/**
 * A key for NTLM/Kerberos "default" credentials
 */
alias git_cred_default = .git_cred;

/**
 * A ssh key from disk
 */
alias git_cred_ssh_key = libgit2_d.sys.cred.git_cred_ssh_key;

/**
 * Keyboard-interactive based ssh authentication
 */
alias git_cred_ssh_interactive = libgit2_d.sys.cred.git_cred_ssh_interactive;

/**
 * A key with a custom signature function
 */
alias git_cred_ssh_custom = libgit2_d.sys.cred.git_cred_ssh_custom;

/**
 * Credential acquisition callback.
 *
 * This callback is usually involved any time another system might need
 * authentication. As such, you are expected to provide a valid git_cred
 * object back, depending on allowed_types (a git_credtype_t bitmask).
 *
 * Note that most authentication details are your responsibility - this
 * callback will be called until the authentication succeeds, or you report
 * an error. As such, it's easy to get in a loop if you fail to stop providing
 * the same incorrect credentials.
 *
 * @param cred The newly created credential object.
 * @param url The resource for which we are demanding a credential.
 * @param username_from_url The username that was embedded in a "user\@host"
 *                          remote url, or NULL if not included.
 * @param allowed_types A bitmask stating which cred types are OK to return.
 * @param payload The payload provided when specifying this callback.
 * @return 0 for success, < 0 to indicate an error, > 0 to indicate
 *       no credential was acquired
 */
alias git_cred_acquire_cb = int function(.git_cred** cred, const (char)* url, const (char)* username_from_url, uint allowed_types, void* payload);

/**
 * Free a credential.
 *
 * This is only necessary if you own the object; that is, if you are a
 * transport.
 *
 * @param cred the object to free
 */
//GIT_EXTERN
void git_cred_free(.git_cred* cred);

/**
 * Check whether a credential object contains username information.
 *
 * @param cred object to check
 * @return 1 if the credential object has non-NULL username, 0 otherwise
 */
//GIT_EXTERN
int git_cred_has_username(.git_cred* cred);

/**
 * Return the username associated with a credential object.
 *
 * @param cred object to check
 * @return the credential username, or NULL if not applicable
 */
//GIT_EXTERN
const (char)* git_cred_get_username(.git_cred* cred);

/**
 * Create a new plain-text username and password credential object.
 * The supplied credential parameter will be internally duplicated.
 *
 * @param out_ The newly created credential object.
 * @param username The username of the credential.
 * @param password The password of the credential.
 * @return 0 for success or an error code for failure
 */
//GIT_EXTERN
int git_cred_userpass_plaintext_new(.git_cred** out_, const (char)* username, const (char)* password);

/**
 * Create a "default" credential usable for Negotiate mechanisms like NTLM
 * or Kerberos authentication.
 *
 * @return 0 for success or an error code for failure
 */
//GIT_EXTERN
int git_cred_default_new(.git_cred** out_);

/**
 * Create a credential to specify a username.
 *
 * This is used with ssh authentication to query for the username if
 * none is specified in the url.
 */
//GIT_EXTERN
int git_cred_username_new(.git_cred** cred, const (char)* username);

/**
 * Create a new passphrase-protected ssh key credential object.
 * The supplied credential parameter will be internally duplicated.
 *
 * @param out_ The newly created credential object.
 * @param username username to use to authenticate
 * @param publickey The path to the public key of the credential.
 * @param privatekey The path to the private key of the credential.
 * @param passphrase The passphrase of the credential.
 * @return 0 for success or an error code for failure
 */
//GIT_EXTERN
int git_cred_ssh_key_new(.git_cred** out_, const (char)* username, const (char)* publickey, const (char)* privatekey, const (char)* passphrase);

/**
 * Create a new ssh key credential object reading the keys from memory.
 *
 * @param out_ The newly created credential object.
 * @param username username to use to authenticate.
 * @param publickey The public key of the credential.
 * @param privatekey The private key of the credential.
 * @param passphrase The passphrase of the credential.
 * @return 0 for success or an error code for failure
 */
//GIT_EXTERN
int git_cred_ssh_key_memory_new(.git_cred** out_, const (char)* username, const (char)* publickey, const (char)* privatekey, const (char)* passphrase);

/*
 * If the user hasn't included libssh2.h before git2.h, we need to
 * define a few types for the callback signatures.
 */
version (LIBSSH2_VERSION) {
} else {
	struct _LIBSSH2_SESSION;
	struct _LIBSSH2_USERAUTH_KBDINT_PROMPT;
	struct _LIBSSH2_USERAUTH_KBDINT_RESPONSE;
	alias LIBSSH2_SESSION = _LIBSSH2_SESSION;
	alias LIBSSH2_USERAUTH_KBDINT_PROMPT = _LIBSSH2_USERAUTH_KBDINT_PROMPT;
	alias LIBSSH2_USERAUTH_KBDINT_RESPONSE = _LIBSSH2_USERAUTH_KBDINT_RESPONSE;
}

alias git_cred_ssh_interactive_cb = void function(const (char)* name, int name_len, const (char)* instruction, int instruction_len, int num_prompts, const (.LIBSSH2_USERAUTH_KBDINT_PROMPT)* prompts, .LIBSSH2_USERAUTH_KBDINT_RESPONSE* responses, void** abstract_);

/**
 * Create a new ssh keyboard-interactive based credential object.
 * The supplied credential parameter will be internally duplicated.
 *
 * @param username Username to use to authenticate.
 * @param prompt_callback The callback method used for prompts.
 * @param payload Additional data to pass to the callback.
 * @return 0 for success or an error code for failure.
 */
//GIT_EXTERN
int git_cred_ssh_interactive_new(.git_cred** out_, const (char)* username, git_cred_ssh_interactive_cb prompt_callback, void* payload);

/**
 * Create a new ssh key credential object used for querying an ssh-agent.
 * The supplied credential parameter will be internally duplicated.
 *
 * @param out_ The newly created credential object.
 * @param username username to use to authenticate
 * @return 0 for success or an error code for failure
 */
//GIT_EXTERN
int git_cred_ssh_key_from_agent(.git_cred** out_, const (char)* username);

alias git_cred_sign_cb = int function(.LIBSSH2_SESSION* session, ubyte** sig, size_t* sig_len, const (ubyte)* data, size_t data_len, void** abstract_);

/**
 * Create an ssh key credential with a custom signing function.
 *
 * This lets you use your own function to sign the challenge.
 *
 * This function and its credential type is provided for completeness
 * and wraps `libssh2_userauth_publickey()`, which is undocumented.
 *
 * The supplied credential parameter will be internally duplicated.
 *
 * @param out_ The newly created credential object.
 * @param username username to use to authenticate
 * @param publickey The bytes of the public key.
 * @param publickey_len The length of the public key in bytes.
 * @param sign_callback The callback method to sign the data during the challenge.
 * @param payload Additional data to pass to the callback.
 * @return 0 for success or an error code for failure
 */
//GIT_EXTERN
int git_cred_ssh_custom_new(.git_cred** out_, const (char)* username, const (char)* publickey, size_t publickey_len, .git_cred_sign_cb sign_callback, void* payload);

/** @} */
