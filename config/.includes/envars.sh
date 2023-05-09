# Environment Variables

# XDG locations need to be set for termux
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_STATE_HOME="$HOME"/.local/state
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME"/ansible/ansible.cfg
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_WEB_IDENTITY_TOKEN_FILE="$XDG_DATA_HOME"/aws/token
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME"/ripgrep/ripgreprc
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export TIMEFMT=$'real\t%E\nuser\t%U\nsys\t%S'
export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME"/tmux/plugins
export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME"/vagrant/aliases
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
export WGETRC="$XDG_CONFIG_HOME"/wget/wgetrc
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export LESSCHARSET='utf-8'
export LANGUAGE="en_GB"
export LANG="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8" 2>/dev/null
export LS_OPTIONS='-hv --color=always'
export CLICOLOR=1
export CLICOLOR_FORCE=1
export MOSH_TITLE_NOPREFIX=
export PAGER='less -r'
export LESS='-MRQx4FX#10'
export MANPAGER='less -+MFX +g'
export BAT_PAGER='less -+MFX -S'
export EXA_COLORS='xa=38;5;135:lc=38;5;124:lm=38;5;196:uu=38;5;178:gu=38;5;178:un=38;5;141:gn=38;5;141:bO=38;5;009'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export RANGER_LOAD_DEFAULT_RC=FALSE
export GVIMINIT='let $MYGVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/gvimrc" : "$XDG_CONFIG_HOME/nvim/init.gvim" | so $MYGVIMRC'
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.vim" | so $MYVIMRC'

# Set COLORTERM if Windows Terminal
[[ $WT_SESSION ]] && export COLORTERM='truecolor'

# Browser
if [[ $DISPLAY ]]; then
  export BROWSER=qutebrowser
else
  export BROWSER=elinks
fi

# Text Editor
if command -v nvim >/dev/null; then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi