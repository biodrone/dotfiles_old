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

#---Prompt NewLine---#
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "\n%{%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{%f%}"
  CURRENT_BG=''
}

#---Aliases---#
#---Basics
alias l="ls -lah"
alias cl="clear"
#---Docker
alias dbuild="docker build"
alias dcbuild="docker-compose build"
alias dcdown="docker-compose down"
alias dcup="docker-compose up -d"
alias dclogs="docker-compose logs -f"
alias dcrebuild="docker-compose down && docker-compose up -d"

#---Docker Variables---#
export DOCKER_CONFIG=~/.config/docker
