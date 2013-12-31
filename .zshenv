### .zshenv

if [ "$TERM" = "xterm" -o "$TERM" = "kterm" ]
then
    # [ -x /usr/games/fortune ] && (LANG=C; /usr/games/fortune)
fi

# For man on the Emacs
export PAGER="less"

# Change directory color when type 'ls --color'. See man dircolors.
export LS_COLORS='di=01;37;40:'

PATH="/usr/local/heroku/bin:$PATH" # Add Heroku to PATH

### end of file

