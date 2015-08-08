#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

# Aliases
alias vi="nvim"
alias vim="nvim"
alias mvim="reattach-to-user-namespace mvim"
alias vrc="vi ~/.vimrc.local"
alias vbund="vi ~/.vimrc.bundles"
alias vinstall="vim +PlugInstall +PlugClean +qa"
alias zrc="vi ~/.zshrc"
alias cowsage="fortune | cowsay | lolcat"
alias extip="curl ipecho.net/plain; echo"
alias locip="ipconfig getifaddr en0"
alias shutd="sudo shutdown -h now"
alias rstrt="sudo shutdown -r now"
alias resrc="source ~/.zprofile"
alias nyan="telnet nyancat.dakko.us"
logintxt() { sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "$*" } 
dellogintxt() { sudo defaults delete /Library/Preferences/com.apple.loginwindow LoginwindowText } 

# Personalize Aliases
alias zprof="vi ~/.zprofile"
alias zrc="vi ~/.zshrc"
alias zprezrc="vi ~/.zpreztorc"
#figlolcow() {
  #figlet -f starwars "STAR WARTS"
  #fortune | cowsay| lolcat 
#}
fortunecow() {
  fortune | cowsay
}

fortunecow
#figlolcow
eval "$(docker-machine env sandbox)"

