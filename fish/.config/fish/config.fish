#cat ~/.cache/wal/sequences &

## pure theme variables
#set pure_symbol_prompt ❯❯❯
#set pure_symbol_reverse_prompt ❮❮❮
#set pure_threshold_command_duration 2
#set pure_separate_prompt_on_error true
#set pure_reverse_prompt_symbol_in_vimode false

alias vim="nvim"
alias v="nvim"

function fish_greeting
	echo "Welcome, $USER! Here's a MOTD:" | lolcat
	fortune -s | cowsay -f tux | lolcat
	#source /usr/share/nvm/init-nvm.sh

	#eval (thefuck --alias)
end

fish_vi_key_bindings
starship init fish | source

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/josep/.lmstudio/bin
# End of LM Studio CLI section

