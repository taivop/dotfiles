#!/bin/bash

export BASH_SILENCE_DEPRECATION_WARNING=1

# require bashrc
[[ -s ~/.bashrc ]] && source ~/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# git branch for iterm2 (Taivo)
function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

# Configure McFly for better ctrl-r search
if [[ -r "/usr/local/opt/mcfly/mcfly.bash" ]]; then
      source "/usr/local/opt/mcfly/mcfly.bash"
fi

# Preserve bash history. See https://askubuntu.com/questions/339546/how-do-i-see-the-history-of-the-commands-i-have-run-in-tmux
# avoid duplicates..
#export HISTCONTROL=ignoredups:erasedups
# append history entries..
#shopt -s histappend
# After each command, save and reload history
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Taivo's Dotfiles
for DOTFILE in `find ~/.dotfiles/system`
do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taivo/google-cloud-sdk/path.bash.inc' ]; then . '/Users/taivo/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taivo/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/taivo/google-cloud-sdk/completion.bash.inc'; fi

# The next line enables shell command completion for kubernetes
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
#source <(kubectl completion bash)
# Use alias k for kubectl, while still allowing autocompletion
#complete -F __start_kubectl k


export PATH="/usr/local/bin:$PATH"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/taivo/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/taivo/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/taivo/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/taivo/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
