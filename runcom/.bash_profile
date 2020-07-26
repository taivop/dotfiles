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

export PATH="/usr/local/bin:$PATH"

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/taivo/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/taivo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/taivo/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/taivo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
