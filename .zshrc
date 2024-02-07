[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source aliases
source ~/.path
source ~/.aliases
source ~/.exports

# Local only config
source ~/.private

# Source prompt
source ~/.zsh_prompt_pure

# Source plugins
source ~/.config/zsh/zsh-z/zsh-z.plugin.zsh

# Case insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# List directory contents after cd
function cd {
  builtin cd "$@" && ls -a -F
}

# Load Angular CLI autocompletion.
# source <(ng completion script)
