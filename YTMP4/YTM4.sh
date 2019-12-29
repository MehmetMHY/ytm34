while true; do
    # 1) Convert YouTube URL to MP4
    # 2) View Export List
    # 3) Download "Best" MP4 (BETA)
    # 4) Exit
    
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
		cd YTM4-Videos
        echo "-Exported MP4 Files-" ; echo " "
        ls
        echo " " ; echo "-Total Exports-"
        ls -l | grep -v ^l | wc -l
        cd ..
    elif [ $INPUT == "3" ] ; then
        echo "[ YouTube-To-MP4 Best Video & Audio (BETA) ]"
        echo "    *Might download mkv rather then mp4" ; echo ""
        echo "Input a YouTube URL Link"
        read -p "Link (404 to quit): " link
        if [ $link != "404" ] ; then
            echo " "
            youtube-dl -f bestvideo+bestaudio $link
            mv *.mp4 YTM4-Videos
            mv *.mkv YTM4-Videos
        fi
        clear
    elif [ $INPUT == "4" ] ; then
        clear
        break
	else
		clear
		echo "Try Again!"
	fi
done
