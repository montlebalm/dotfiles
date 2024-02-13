[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source aliases
source ~/.path
source ~/.aliases
source ~/.exports

# Local only config
source ~/.private

# Source prompt
source ~/.zsh_prompt_pure

# List directory contents after cd
function cd {
  builtin cd "$@" && ls -a -F
}

#
# z
#

source ~/.config/zsh/zsh-z/zsh-z.plugin.zsh

# Case insensitive completion
autoload -Uz compinit && compinit

autoload -U promptinit; promptinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
