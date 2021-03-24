##### Title:	YTM34 Bash Executable File
##### By:		Mehmet Yilmaz
##### Date:		1-23-2021

ideal=$ytm34_ideal

# move mkv, webm, mp4, and/or mp3 files from main directory to music or videos directory
moveFiles () {
	printf "\033[0;36mMOVED_ITEMS:\033[0m" ; echo
	x=$(ls -a | grep ".mkv" | wc -l)
	if [ "$x" -gt "0" ]; then
		tmp=$(ls -a | grep "mkv" | wc -l | sed 's/ //g')
		echo "- Moved $tmp mkv files:"
		ls -a | grep ".mkv" | nl
		mv *.mkv videos
	else
		echo "No mkv  files found, so no need to move anything"
	fi

	echo

	x=$(ls -a | grep ".webm" | wc -l)
	if [ "$x" -gt "0" ]; then
		tmp=$(ls -a | grep "webm" | wc -l | sed 's/ //g')
		echo "- Moved $tmp webm files:"
		ls -a | grep ".webm" | nl
		mv *.webm videos
	else
		echo "No webm files found, so no need to move anything"
	fi

	echo

	x=$(ls -a | grep ".mp4" | wc -l)
	if [ "$x" -gt "0" ]; then
		tmp=$(ls -a | grep "mp4" | wc -l | sed 's/ //g')
		echo "- Moved $tmp mp4 files:"
		ls -a | grep ".mp4" | nl
		mv *.mp4 videos
	else
		echo "No mp4  files found, so no need to move anything"
	fi

	echo

	x=$(ls -a | grep ".mp3" | wc -l)
	if [ "$x" -gt "0" ]; then
		tmp=$(ls -a | grep "mp3" | wc -l | sed 's/ //g')
		echo "- Moved $tmp mp3 files:"
		ls -a | grep ".mp3" | nl
		mv *.mp3 music
	else
		echo "No mp3  files found, so no need to move anything"
	fi

	echo
}

# update youtube_dl if need be
updateYTDL () {
	echo "Updating youtube_dl:"
	pip3 install --upgrade pip
	pip install --upgrade youtube-dl
	echo
}

# activate youtube_dl python enviroment
source ytm34/bin/activate

x=$(which python3 | grep "ytm34" | wc -l)
if [ "$x" -gt "0" ]; then

	# update youtube_dl, just in case
	#updateYTDL

	# remove youtube_dl caches
	youtube-dl --rm-cache-dir

	# run main script
	python3 .RUN.py

	# organize files in main directory
	current=$(pwd)
	if [ "$ideal" == "$current" ]
	then
		moveFiles
	else
		echo "Not ideal PWD, move to $(ideal) directory!"
	fi

	# deactivate youtube_dl python enviroment
	deactivate

	# show ytm34 storage takeup (MB, GB, etc)
	#echo ; printf "\033[0;36mSPACE:\033[0m" ; echo ; printf "\033[0;33mUsed    File/Dir\033[0m" ; echo ; du -hs * | sort -hr
else
	echo "youtube_dl python env not found/working, please look into the issue!"
	echo "Try this:"
	echo "	1) go to ytm34/ directory"
	echo "	2) run:		bash tool.sh -mve"
	echo "	3) follow the steps presented by the tool.sh script"
	echo
	echo "*if there does not work, please file an issue on GitHub:"
	echo "		https://github.com/MehmetMHY/ytm34"
	echo
fi


