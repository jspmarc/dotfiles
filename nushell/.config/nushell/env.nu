# env.nu
#
# Installed by:
# version = "0.101.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

$env.EDITOR = 'nvim'

const PRIVATE_CONF_PATH = $"($nu.default-config-dir)/private.nu"
if not ($PRIVATE_CONF_PATH | path exists) {
	touch $PRIVATE_CONF_PATH
}

const ZOXIDE_CONFIG_PATH = $"($nu.default-config-dir)/zoxide.nu"
if not ($ZOXIDE_CONFIG_PATH | path exists) {
	if (zoxide --version | complete | get exit_code) == 0 {
		zoxide init nushell | save -f $ZOXIDE_CONFIG_PATH
	} else {
		touch $ZOXIDE_CONFIG_PATH
	}
}
