# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  #source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Lines configured by zsh-newuser-install
#HISTFILE=~/.histfile
HISTFILE=~/zsh-files/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt autocd
bindkey -v

## End of lines configured by zsh-newuser-install
#source ~/sources/powerlevel10k/powerlevel10k.zsh-theme
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/zsh-files/.p10k.zsh ]] || source ~/zsh-files/.p10k.zsh

source ~/zsh-files/zsh_funcs
source ~/zsh-files/.zshcomp
source ~/zsh-files/.zshenv
source ~/zsh-files/zsh_alias

eval $(starship init zsh)

#Automatically starts with wal applied
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#[[ $(uname -a | grep "microsoft") ]] || (cat ~/.cache/wal/sequences &)

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh

# =============================================================================
# custom commands
# =============================================================================
wal-tile() {
    wal -n -i "$@" --backend wal
    feh --bg-scale "$(< "${HOME}/.cache/wal/wal")"
}

# =============================================================================
# Others
# =============================================================================
# Begone percent sign (%) everytime i open terminal!
unsetopt PROMPT_SP

# Begone ls directory background
eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"

setopt HIST_IGNORE_SPACE

# =============================================================================
# Plugins
# =============================================================================
source ~/zsh-files/zsh-autosuggestions.zsh
source ~/zsh-files/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/zsh-files/zsh-interactive-cd.zsh
source ~/zsh-files/zsh-colored-man-pages.zsh
source ~/zsh-files/zsh-vi-mode.zsh
source ~/zsh-files/key-bindings.zsh
source ~/zsh-files/completion.zsh

# Sourcing autojump
#[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
# tabtab source for packages
# uninstall by removing these lines

[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

#[[ $TERM != "screen" ]] && exec tmux

#for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#10}:+$'\n'}; done
#echo "Welcome, $USER! Here's a MOTD:" | lolcat
#cowsay -f tux <<< $(fortune -s) | lolcat
#fet.sh
fortune -s

eval $(thefuck --alias)

prompt_fix_wsl() {
    # return early if WSL is missing or already working
    [[ -n "$WSL_INTEROP" ]] || return
    ! [[ -e "$WSL_INTEROP" ]] || return
    local pid pids
    # parse pstree output in to pids array
    IFS='-()'
    # shellcheck disable=SC2207
    pids=($(pstree --numeric-sort --show-pids --show-parents $$))
    unset IFS
    for pid in "${pids[@]}"; do
        [[ "$pid" =~ [0-9]+ ]] || continue
        [[ -e "/run/WSL/${pid}_interop" ]] || continue
        export "WSL_INTEROP=/run/WSL/${pid}_interop"
        # stop looking for sockets
        return
    done
}

# ---nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# ---nvm end

