# ytm34 - Simple Terminal UI for youtube-dl
- Date: 3-25-2021

## About:
- A nice and simple terminal UI application that makes it easier for people to use and manage youtube_dl.
- Remembering all the commands was always a pain, having alot of alias(s) for youtube_dl was a bit annoying, and I always struggled to organize the music and video files I downloaded. So to fix this, I made this simple terminal UI that allows the user to easily use and manage youtube_dl with only one alias command and a basic terminal UI, well containing everything in just one directory. This tool also has the option of creating lists of URLs that can then be used with youtube_dl. Not only that, but this tool also has youtube_dl contained in a virtualenv.

## Requirements:
- python3
- virtualenv & youtube_dl
- bash/unix

## Source(s):
- [youtube-dl webpage](https://youtube-dl.org/)
- [youtube-dl github page](https://github.com/ytdl-org/youtube-dl)

## How To Run:
### Prep:
- Make sure these are installed: python3 & pip3
- Run the following commands in ytm34/:

        bash tool.sh -mve

        bash tool.sh -mcd

        bash tool.sh -up

        bash tool.sh -ile

- In the newly created .ideal_loc, there is a variable called ytm34_ideal that is being exported. Set this variable equal to the PWM of the ytm34/ directory in your current setup (ex: ~/Desktop/ytm34/).
- To make it easier to use ytm34, please create an alias in your shell's initial user log in file. This file could be the following: .zshrc, .bashrc, etc. Make an alias that looks something like this (please change the cd path to fit your setup):

        alias ytm34="cd ~/Desktop/ytm34/ ; bash run.sh ; cd $OLDPWD"

## Run:
1) Go to the ytm34 directory and make sure to do everything listed in the "Prep" section of this README
2) Run the "run.sh" file:

        bash run.sh

3) A menu will pop up, there are mainly 3 options for getting audio and/or video from YouTube.
4) To make a list, select option 1 or 5 (depending on if you want audio or video (YTM4))
5) For the list option(s), simply copy and paste your desired URL and hit enter. To exit this menu just type in "404"
6) After the list is created, select 3 or 7 to use all the URL(s) in your list with youtube_dl to convert those URL(s) into audio or vidoe files (depending on what you select).
7) There are other options if you want to mess with them or if you need to use them.
8) Sometimes, the menu does not pop up again after a youtube_dl job and to fix this you can just type "8" and hit ENTER. If the menu pops up again, then great. But if the menu does not pop up again, just wait a little bit longer. Do CTRL-C if worst comes to worst.
9) When you are all done, just type 4 then ENTER and you will leave the program.
10) The last thing this program does before closing is it checks the _ytm34 directory and moves any audio or video files from the _ytm34 directory to the /videos or /music directory depending on the file type.
11) To access your audio or video files from YouTube, just check out the videos and/or music directory in the _ytm34 directory.


