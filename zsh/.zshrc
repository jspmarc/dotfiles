HISTFILE=~/.zsh_history
# Max commands saved in a shell session
HISTSIZE=1000
# Max commands saved in history file
SAVEHIST=10000

setopt hist_ignore_space inc_append_history share_history
setopt autocd nomatch notify

bindkey -v

source ~/zsh-files/zsh_funcs
source ~/zsh-files/zsh_env
source ~/zsh-files/zsh_alias
source ~/zsh-files/.zshcomp

# =============================================================================
# Plugins
# =============================================================================
source ~/zsh-files/plugins/main.zsh

# =============================================================================
# Load env for tools
# =============================================================================
if command -v thefuck >/dev/null; then
    eval $(thefuck --alias)
fi

# ---nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# ---nvm end

# --pnpm
pnpm_shell_completion_file="/usr/share/zsh/plugins/pnpm-shell-completion/pnpm-shell-completion.zsh"
if [[ -f "$pnpm_shell_completion_file" ]]; then
    source /usr/share/zsh/plugins/pnpm-shell-completion/pnpm-shell-completion.zsh
fi
# --pnpm end

# --zoxide
if command -v zoxide >/dev/null; then
    eval "$(zoxide init zsh)"
fi
# --zoxide end

# --pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null; then
    eval "$(pyenv init - zsh)"
fi
# --pyenv end

# --starship
if command -v starship >/dev/null; then
    eval "$(starship init zsh)"
fi
# --starship end

# Remove directory background color
eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"

source ~/zsh-files/zsh_motd
