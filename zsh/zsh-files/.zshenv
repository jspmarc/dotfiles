export PNPM_HOME="/home/josep/.local/share/pnpm"

export PATH="$HOME/.npm-pkgs/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$PNPM_HOME:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="bat"
export AUR_HELPER='paru'

# NNN configuratons
export NNN_TRASH=1

export NNN_PLUG='f:fzopen;u:imgur;d:dragdrop;p:preview-tui'
export NNN_BMS="k:~/Documents/Kuliah;b:/home/josep/Documents/Kuliah"
export NNN_FIFO=/tmp/nnn.fifo nnn

export ZSHFILES=$HOME/zsh-files

[[ $(uname -r | grep "microsoft") ]] \
    && export DISPLAY="`sed -n 's/nameserver //p' /etc/resolv.conf`:0" \

[[ $(uname -r | grep "microsoft") ]] \
    && export BXSHARE=/mnt/c/Users/jspma/scoop/apps/bochs/current/

export PYENV_ROOT=$(pyenv root)

export GOPATH=$(go env GOPATH)
