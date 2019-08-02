# YouTube-To-MP3-B Main Bash Script
# Notes:
#   -Option_2 Supported by youtube-dl
#   -The rest of the code was made by Mehmet Yilmaz

check_files () {
	cd ~/YouTube-To-Mp3
	if [ -e *.mp3 ] ; then
		echo "-Misplaced Mp3 Files Have Been Moved : Mmm-"
		mv *.mp3 MP3_Files
	elif [ -e *.webm ] ; then
		echo "-Webm Files Have Been Moved : Mmm-"
		rm *.webm
	else
		echo "-No Start Issues : Good-"
	fi
}

option_one () {
	while true ; do
		echo "-Enter URL or 404 to Exist-"
		read INPUT_TWO
		if [ $INPUT_TWO == "404" ] ; then
			echo "Exiting ADD"
			break
		else
			echo "$INPUT_TWO" >> links.txt
		fi
	done
}

option_two () {
	echo "-Starting Conversion(s)-"
	touch enter.txt
	python3 music_run.py
	sh enter.txt
	rm enter.txt
	echo ; echo "-Conversion(s) Completed, Mp3 Files Saved to MP3_Files-"
}
 
option_three () {
	cd ~/YouTube-To-Mp3
	clear
	echo "-Requires VIM, to EDIT-" ; echo
	echo "  >VIM Notes:"
	echo "    - i   = Enter Edit Mode"
	echo "    - ESC = Exit Edit Mode"
	echo "    - :wq = Save & Exit Vim" ; echo
	echo '-Loading-'
	echo -ne '[#####                    ] (20%)\r'  ; sleep 1
	echo -ne '[##########               ] (40%)\r'  ; sleep 1
	echo -ne '[###############          ] (60%)\r'  ; sleep 1
	echo -ne '[####################     ] (80%)\r'  ; sleep 1
	echo -ne '[#########################] (100%)\r' ; sleep 1 ; echo 
	vim links.txt
}

option_four () {
	cd ~/YouTube-To-Mp3
	clear
	echo "->Current Print Option:"
	if [ "$print_all" = true ] ; then
		echo "  *PRINT-ALL"
	else
		echo "  *MINIMAL-PRINT"
	fi ; echo
	
	while true ; do
		echo "-Change Print Options-"
		echo "        (1) PRINT-ALL"
		echo "        (2) MINIMAL-PRINT"
		echo "        (3) JUST-EXIT" ; echo "ENTER:"
		read INPUT_FOUR ; cd Title-Prints
		if [ $INPUT_FOUR == "1" ] ; then
			echo "true" > title-state
			break
		elif [ $INPUT_FOUR == "2" ] ; then
			echo "false" > title-state
			break
		elif [ $INPUT_FOUR == "3" ] ; then
			break
		else
			echo "Try Again!" ; echo
		fi
	done
}

main_run () {
	cd ~/YouTube-To-Mp3
	clear_it=true

	touch enter.txt ; rm enter.txt
	clear ; clear

	while true ; do

		cd ~/YouTube-To-Mp3 ; cd Title-Prints
		print_all=$( tail -n 1 title-state ) ; cd ..

		if [ "$clear_it" = true ] ; then
			clear ; clear
		fi ; clear_it=true

		cd Title-Prints
		if [ "$print_all" = "true" ] ; then
			python3 print.py
		else
			python3 print2.py
		fi ; cd ..

		read INPUT

		if [ $INPUT == "1" ] ; then
			option_one
		elif [ $INPUT == "2" ] ; then
			option_two
		elif [ $INPUT == "4" ] ; then
			cd ~/YouTube-To-Mp3
			mv *.mp3 MP3_Files ; rm *.webm
			echo "Shutting Down..."
			break
		elif [ $INPUT == "3" ] ; then
			cd ~/YouTube-To-Mp3
			mv *.mp3 MP3_Files ; rm *.webm
			rm links.txt
			touch links.txt
			echo ; echo "...Refreshed" ; echo
		elif [ $INPUT == "5" ] ; then
			clear_it=false
			clear ; clear
			echo ; echo "-Current List-" ; echo
			cat links.txt
			echo ; echo "  -> Number-of-Links: " ; wc -l < links.txt
			echo ; echo "-List Is Above [↑]-" ; echo
		elif [ $INPUT == "6" ] ; then
			clear_it=false
			clear ; clear
			echo ; echo "[----------/README_START/----------]"
			echo ; cat README* ; echo ; echo
			echo "[-----------/README_END/-----------]" ; echo
			echo "-README Content Is Printed Above [↑]-" ;  echo
		elif [ $INPUT == "7" ] ; then
			clear_it=false
			cd ~/YouTube-To-Mp3
			mv *.mp3 MP3_Files ; rm *.webm
			cd MP3_Files
			clear ; clear
			echo "-Current Content-" ; echo
			ls
			echo ; echo "  -> Number-of-MP3s: " ; ls | wc -l
			echo ; echo "-List Is Above [↑]-" ;  echo
			cd ~/YouTube-To-Mp3
		elif [ $INPUT == "8" ] ; then
			option_three
			cd ~/YouTube-To-Mp3
		elif [ $INPUT == "9" ] ; then
			option_four
			cd ~/YouTube-To-Mp3
		else
			clear
			echo "Try Again!"
			clear_it=false
		fi
	done
}

main_run

#Be careful here! It works but its not that good of a solution!
#killall Terminal