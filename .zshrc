#---Oh-My-ZSH Path and Options---#
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=1
ZSH_THEME="agnoster"

#---ZSH Plugins---#
plugins=(
  archlinux
  ansible
  aws
  brew
  git
  helm
  kubectl
  docker
  npm
  emoji
  golang
  rsync
  terraform
  tmux
  vagrant
  zsh-syntax-highlighting
)

#---Launch SSH Agent---#
# Uncomment if local machine has SSH weirdness
#eval `ssh-agent -s` >> /dev/null

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

#---Editor---#
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#---Random Preferences---#
HIST_STAMPS="yyyy.mm.dd"
HISTSIZE=10000000
SAVEHIST=10000000
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.

#---Aliases---#

#---Basics---#
alias l="ls -lah"

#---Docker---#
alias dbuild="docker build"
alias dcbuild="docker-compose build"
alias dcdown="docker-compose down"
alias dcup="docker-compose up -d"
alias dclogs="docker-compose logs -f"
alias dcrebuild="docker-compose down && docker-compose up -d"
alias dcpull="docker-compose pull"

#---Docker Variables---#
export DOCKER_CONFIG=~/.config/docker

#---Output Pretty Logo to Terminal---#
# Uncomment this on server installs
#rel=$(lsb_release -i -s); linuxlogo -L ${rel:l} -a -y -u -k -s | lolcat --freq 0.3 --spread 3.1
