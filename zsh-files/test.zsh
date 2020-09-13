autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

zmodload zsh/terminfo
bindkey $terminfo[kcuu1] up-line-or-beginning-search
bindkey $terminfo[kcud1] down-line-or-beginning-search

if (( $+terminfo[smkx] && $+terminfo[rmkx] )); then
  function enable-term-application-mode() { echoti smkx }
  function disable-term-application-mode() { echoti rmkx }
  zle -N enable-term-application-mode
  zle -N disable-term-application-mode
  autoload -Uz add-zle-hook-widget
  add-zle-hook-widget line-init enable-term-application-mode
  add-zle-hook-widget line-finish disable-term-application-mode
fi
