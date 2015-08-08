#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="$HOME/.gobrew/bin:$PATH"
eval "$(gobrew init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

eval "$(rbenv init -)"

[[ -s /Users/marksargento/.rsvm/rsvm.sh ]] && . /Users/marksargento/.rsvm/rsvm.sh
