export PNPM_HOME="/home/josep/.local/share/pnpm"

export PATH="$HOME/.npm-pkgs/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$PNPM_HOME:$PATH"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"

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

if [[ -s 'pyenv' ]]; then
	export PYENV_ROOT=$(pyenv root)
	export PATH="$PYENV_ROOT/shims:$PATH"
fi

[ -s 'go' ] && export GOPATH=$(go env GOPATH)

export MANPATH="/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH"

# latexmk
PATH="/usr/share/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/usr/share/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/usr/share/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/usr/share/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/usr/share/perl5"; export PERL_MM_OPT;

# bun completions
[ -s "/home/josep/.bun/_bun" ] && source "/home/josep/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
