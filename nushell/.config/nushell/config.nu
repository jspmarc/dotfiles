# config.nu
#
# Installed by:
# version = "0.101.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

def git-log [] {
	git log --pretty=%h»¦«%aN»¦«%s»¦«%aD | lines | split column "»¦«" sha1 committer desc merged_at
}

def git-log-with-limit [limit?: int] {
	if $limit == null {
		git-log
	} else {
		git-log | first $limit
	}
}

def git-checkout-master [] {
	let result = git checkout master | complete
	if $result.exit_code != 0 {
		git checkout main
	} else if $result.stdout != '' {
		print -n $result.stdout
	} else {
		print -n $result.stderr
	}
}

$env.PATH = [
	$"($env.HOME)/.local/bin",
	$"($env.HOME)/.rbenv/shims",
	$"($env.HOME)/.cargo/bin",
	"/opt/homebrew/bin"
] ++ $env.PATH

$env.config.buffer_editor = 'nvim'
$env.config.edit_mode = 'vi'
$env.config.cursor_shape.vi_insert = 'line'
$env.config.cursor_shape.vi_normal = 'block'
$env.config.hooks.pre_prompt = [{ ||
	if (which direnv | is-empty) {
		return
	}

	direnv export json | from json | default {} | load-env
	if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
		$env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
	}
}]

alias l = ls -la
alias ll = ls -l
alias lg = lazygit
alias g = git
alias ga = git add
alias gaa = git add --all
alias gap = git apply
alias gb = git branch
alias gbd = git branch -d
alias gc = git commit -v
alias gc! = git commit -v --amend
alias gca = git commit -v -a
alias gca! = git commit -v -a --amend
alias gcb = git checkout -b
alias gcl = git clone
alias gcm = git-checkout-master
alias gco = git checkout
alias gcp = git cherry-pick
alias gcpa = git cherry-pick --abort
alias gcpc = git cherry-pick --continue
alias gd = git diff
alias gl = git pull
alias glg = git log --stat
alias glgg = git log --graph
alias glo = git-log-with-limit
alias gm = git merge
alias gp = git push
alias grs = git restore
alias gst = git status
alias gupa = git pull --rebase --autostash
alias rb = ruby
alias v = nvim

if not (which fnm | is-empty) {
	load-env (fnm env --shell bash
		| lines
		| str replace 'export ' ''
		| str replace -a '"' ''
		| split column '='
		| rename name value
		| where name != "FNM_ARCH" and name != "PATH"
		| reduce -f {} {|it, acc| $acc | upsert $it.name $it.value }
	)

	$env.PATH = [$"($env.FNM_MULTISHELL_PATH)/bin"] ++ $env.PATH
}

if not (which starship | is-empty) {
	mkdir ($nu.data-dir | path join "vendor/autoload")
	starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
	$env.PROMPT_INDICATOR = ""
	$env.PROMPT_INDICATOR_VI_NORMAL = ""
	$env.PROMPT_INDICATOR_VI_INSERT = ""
}

source $private_conf_path
source $zoxide_conf_path
