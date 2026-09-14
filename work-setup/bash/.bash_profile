#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

. "$HOME/.local/bin/env"

# Hermes Agent — ensure ~/.local/bin is on PATH
export PATH="$HOME/.local/bin:$PATH"


# Added by Toolbox App
export PATH="$PATH:/home/roan/.local/share/JetBrains/Toolbox/scripts"

