# YTM3-B Project's command file (12-20-2019)

# command that enables this command file:
#      chmod +x ytm.command

# go to desired directory:
cd ~/YouTube-To-Mp3

# execute main bash script
bash main_run.sh

# exit/close terminal after main bashscript is closed
osascript -e 'tell application "Terminal" to quit' &
exit
