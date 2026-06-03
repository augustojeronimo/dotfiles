#####################
###   FUNCTIONS   ###
#####################


# re-execute the last command with sudo
please()
{
    sudo $(fc -ln -1)
}

# Create a directory and enter it
mkcd ()
{
    (( $# != 1 )) && { echo "Usage: mkcd <dir>" && return 1 }

    mkdir -p -- "$1" && cd -- "$1"
}

