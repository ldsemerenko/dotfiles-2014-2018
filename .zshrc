# Executes commands at the start of an interactive session.

################################################################################
# Config, Scripts
################################################################################

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Up the default ulimit
ulimit -n 2048

# Bash style ..[TAB] completion
# http://stackoverflow.com/questions/564648/zsh-tab-completion-for-cd
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

# tmuxinator completions
# TODO: broken, tmux completions was called with "no arguments"
# source ~/.bin/tmuxinator.zsh

################################################################################
# Alias
################################################################################

# ssh tunnel on localhost:27018 to qa.zipscene.com for mongo
alias zs-qa-tunnel="ssh -f rhilgefort@qa.zipscene.com -L 27018:localhost:27017 -i /Users/rjhilgefort/.ssh/id_rsa -N"

# not helpfull helpers
alias starwars="telnet towel.blinkenlights.nl"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias hidden-show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidden-hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Show/Hide all desktop icons (useful when presenting)
alias desktop-show="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias desktop-hide="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
# alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Put up screensaver (when going AFK)
alias afk="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine &> /dev/null"

# see what apps are currently using the network
alias appsoninternet='sudo lsof -P -i -n | cut -f 1 -d " " | uniq'

# list what ports are currently open
alias listopenports='sudo lsof -i -P | grep -i "listen"'

# mount the drobster
alias mountdrobo="mount -t smbfs //rjhilgefort@10.0.1.2/Home ~/Drobo"

# list all git submodules in the current directory
alias git-submodule-list="grep path .gitmodules | sed 's/.*= //'"

# Mac dock mods - change the behavior of the dock
alias dock-reset="defaults delete com.apple.dock autohide-delay && killall Dock" # Back to normal
alias dock-meh="defaults write com.apple.dock autohide-delay -float 2 && killall Dock" # 2 seconds
alias dock-fuckoff="defaults write com.apple.dock autohide-delay -float 1000 && killall Dock" # 1000 seconds

# control volume
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

# clvv/fasd
alias j='fasd_cd -d'
alias jj='fasd_cd -d -i'
alias jvim='fasd -f -e vim'
alias jopen='fasd -f -e open'
alias jcat='fasd -f -e cat'
alias jless='fasd -f -e less'
