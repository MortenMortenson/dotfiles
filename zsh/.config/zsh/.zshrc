# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
#source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

#History
export HISTFILE=~/.config/zsh/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

#Exports
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export TERM="xterm-256color"


#Alias
source ~/.config/zsh/.aliases

PROMPT='%F{blue}%2~%f %F{green}❯%f '


#Git Right Side Prompt:
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
zstyle ':vcs_info:*' enable git

#Keybinding
bindkey "^?" backward-delete-char
bindkey -a '^[[3~' delete-char

#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh
#export FZF_DEFAULT_OPTS="
#--layout=reverse
#--info=inline
#--height=80%
#--multi
#--preview-window=:hidden
#--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
#--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
#--prompt='∼ ' --pointer='▶' --marker='✓'
#--bind '?:toggle-preview'
#--bind 'ctrl-a:select-all'
#--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
#--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
#"
#export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules' . $HOME"
# CTRL-T's command
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# ALT-C's command
#export FZF_ALT_C_COMMAND="fd -t d . $HOME"

autoload -Uz compinit && compinit 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

#Autosuggestion
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#Syntax highlighting - must be at end of file
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh/.config/zsh/.p10k.zsh.
[[ ! -f ~/dotfiles/zsh/.config/zsh/.p10k.zsh ]] || source ~/dotfiles/zsh/.config/zsh/.p10k.zsh
