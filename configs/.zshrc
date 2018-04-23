bindkey -v
setopt auto_cd
[[ -a ~/.dotfiles/configs/aliasesrc ]] && source ~/.dotfiles/configs/aliasesrc
[[ -a ~/.dotfiles/configs/zshrc-back ]] && source ~/.dotfiles/configs/zshrc-back
[[ -a ~/.dotfiles/configs/functions ]] && source ~/.dotfiles/configs/functions

compctl -g '~/.itermocil/*(:t:r)' itermocil
alias killg='pgrep grunt | xargs kill -9'

