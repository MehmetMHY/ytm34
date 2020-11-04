### YTM34 Tool Script
# - Date: 11-4-2020
# - About: Useful tool for setting-up/Managing YTM34

# update youtube_dl if need be
updateYTDL () {
	echo "Updating youtube_dl:"
    source ytm34/bin/activate
    which python3
    read -p "Continue? " temp
    echo
	pip3 install --upgrade pip
	pip install --upgrade youtube-dl
	echo
    echo "DONE"
}

# setup python3 virtual environment
if [ "$1" == "-mve"  ]
then

    # make sure you are in the ytm34 directory
    x=$(pwd | grep ytm34 | wc -l)
    if [ "$x" -gt "0" ]; then

        # make sure virtualenv is installed
        x=$(pip3 list | grep virtualenv | wc -l)
        if [ "$x" -gt "0" ]; then
            python3 -m venv ytm34

            echo "ytm34 python env is setup, activate it: "
            echo " - command: source ytm34/bin/activate"
            echo
            echo "Now, make sure this is working!"
            echo " - command: which python3"
            echo
            echo "Then, install the following: "
            echo " - command: pip3 install --upgrade pip"
            echo " - command: pip3 install --upgrade youtube_dl"
            echo
            echo "Finally exit this env, run the following command: deactivate"
            echo

        else
            echo "Please install virtualenv!"
            echo " - Make sure you have pip3 installed!"
            echo " - command: pip3 install virtualenv"
        fi
    else
        echo "Can't run script, move script to ytm34 directory!"
    fi

# create  videos and music directories
elif [ "$1" == "-mcd"  ]
then

    # create videos/ directory
    x=$(ls -a | grep videos | wc -l)
    if [ "$x" -gt "0" ]; then
        echo "videos/ exists"
    else
        mkdir videos
    fi

    # create music/ directory
    x=$(ls -a | grep music | wc -l)
    if [ "$x" -gt "0" ]; then
        echo "music/ exists"
    else
        mkdir music
    fi

# clear certain files for git pushing
elif [ "$1" == "-clear"  ]
then

    cat /dev/null > .listBackup3.txt
    cat /dev/null > .listBackup4.txt
    echo "cleared backup files"
    echo

    cat /dev/null > .ytm3Links.txt
    cat /dev/null > .ytm4Links.txt
    echo "cleared URL link files"
    echo

    mlc=$(ls music | wc -l)
    vlc=$(ls videos | wc -l)

    echo "Make sure to clear music/ and videos/ directories:"
    echo "  - Number of files in music/  : $mlc"
    echo "  - Number of files in videos/ : $vlc"
    echo

    echo "DONE"

# update youtube_dl in virtualenv
elif [ "$1" == "-up"  ]
then
    echo "Updaing youtube_dl..."
    updateYTDL

else
    # ß = default option with out any options selected
    echo "[OPTIONS]"
    echo "   ß     = print options"
    echo " -up     = update youtube_dl"
    echo " -mve    = setup python3 environment"
    echo " -mcd    = create video & music directories"
    echo " -clear  = clear certain things for git pushing"
fi


