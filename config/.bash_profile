# ~/.bash_profile

# XDG directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"

# neofetch and tmux sessions for welcome
if [[ -z $TMUX ]] && [[ -z $TMUX_SSH_SPLIT ]]; then
  eval "$(source /etc/os-release && typeset -p ID)"
  if [[ $ID == debian ]]; then args='--ascii_colors 7 1 1'; fi
  clear && echo && neofetch "$args"
  sessions=$(tmux list-sessions -F#S 2>/dev/null | xargs echo)
  if [[ $sessions ]]; then
    echo "  Available tmux sessions: ""$sessions"""
  fi
  unset sessions
fi

# source .bashrc
. "$HOME/.bashrc"

# set TMPDIR if not already set
if [ -z "$TMPDIR" ]; then
  if [ -d /tmp ]; then
    export TMPDIR='/tmp'
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# Determine if mosh connection
if [[ $(who am i | grep "$(tty | cut -d"/" -f3-4)") =~ mosh ]]; then export MOSH_CONNECTION=true; fi

# Golang
if [ -d "/usr/local/go/bin" ]; then
  export PATH=$PATH:/usr/local/go/bin
fi

# pnpm
if command -v pnpm >/dev/null 2>&1; then
  export PNPM_HOME="$HOME/.local/share/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('${HOME}/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "${HOME}/miniconda3/etc/profile.d/conda.sh" ]; then
    . "${HOME}/miniconda3/etc/profile.d/conda.sh"
  else
    PATH="${HOME}/miniconda3/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

# End
export PATH

# Nix package manager
if [ -e "$XDG_STATE_HOME"/nix/profile/etc/profile.d/nix.sh ]; then
  source "$XDG_STATE_HOME"/nix/profile/etc/profile.d/nix.sh
  XDG_DATA_DIRS="$XDG_STATE_HOME/nix/profile/share:$XDG_DATA_DIRS"
fi
