export PATH="$HOME/.npm-pkgs/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
#export BROWSER="firefox"

# NNN configuratons
export NNN_TRASH=1

export NNN_PLUG='f:fzopen;u:imgur;d:dragdrop;p:preview-tui'
export NNN_BMS="k:~/Documents/Kuliah;b:/home/josep/Documents/Kuliah"
export NNN_FIFO=/tmp/nnn.fifo nnn

export ZSHFILES=$HOME/zsh-files

export TEXMFDIST=/usr/share/texmf-dist
export TEXMFLOCAL=/usr/local/share/texmf/:/usr/share/texmf
export TEXMFSYSVAR=/var/lib/texmf
export TEXMFSYSCONFIG=/etc/texmf
export TEXMFHOME=$HOME/texmf
export TEXMFVAR=$HOME/.texlive/texmf-var
export TEXMFCONFIG=$HOME/.texlive/texmf-config
export TEXMFCACHE=$TEXMFSYSVAR:$TEXMFVAR

[[ $(uname -r | grep "microsoft") ]] \
    && export DISPLAY="`sed -n 's/nameserver //p' /etc/resolv.conf`:0" \
    || export DISPLAY=":0.0"

[[ $(uname -r | grep "microsoft") ]] \
    && export BXSHARE=/mnt/c/Users/jspma/scoop/apps/bochs/current/
