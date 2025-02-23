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

const private_conf_path = $"($nu.default-config-dir)/private.nu"
if not ($private_conf_path | path exists) {
	touch $private_conf_path
}

const zoxide_conf_path = $"($nu.default-config-dir)/zoxide.nu"
if not ($zoxide_conf_path | path exists) {
	if (zoxide --version | complete | get exit_code) == 0 {
		zoxide init nushell | save -f $zoxide_conf_path
	} else {
		touch $zoxide_conf_path
	}
}
