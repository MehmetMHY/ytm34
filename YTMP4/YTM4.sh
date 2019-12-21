while true; do
	#echo "-YouTube to MP4 Conveter (BETA)-"
	#echo "   (1) Convert YouTube URL to MP4"
	#echo "   (2) Exit" ; echo " "
	#read -p "ENTER: " INPUT

	python3 ytm4-title.py
	read INPUT

	clear

	if [ $INPUT == "1" ] ; then
		echo "Input a YouTube URL Link"
		read -p "Link (404 to quit): " link

		if [ $link != "404" ] ; then
			echo " "
			youtube-dl -F $link
			echo " " ; echo "[ Pick Best Quality ]"
			read -p "Format (404 to quit): " quality
			if [ $quality != "404" ] ; then
				youtube-dl -f $quality $link
				mv *.mp4 YTM4-Videos
			fi
		fi

		clear
	elif [ $INPUT == "2" ] ; then
		clear
		break
	else
		clear
		echo "Try Again!"
	fi
done
