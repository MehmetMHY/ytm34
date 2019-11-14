![random_logo_3](https://user-images.githubusercontent.com/15916367/62779992-59d18780-babd-11e9-82b4-1e836abc8c8b.png)
*YouTube-To-MP3-B README* 

## Description:
A simple terminal console program that allows you to create, a list of youtube URL links. Then, convert those URL links to mp3 files. As this is a YouTube to mp3 converting program. This is all possible thanks to youtube-dl, I simply gave it the option of adding lists of URL links well at the same time create an OK-ish UI though the terminal console.

## Important:
- This code only really works on MacOS.
- This code is a Terminal Console program.
- This code can work with Ubuntu/Linux, but some changes need to be made.
- All MP3 Files are stored in MP3_Files dir.
- The install.sh kind of works for MacOS but fails for other UNIX systems like Ubuntu. This will be fixed in an upcoming git push.

## Requirements:
- MacOS
- Python3
- Brew
- youtube-dl  :  https://github.com/ytdl-org/youtube-dl

## How to Install:
1) Read the README.

2) Run the install-yam.sh bash script in the terminal.

3) Follow the steps stated after executing install-yam.sh.

4) Click on ytm.command to run or run the main_run.sh bash script.

## How to Use:
- (1)  ADD:           Takes you a loop where you can add as many YoTube URLs as you want.
- (2)  CONVERT:       Uses youtube-dl on all the links you added in ADD.
- (3)  REFRESH:       Cleans programs directory, use it before closing program. Also clears links.txt file.
- (4)  EXIT:          Closes over all program.
- (5)  VIEW-ADD-LIST: Prints out all the URLs you entered.
- (6)  README:        Prints out README.
- (7)  VIEW-EXPORTS:  Prints out all the MP3 files in the MP3_Files folder.
- (8)  EDIT-ADD-LIST: Edit links.txt file with VIM.
- (9)  PRINT-OPTIONS: Set terminal console print out.
- (10) TROUBESHOOTING: Give the user options of troubling shooting any issues with the program. These troubling shooting methods are mainly for when youtube-dl is having issues.

## Other Notes:
- As of now, .command files only work on MacOS.
- Please only use and move around ONE ytm.command for this program!
- If you havn't, please run the 'Install Certificates.command' file in your Python folder which is most likly in your Applications folder in MacOS.
-If things get bad, run: sudo youtube-dl --no-check-certificate [ youtube URL ], otherwise dont run this.

## What Each File Does:
- YTMB-OTHER        = Folder of old stuff I made and just kept. Not part of code!
- install-ytm.sh    = Used to install over all code.
- links.txt         = Used to store YouTube URL Links.
- main_run.sh       = Main Bash Script for the code as a whole.
- MP3_Files         = Where the MP3 Files are stored after downloading.
- music_run.py      = Python script used as part of downloading process.
- Title-Prints      = Folder that holds print.py, print2.py, and title-state
   - print.py          = Python script to print non-UI for the code.
   - print2.py         = Python script to print non-UI (basic edition) for the code.
   - title-state     = True or False state for the non-UI options.
- README.txt        = README Text File.
- links_backups.txt = A text file that backups every think from the links.txt before the links.txt is refreshed by the REFRESH option.
- ytm.command	   = Used to execute overall program anywhere.

## Troubleshooting:
- Run the Trouble-Shooting option in the code (option 10).
- Find another way to update youtube-dl and try it out.
- Check out the Issues tab at the YouTube-To-MP3-B GitHub page. If the issue is not posted, please post it and someone MIGHT answer.
- If all else fails, just Google it!

## Useful Links:
- https://github.com/ytdl-org/youtube-dl
- https://stackoverflow.com/questions/8409946/how-do-i-make-this-file-sh-executable-via-double-click
- https://apple.stackexchange.com/questions/20104/how-do-i-execute-command-line-scripts
- https://www.youtube.com/
- https://github.com/MehmetMHY/YouTube-To-MP3-B
- https://askubuntu.com/questions/380438/how-can-i-update-youtube-dl
