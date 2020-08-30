##### Title:	YTM34 Bash Executable File
##### By:		Mehmet Yilmaz

# move mkv, webm, mp4, and/or mp3 files from main directory to music or videos directory
moveFiles () {
	x=$(ls -a | grep ".mkv" | wc -l)
	if [ "$x" -gt "0" ]; then
		mv *.mkv videos ; echo "Moved mkv files"
	else
		echo "No mkv  files found, so no need to move anything"
	fi

	x=$(ls -a | grep ".webm" | wc -l)
	if [ "$x" -gt "0" ]; then
		echo "Moved webm files" ; mv *.webm videos
	else
		echo "No webm files found, so no need to move anything"
	fi

	x=$(ls -a | grep ".mp4" | wc -l)
	if [ "$x" -gt "0" ]; then
		echo "Moved mp4 files" ; mv *.mp4 videos
	else
		echo "No mp4  files found, so no need to move anything"
	fi

	x=$(ls -a | grep ".mp3" | wc -l)
	if [ "$x" -gt "0" ]; then
		echo "Moved mp3 files" ; mv *.mp3 music
	else
		echo "No mp3  files found, so no need to move anything"
	fi
}

# update youtube_dl if need be
updateYTDL () {
	echo "Updating youtube_dl:"
	pip install --upgrade youtube-dl
	echo
}

# activate youtube_dl python enviroment
source ytm34/bin/activate

x=$(which python3 | grep "ytm34" | wc -l)
if [ "$x" -gt "0" ]; then

	updateYTDL

	# run main script
	python3 .RUN.py

	# ideal location for 
	ideal=$(cat .idealLocation.txt)

	# organize files in main directory
	current=$(pwd)
	if [ "$ideal" == "$current" ]
	then
		moveFiles
	else
		echo "Moving Files Error:"
		echo "- Not ideal PWD ($ideal). Please change ideal location or move ytm34."
		echo "- No files were moved!"
	fi

	# deactivate youtube_dl python enviroment
	deactivate
else
	echo "youtube_dl python env not found/working, please look into the issue"
fi


