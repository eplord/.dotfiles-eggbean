# ~/.zshrc sources this file at the end if binaries have been stowed
# (therefore no further conditional statements required)
# vim: filetype=zsh

# MinIO Client command completion
complete -o nospace -C mclient mclient

# broot function
[ -f ~/.config/broot/launcher/bash/br ] && source ~/.config/broot/launcher/bash/br

# Hashicorp bash tab completion
complete -o nospace -C terraform terraform
complete -o nospace -C packer packer
complete -o nospace -C vault vault

### And now for some mad directory changing stuff... ###

# CD Deluxe
cdd() { while read -r x; do eval "$x" >/dev/null; done < <(dirs -l -p | _cdd "$@"); }
alias cd='cdd'

# Directory bookmarks
if [ -d "$HOME/.bookmarks" ]; then
  goto() {
    local CDPATH="$HOME/.bookmarks"
    pushd -qP "$@"
  }
  bookmark() {
    pushd -q "$HOME/.bookmarks"
    ln -s "$OLDPWD" "$@"
    popd -q
  }
fi

# Combine bookmarks and cdd functions to replace cd
# (this is to avoid having to remember to type goto before I even
# realise I want to, but unfortunately tab completion is lost)
# supercd() {
#   if [[ "${1::1}" == "@" ]]; then
#     goto "$@"
#   else
#     cdd "$@"
#   fi
# }

# if [[ $(whence -w cdd) =~ function ]] && [[ $(whence -w goto) =~ function ]]; then
#   alias cd='supercd'
# fi

# Don't initialise these tools a second time, as it causes
# starship to show a background job when changing directories
if [[ ! $init_zshrc_sourced == true ]]; then

  # Direnv hook
  eval "$(direnv hook zsh)"

  # Add zoxide to shell
  eval "$(zoxide init zsh)"

  # Starship prompt
  command cp ~/.config/starship.toml ~/.config/starship-zsh.toml >/dev/null
  export STARSHIP_CONFIG="$HOME/.config/starship-zsh.toml"
  starship config character.success_symbol "[%](white)"
  starship config character.error_symbol "[%](bold red)"
  eval "$(starship init zsh)"

  # Set marker to say that these have already been initialised
  init_zshrc_sourced=true

fi