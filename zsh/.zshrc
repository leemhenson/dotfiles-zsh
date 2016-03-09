HISTFILE=~/.dotfiles/zsh/.histfile
HISTSIZE=1000
KEYTIMEOUT=1
SAVEHIST=1000
unsetopt beep

export CLICOLOR=true
export EDITOR=vim
export LSCOLORS="exfxcxdxbxegedabagacad"

source ~/.zplug/zplug

zplug "djui/alias-tips", nice:11
zplug "plugins/git", from:oh-my-zsh
zplug "willghatch/zsh-saneopt"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions", nice:11

zplug "$DOTFILES/zsh/plugins/chruby", from:local, of:chruby.zsh
zplug "$DOTFILES/zsh/plugins/dirpersist", from:local, of:dirpersist.zsh
zplug "$DOTFILES/zsh/plugins/editcommand", from:local, of:editcommand.zsh, nice:13
zplug "$DOTFILES/zsh/plugins/fzf", from:local, of:fzf.zsh, nice:14
zplug "$DOTFILES/zsh/plugins/vi-mode", from:local, of:"vi-mode.zsh", nice:12
zplug "$DOTFILES/zsh/themes", from:local, of:"garyblessington.zsh-theme"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

# aliases
alias ls='ls -alh'
alias bi='bundle install'
alias bu='bundle update'
alias gt='git tree'
alias hc='heroku config "$@"'
alias hcp='hc -r production "$@"'
alias hcs='hc -r staging "$@"'
alias hlt='heroku logs --tail "$@"'
alias hltp='hlt -r production "$@"'
alias hlts='hlt -r staging "$@"'
alias hrb='heroku run bash "$@"'
alias hrbp='hrb -r production "$@"'
alias hrbs='hrb -r staging "$@"'
alias hrc='heroku run rails console "$@"'
alias hrcp='hrc -r production "$@"'
alias hrcs='hrc -r staging "$@"'

# source private scripts
if [[ -d $PRIVATE_DOTFILES ]]; then
  for file in $PRIVATE_DOTFILES/zsh/*.zsh; do
    source "$file"
  done
fi

