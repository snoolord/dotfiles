bindkey -v
setopt auto_cd
[[ -a ~/.dotfiles/configs/aliasesrc ]] && source ~/.dotfiles/configs/aliasesrc
[[ -a ~/.dotfiles/configs/oh-my-zsh ]] && source ~/.dotfiles/configs/oh-my-zsh
[[ -a ~/.dotfiles/configs/functions ]] && source ~/.dotfiles/configs/functions

autoload -U promptinit; promptinit
prompt spaceship
fpath=($fpath "/Users/winstonzhao/.zfunctions")
eval "$(/opt/homebrew/bin/brew shellenv)"
bindkey -v
setopt auto_cd

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

export PATH="$HOME/.dotfiles/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

