bindkey -v
setopt auto_cd
[[ -a ~/.dotfiles/configs/aliasesrc ]] && source ~/.dotfiles/configs/aliasesrc
[[ -a ~/.dotfiles/configs/oh-my-zsh ]] && source ~/.dotfiles/configs/oh-my-zsh
[[ -a ~/.dotfiles/configs/functions ]] && source ~/.dotfiles/configs/functions
[[ -a ~/.dotfiles/configs/doordashrc ]] && source ~/.dotfiles/configs/doordashrc
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
alias killg='pgrep grunt | xargs kill -9'

compctl -g '~/.itermocil/*(:t:r)' itermocil

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="$PATH:$HOME/workspace/ngts/ngts_dev_tools/bin"
