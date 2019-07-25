# Install for YouTube-To-MP3-B (BETA)
# 7-18-2019

clear ; echo "Installing YouTube to Mp3 - B / MacOS Edition" ; echo
echo "Prerequisites:"
echo "  *** git"
echo "  *** brew" ; echo
echo "Installing: "
echo "  --- youtube-dl"
echo "  --- python3" ; echo
echo "[ PLEASE READ ABOVE CONTENT ]" ; echo

# This is a fun loading bar, makes sure the text above is read!
echo '-Loading-'
echo -ne '[#####                    ] (20%)\r'  ; sleep 5
echo -ne '[##########               ] (40%)\r'  ; sleep 5
echo -ne '[###############          ] (60%)\r'  ; sleep 5
echo -nne '[####################     ] (80%)\r'  ; sleep 5
echo -ne '[#########################] (100%)\r' ; sleep 5 ; echo

# Install Python3:
VIM_INSTALL () {
	while true ; do
		echo ; echo "Do you have Python3 ? (y or n)? "
		read INPUT
		if [ $INPUT == "n" ] ; then
			brew install python3
		elif [ $INPUT == "y" ] ; then
			echo "Good" ; break
		else
			echo "Please Enter y or n!" ; echo
		fi
	done
}

# Install Vim:
P_INSTALL () {
	while true ; do
		echo ; echo "Do you have VIM? (y or n)? "
		read ENTER
		if [ $ENTER == "n" ] ; then
			brew install vim
		elif [ $ENTER == "y" ] ; then
			echo "Good" ; break
		else
			echo "Please Enter y or n!" ; echo
		fi
	done
}

# Do Optional Stuff (optional):
Do_Optional () {
	while true ; do
		echo ; echo "Would you like to do the optional Steps ?"
		echo " *Remember, this is optional!!!"
		read ENTER
		if [ $ENTER == "y" ] ; then
			# Changning Icon Image on MacOS:
			echo "(optional) Change ytm.command Icon:"
			echo " 1) Right Click on ytm.command and select: Get Info"
			echo " 2) Then open the random_logo.png image hit: Command-A then Command-C"
			echo " 3) Close the image and go back the the Get Info you opened"
			echo " 4) Click on the image next to the ytm.command. Its the image on the top left"
			echo " 5) Command-V, then exit the Get Info window"
			echo " 6) After all of this, you should be good " ; echo
		elif [ $ENTER == "n" ] ; then
			echo "Good" ; break
		else
			echo "Please Enter y or n!" ; echo
		fi
	done
}

# Install Python3 and VIM:
P_INSTALL ; VIM_INSTALL

# Install youtube-dl:
echo ; echo "-Installing youtube-dl From GitHub-" ; echo
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# Setting Up Files:
echo ; echo "-Setting Up ytm.command Executable-" ; echo
cd ~/YouTube-To-Mp3
chmod +x ytm.command
mv ytm.command ~/Desktop

# Some quick notes:
echo "Quick Notes: "
echo "  -The program is ran though the ytm.command, or the main_run.sh if you want."
echo "  -You can move the ytm.command file to any directory and it should still work."
echo "  -Don't move around any file but the ytm.command file."
echo "  -If something weirld happens with the program, use the REFRESH option." ; echo

# Setting up Terminal:
echo ; echo "PLEASE READ: "
echo "Do the following steps:"
echo " 1) Open Terminal and click on Preferences."
echo " 2) Click on Settings, then click on Shell."
echo " 3) Set When the shell exits to Close if the shell exited cleanly" ; echo

echo "<<{  [↑] Please READ Text Printed Above !  }>>" ; echo

Do_Optional

echo "<<{  (Once-Again) [↑] Please READ Text Printed Above !  }>>" ; echo

echo "-Hopefully everything installed, if there are issues look at the code-" ; echo ; echo


