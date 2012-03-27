ZSH=$HOME/.oh-my-zsh
#ZSH_CUSTOM=~/.zsh-custom
ZSH_THEME="norm"

plugins=(git)
source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

OS=${OSTYPE//[0-9.]/}
if [ "${OS}" = "darwin" ] ; then
  VIM=/Applications/MacVim.app/Contents/MacOS/Vim
  alias vim=$VIM
  export GIT_EDITOR=$VIM
fi

# EC2
export EC2_PRIVATE_KEY=$HOME/.ec2/pk.pem
export EC2_CERT=$HOME/.ec2/cert.pem

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Aliases
alias ll="ls -lha"

# git
alias st='git status'
alias br='git branch'
alias ci='git commit'
alias co='git checkout'
alias pull='git pull'
alias push='git push'
alias add='git add'
