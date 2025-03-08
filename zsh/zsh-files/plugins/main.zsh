plugins=(
  ~/zsh-files/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
  ~/zsh-files/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
  ~/zsh-files/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
  ~/zsh-files/plugins/zsh-colored-man-pages.plugin.zsh
  ~/zsh-files/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
  ~/zsh-files/plugins/fzf-key-bindings.zsh
  ~/zsh-files/plugins/fzf-completion.zsh
)

for plugin in "${plugins[@]}"; do
  if [[ -f $plugin ]]; then
    source $plugin
  fi
done

FZF_KEY_BINDINGS_PATH=~/zsh-files/plugins/fzf-key-bindings.zsh

# Load fzf key bindings correctly with zsh vi mode
zvm_after_init_commands+=("[ -f $FZF_KEY_BINDINGS_PATH ] && source $FZF_KEY_BINDINGS_PATH")

