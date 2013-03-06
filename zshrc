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

if [ "${OS}" = "linux-gnu" ] ; then
  export PATH="/opt/vagrant/bin:$PATH"
  source $HOME/.profile
fi

# EC2
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=`ls ~/.ec2/pk-*.pem`
export EC2_CERT=`ls ~/.ec2/cert-*.pem`
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export AWS_ACCESS_KEY_ID=`cat $EC2_HOME/access_key_id`
export AWS_SECRET_ACCESS_KEY=`cat $EC2_HOME/secret_access_key`
export EC2_REGION=us-east-1
export EC2_AVAILABILITY_ZONE=us-east-1b

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# npm
export PATH="/usr/local/share/npm/bin:$PATH"

# Aliases
alias ll="ls -lha"

# git
eval "$(hub alias -s)"
alias st='git status'
alias br='git branch'
alias ci='git commit'
alias co='git checkout'
alias pull='git pull'
alias push='git push'
alias add='git add'

# julia
export PATH="/opt/julia:$PATH"

# android
export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
export ANDROID_HOME=/usr/local/Cellar/android-sdk/r21.1
