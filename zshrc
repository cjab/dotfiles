ZSH=$HOME/.oh-my-zsh
ZSH_THEME="norm"

plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export PATH=/sbin:/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:~/.cargo/bin
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

# git
export EDITOR=`which vim`
export GIT_EDITOR=$EDITOR

# rbenv
if which rbenv > /dev/null; then
  export RUBY_CONFIGURE_OPTS="--with-readline-dir=/usr/local/opt/readline"
  export PATH="$HOME/.rbenv/bin:$PATH";
  eval "$(rbenv init - zsh)";
fi

# rake
alias rake='noglob rake'

# npm
export PATH="/usr/local/share/npm/bin:$PATH";

# Aliases
alias ll="ls -lha"

# git
eval "$(hub alias -s)"
alias st='git status --short --branch'
alias br='git branch'
alias ci='git commit'
alias co='git checkout'
alias rb='git rebase'
alias rbom='git rebase origin/master'
alias pull='git pull'
alias push='git push'
alias add='git add'

# android
export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
export ANDROID_HOME=/usr/local/Cellar/android-sdk

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export RI="-f ansi"

# Z
. `brew --prefix`/etc/profile.d/z.sh

# Wemux
alias wemux='TERM=xterm-256color wemux'

# OPAM configuration
. /Users/cjab/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Cargo
export PATH="$HOME/.cargo/bin:$PATH";

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# iex
alias iex="rlwrap -a -A iex"
alias erl="rlwrap -a -A erl"
export PATH="$HOME/.asdf/installs/elixir/1.5.0/.mix/escripts:$PATH";
