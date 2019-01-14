#!/bin/bash

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/taivo/.gvm/bin/gvm-init.sh" ]] && source "/Users/taivo/.gvm/bin/gvm-init.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# require bashrc
[[ -s ~/.bashrc ]] && source ~/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Taivo's Dotfiles
for DOTFILE in `find ~/.dotfiles/system`
do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done

export PATH="/usr/local/bin:$PATH"

