# Oh-My-ZSH Path and Options
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=1
ZSH_THEME="agnoster"

#---ZSH Plugins---#
plugins=(
  archlinux
  git
  docker
  npm
  emoji
  go
  rsync
  tmux
  vagrant
  zsh-syntax-highlighting
)

#---Launch SSH Agent---#
eval `ssh-agent -s` >> /dev/null

#---Source OMZ---#
source $ZSH/oh-my-zsh.sh

#---Aliases---#
alias l="ls -lah"
alias dcdown="docker-compose down"
alias dcup="docker-compose up -d"
alias dclogs="docker-compose logs -f"
alias dcrebuild="docker-compose down && docker-compose up -d"

#---Docker Variables---#
export DOCKER_CONFIG=~/.config/docker
