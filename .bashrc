# Catch cd typos
alias cd..="cd .."

# Make a new directory and cd into it immediately
mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}


# File listing aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Find a file by file name
function find_file(){
find -type f -name $1
}

# Convert a markdown file to pdf
function md_to_pdf(){
pandoc -s -V geometry:margin=1in -o $2  $1
}

# Move up n directories. Saves cd ../../../....
function up() {
      times=$1
      while [ "$times" -gt "0" ]; do
        cd ..
        times=$(($times - 1))
      done
}

# Handle the mess of extracting different file types
function extract () {
      if [ -f $1 ] ; then
        case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar Jxvf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip -d `echo $1 | sed 's/\(.*\)\.zip/\1/'` $1;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'" ;;
        esac
      else
        echo "'$1' is not a valid file!"
      fi
}

# Refresh tmux
alias tmux_update="tmux source-file ~/.tmux.conf"

# Colouring ls commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
