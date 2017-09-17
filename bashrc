# Everything in this file loads in .bash_profile as well

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/usr/local/opt/ruby/bin:$PATH"
export LESS='-arM' # -r protects against -R, which makes git diff output look ESC[goofy

export HISTSIZE=10000                    # 500 is default
export HISTFILESIZE=100000               # 500 is default
export HISTTIMEFORMAT='%b %d %I:%M %p '  # using strftime format
export HISTCONTROL=ignoreboth            # ignoredups:ignorespace
export HISTIGNORE="history:h:pwd:exit:ls:ls *:ll:lt:la:lat"

# GREP_COLOR codes
# Attributes:   Text color:    Background:
#   0 reset all   30 black       40 black
#   1 bright      31 red         41 red
#   2 dim         32 green       42 green
#   4 underscore  33 yellow      43 yellow
#   5 blink       34 blue        44 blue
#   7 reverse     35 purple      45 purple
#   8 hidden      36 cyan        46 cyan
#                 37 white       47 white
# Separate with ";"
#
# export GREP_COLOR="34;47"

# Specify options grep should use by default
# export GREP_OPTIONS="--color=auto"

# Bash history
alias h="history"

# Shortcuts for navigation
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias -- -="cd -"
alias db="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias pj="cd ~/Projects ; la"

# BBEdit
alias bb="bbedit ."
alias bd="bbdiff"
alias bf="bbfind"
alias br="bbresults"

# List dir contents aliases (cf http://ss64.com/osx/ls.html)
alias l="ls -oG"        # Long form no user group, color
alias lt="ls -toG"      # Order by last modified, long form no user group, color
alias la="ls -AGFoh"    # List all except . and .., color, mark file types, long form no user group, human file size
alias lat="ls -AGFoht"  # List all except . and .., color, mark file types, long form no user group, human file size, order by last modified

# Allow sudo with aliases
alias sudo="sudo "

# Colorize and customize prompt (overwritten with a more complex version in .bash_profile)
tput sgr 0 0
RESET=$(tput sgr0)
SOLAR_GREEN=$(tput setaf 64)
SOLAR_WHITE=$(tput setaf 254)
style_path="\[${RESET}${SOLAR_GREEN}\]"
style_chars="\[${RESET}${SOLAR_WHITE}\]"
PS1="\[\033]0;\w\007\]"
# Build the prompt
PS1+="\n" # Newline
PS1+="${style_path}\W " # Working directory
PS1+="${style_chars}\$ \[${RESET}\]" # $ (and reset color)
