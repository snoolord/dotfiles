bindkey -v
setopt auto_cd
[[ -a ~/.dotfiles/configs/aliasesrc ]] && source ~/.dotfiles/configs/aliasesrc
[[ -a ~/.dotfiles/configs/zshrc-back ]] && source ~/.dotfiles/configs/zshrc-back
[[ -a ~/.dotfiles/configs/functions ]] && source ~/.dotfiles/configs/functions

alias killg='pgrep grunt | xargs kill -9'
eval "$(direnv hook zsh)"

compctl -g '~/.itermocil/*(:t:r)' itermocil

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="$PATH:$HOME/workspace/ngts/ngts_dev_tools/bin"
