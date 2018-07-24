export GITFOLDER=~/git
export ZSH=~/.oh-my-zsh
export EDITOR='vim'

ZSH_THEME="agnoster-custom"

DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(
  git
  ubuntu
  thefuck
  vi-mode
  alias-tips
  compleat
  copydir
  copyfile
  history
  fasd
  jump
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias zshrc='nvim ~/.zshrc'
alias cgit='cd $GITFOLDER'
alias reboot='sudo shutdown -r now'
alias shutdown='sudo shutdown -h now'
alias suspend='sudo systemctl suspend'
alias ect="emacsclient -t -a ''"
alias enw="emacs -nw"

if which tmux >/dev/null 2>&1; then
    test -z ${TMUX} && tmux

    while test -z ${TMUX}; do
        tmux attach || break
    done
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

bindkey '^f' autosuggest-accept
