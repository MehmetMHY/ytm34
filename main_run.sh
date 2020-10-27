# YouTube-To-MP3-B Main Bash Script

# FORMAL CONFESSION / PLEASE READ
#   - The part of the code that converts a YouTube link into a mp3 and/or mp4 file is supported by the youtube-dl library.
#   - Baiscally all the code was written and will be maintained by Mehmet Yilmaz but the ability to covert a YouTube link into a mp3 and/or mp4 file is supported by the developers of the youtube-dl library.
#   - Why Use youtube-dl?: YouTube always its formating which makes it hard for a single developer to maintain a YouTube to mp3/mp4 convert. So its better to reply on a third party source that is maintain by a group of talented developers.

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

add_option () {
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
	cd ~/YouTube-To-Mp3 ; clear
	echo "-Requires VIM, to EDIT-" ; echo
	echo "  >VIM Notes:"
	echo "    - i   = Enter Edit Mode"
	echo "    - ESC = Exit Edit Mode"
	echo "    - :wq = Save & Exit Vim" ; echo
	echo '-Loading-'
	echo -ne '[#####                    ] (20%)\r'  ; sleep 2
	echo -ne '[##########               ] (40%)\r'  ; sleep 2
	echo -ne '[###############          ] (60%)\r'  ; sleep 2
	echo -ne '[####################     ] (80%)\r'  ; sleep 2
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
		echo "        (3) JUST-EXIT"
		read -p "ENTER: " INPUT_FOUR ; cd Title-Prints

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

readme_option () {
	clear_it=false
	clear ; clear
	echo ; echo "[----------/README_START/----------]"
	echo ; cat README* ; echo ; echo
	echo "[-----------/README_END/-----------]" ; echo
	echo "-README Content Is Printed Above [↑]-" ;  echo
}

option_five () {
	cd ~/YouTube-To-Mp3
	clear

	while true ; do
		echo "-Current Troubleshooting Methods-"
		echo "        (1) Update youtube-dl"
		echo "        (2) Install youtube-dl again"
		echo "        (3) Google it"
		echo "        (4) JUST-EXIT"
		echo "*Please note that these troubleshoot methods MIGHT work!" ; echo
		read -p "ENTER: " INPUT_FIVE ; echo

		if [ $INPUT_FIVE == "1" ] ; then
			echo "-[ Updating youtube-dl ]-" ; echo
			echo "*Current youtube-dl Verison: "
			OLDV="$(youtube-dl --version)" ; echo "${OLDV}" ; echo
			
            # [ Other Update Options - It Does Not Work For Most Cases ]
            #sudo pip install --upgrade youtube-dl
			#sudo youtube-dl --update
            #youtube-dl --update
            
            # [ Current Update Options - That Usually Works... ]
            #pip install --upgrade youtube-dl
			#pip install --upgrade youtube-dl
            brew upgrade youtube-dl
            
			echo ; echo "*Previous youtube-dl Verison:" ; echo "${OLDV}"
			echo "*Current youtube-dl Verison:" ; youtube-dl --version ; echo
			echo "[Hit Enter To Return To Main Manu]" ; read PAUSE
			break
		elif [ $INPUT_FIVE == "2" ] ; then
			echo "Installing youtube-dl Again"
			echo "  * Works as of 8-8-2019"
			echo "  - youtube-dl GitHub : https://github.com/ytdl-org/youtube-dl"
			echo "  - MacOS"
			echo "  - brew"
			echo '-Loading-'
			echo -ne '[#####                    ] (20%)\r'  ; sleep 2
			echo -ne '[##########               ] (40%)\r'  ; sleep 2
			echo -ne '[###############          ] (60%)\r'  ; sleep 2
			echo -ne '[####################     ] (80%)\r'  ; sleep 2
			echo -ne '[#########################] (100%)\r' ; sleep 1 ; echo
			brew install youtube-dl 
			break
		elif [ $INPUT_FIVE == "3" ] ; then
			echo "Good Luck Googling, I would start from these URLs:"
			echo "  1) https://github.com/MehmetMHY/YouTube-To-MP3-B/issues"
			echo "  2) https://github.com/ytdl-org/youtube-dl/issues" ; echo
   
            bash Title-Prints/internetprintout.sh ; cd ..
            
			echo ; echo "[Hit Enter To Return To Main Manu]" ; read PAUSE
			break
		elif [ $INPUT_FIVE == "4" ] ; then
			break
		else
			echo "Try Again!" ; echo			
		fi
	done
}

viewExport_option (){
	clear_it=false
	cd ~/YouTube-To-Mp3
	mv *.mp3 MP3_Files ; rm *.webm
	cd MP3_Files
	clear ; clear
	echo "-Current Content-"
	echo ; ls
	echo ; echo "  -> Number-of-MP3s: " ; ls | wc -l
	echo ; echo "-List Is Above [↑]-" ;  echo
	cd ~/YouTube-To-Mp3
}

preference_option (){
	while true ; do
		echo "-PREFERENCES-"
		echo "        (1) README"
		echo "        (2) EDIT-ADD-LIST"
		echo "        (3) PRINT-OPTIONS"
		echo "        (4) TROUBLE-SHOOTING"
        echo "        (5) BACKUPED-UP-URL-LINKS"
		echo "        (6) RETURN-TO-MAIN-MANU" ; echo

		read -p "ENTER: " INPUT

		if [ $INPUT == "1" ] ; then
			readme_option
		elif [ $INPUT == "2" ] ; then
			option_three
			clear
			cd ~/YouTube-To-Mp3
		elif [ $INPUT == "3" ] ; then
			option_four
			cd ~/YouTube-To-Mp3
			clear
		elif [ $INPUT == "4" ] ; then
			option_five
			cd ~/YouTube-To-Mp3
			clear
        elif [ $INPUT == "5" ] ; then
            cat links_backups.txt ; echo
            echo "  -> Number-of-Links: "
            cat links_backups.txt | sed '/^\s*#/d;/^\s*$/d' | wc -l ; echo
		elif [ $INPUT == "6" ] ; then
			break
		else
			clear
			echo "Try Again!"
			clear_it=false
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
			add_option
		elif [ $INPUT == "2" ] ; then
			option_two
		elif [ $INPUT == "3" ] ; then
			cd ~/YouTube-To-Mp3
			mv *.mp3 MP3_Files
            rm *.webm
			rm *.part
            rm *.m4a
			cat links.txt >> links_backups.txt
			echo "####################################################################################################" >> links_backups.txt
			rm links.txt
			touch links.txt
			echo ; echo "...Refreshed" ; echo
        elif [ $INPUT == "4" ] ; then
            cd ~/YouTube-To-Mp3
            mv *.mp3 MP3_Files ; rm *.webm
            echo "Shutting Down..."
            break
		elif [ $INPUT == "5" ] ; then
			clear_it=false
			clear ; clear
			echo ; echo "-Current List-" ; echo
			cat links.txt
			echo ; echo "  -> Number-of-Links: " ; wc -l < links.txt
			echo ; echo "-List Is Above [↑]-" ; echo
		elif [ $INPUT == "6" ] ; then
			viewExport_option
		elif [ $INPUT == "7" ] ; then
			clear
			preference_option
			clear
		elif [ $INPUT == "8" ] ; then
			clear
			cd ~/YouTube-To-Mp3/YTMP4
			bash YTM4.sh
			cd ~/YouTube-To-Mp3
			clear
        elif [ $INPUT == "ls" ] ; then
            # ls is not listed in the Options, its mainly a developer tool
            echo ; echo ">Directory: ~/YouTube-To-Mp3"
            ls ~/YouTube-To-Mp3
            echo ; echo ">Directory: ~/YouTube-To-Mp3/YTMP4"
            ls ~/YouTube-To-Mp3/YTMP4/
            echo ; echo "[Press A Key To Return To Main Manu]" ; read leave
		else
			clear
			echo "Try Again!"
			clear_it=false
		fi
	done
}

main_run

### Optional for quiting terminal but it closes ALL terminal windows
# osascript -e 'tell application "Terminal" to quit' & exit
