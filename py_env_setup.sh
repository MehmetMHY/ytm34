x=$(pwd | grep ytm34 | wc -l)
if [ "$x" -gt "0" ]; then
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
        echo "To exit this env, run the following command: deactivate"
        echo

    else
        echo "Please install virtualenv!"
        echo " - Make sure you have pip3 installed!"
        echo " - command: pip3 install virtualenv"
    fi
else
	echo "Can't run script, move script to ytm34 directory!"
fi

x=$(ls -a | grep videos | wc -l)
if [ "$x" -gt "0" ]; then
    echo "videos/ exists"
else
	mkdir videos
fi

x=$(ls -a | grep music | wc -l)
if [ "$x" -gt "0" ]; then
    echo "music/ exists"
else
	mkdir music
fi