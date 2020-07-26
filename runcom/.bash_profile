#!/bin/bash

export BASH_SILENCE_DEPRECATION_WARNING=1


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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taivo/google-cloud-sdk/path.bash.inc' ]; then . '/Users/taivo/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taivo/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/taivo/google-cloud-sdk/completion.bash.inc'; fi
