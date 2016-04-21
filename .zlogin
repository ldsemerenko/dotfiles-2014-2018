# Executes commands at login post-zshrc.

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# Print a random, hopefully interesting, adage.
if (( $+commands[fortune] )); then
  fortune -a
  print
fi

# Start wemux (tmux) on boot
# NOTE: If turning this on, turn off tmux autostart in ~/.zpreztorc
# wemux start > /dev/null

# Fix tmux status line (thanks to vim-airline)
# tmux-fix-status-line

# Clean prompt to start
clear
