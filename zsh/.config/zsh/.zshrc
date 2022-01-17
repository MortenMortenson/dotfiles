# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#History
export HISTFILE=~/.config/zsh/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

#Exports
export EDITOR=vim
export VISUAL=vim
export TERM=alacritty



#Alias
source ~/.config/zsh/.aliases
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

#Keybinding
bindkey "^?" backward-delete-char
bindkey -a '^[[3~' delete-char

#Theme.sh
if command -v theme.sh > /dev/null; then
	[ -e ~/.theme_history ] && theme.sh "$(theme.sh -l|tail -n1)"

	# Optional

	# Bind C-o to the last theme.
	last_theme() {
		theme.sh "$(theme.sh -l|tail -n2|head -n1)"
	}

	zle -N last_theme
	bindkey '^O' last_theme

	alias th='theme.sh -i'

	# Interactively load a light theme
	alias thl='theme.sh --light -i'

	# Interactively load a dark theme
	alias thd='theme.sh --dark -i'
fi

#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh

autoload -Uz compinit && compinit 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

#Autosuggestion
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#Syntax highlighting - must be at end of file
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh