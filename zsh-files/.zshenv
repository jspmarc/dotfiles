export PATH=$HOME/.npm-pkgs/bin:$HOME/.local/bin:$HOME/.cargo/bin/:$PATH
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
#export BROWSER="firefox"
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin:$HOME/.emacs.d/bin"

# NNN configuratons
export NNN_TRASH=1

export NNN_PLUG='f:fzopen;u:imgur;d:dragdrop;p:preview-tui'
export NNN_BMS="k:~/Documents/Kuliah;b:/home/josep/Documents/Kuliah"
export NNN_FIFO=/tmp/nnn.fifo nnn

export ZSHFILES=$HOME/.config/zsh

export TEXMFDIST=/usr/share/texmf-dist/
export TEXMFLOCAL=/usr/local/share/texmf/:/usr/share/texmf/
export TEXMFSYSVAR=/var/lib/texmf/
export TEXMFSYSCONFIG=/etc/texmf/
export TEXMFHOME=$HOME/texmf/
export TEXMFVAR=$HOME/.texlive/texmf-var/
export TEXMFCONFIG=$HOME/.texlive/texmf-config/
export TEXMFCACHE=$TEXMFSYSVAR:$TEXMFVAR

export DISPLAY="`sed -n 's/nameserver //p' /etc/resolv.conf`:0"
