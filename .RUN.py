import time
import os

class Cs:
   PURPLE = '\033[95m'
   BLUE = '\033[94m'
   GREEN = '\033[92m'
   YELLOW = '\033[93m'
   RED = '\033[91m'
   UNDERLINE = '\033[4m'
   BOLD = '\033[1m'
   END = '\033[0m'

def createLists(file, command, type):
    list_of_lists = []
    while(True):
        y = input("[" + type + "] " + "Enter URL (404 to exit): ")
        if(str(y) == "404"):
            for i in range(len(list_of_lists)):
                c = 'echo "' + str(list_of_lists[i]) + '" >> ' + str(file)
                os.system(c)
            break
        else:
            value = str(command + y)
            list_of_lists.append(value)

def exportExecute(shFile, backupFile):
    os.system("youtube-dl --rm-cache-dir")
    os.system("sh " + shFile)
    os.system("cat " + shFile + " > " + backupFile)
    os.system("> " + shFile)

def sps(amount):
    spacing = ""
    for i in range(amount):
        spacing = spacing + " "
    return spacing

def options():
    print(Cs.BOLD + Cs.RED + Cs.UNDERLINE + "Simplistic YouTube-DL Console UI" + Cs.END)
    print(Cs.PURPLE + "audio:" + Cs.END + sps(10) +  Cs.PURPLE + "video:" + Cs.END)
    print("  1) Make List    5) Make List   ")
    print("  2) Edit List    6) Edit List   ")
    print(" *3) YouTube-DL  *7) YouTube-DL  ")
    print("  4) EXIT         8) Restart     ")
    print("  H) Hidden")

def updateYouTubeDL():
    while(True):
        print(Cs.UNDERLINE + "Current Python Verisons:" + Cs.END)
        os.system("python3 -V")
        os.system("which python3")
        temp = input("Update YouTube-Dl (y/n)?")
        if(temp.lower() == "yes" or temp.lower() == "y"):
            os.system("pip3 install --upgrade youtube-dl")
            break
        elif(temp.lower() == "no" or temp.lower() == "n"):
            break
        os.system("clear")

def hiddenOptions():
    print(Cs.UNDERLINE + "YTM34 HIDDEN OPTIONS" + Cs.END)
    print("U = Update youtube_dl in the ytm34/ environment")
    print("ls = List all files in music/ and videos/ directory")
    print("space = List ytm34 directories and their sizes ")
    print()

def printLS(music_path, videos_path):
    print(Cs.UNDERLINE  + Cs.BLUE + "MUSIC & VIDEO FILES [LS]" + Cs.END)
    os.system("echo 'DATE: ' $(date)")
    print()
    print("Music/")
    os.system("ls " + str(music_path))
    temp = "echo '>Total Files:' $(ls " + str(music_path) + " | wc -l | tr -d ' ')"
    os.system(str(temp))
    print()
    print("Videos/")
    os.system("ls " + str(videos_path))
    temp = "echo '>Total Files:' $(ls " + str(videos_path) + " | wc -l | tr -d ' ')"
    os.system(str(temp))
    print()

def ifclear(boolclear):
    if(boolclear):
        os.system("clear")
    else:
        boolclear = False
    return boolclear

def spaceCommand():
    tmp = 'printf "\033[0;36mSPACE:\033[0m" ; echo ; printf "\033[0;33mUsed    File/Dir\033[0m" ; echo ; du -hs * | sort -hr'
    os.system(tmp)

def main():
    invalidInput = False
    clearTerminal = True
    counter = 0
    doneMessage = "\n[ Download Completed, Hit ENTER To Continue]\n"
    printInitialMessage = True

    while(True):

        ifclear(clearTerminal)

        if(invalidInput):
            print(Cs.RED + "\nInvalid Input, Try Again!" + Cs.END)
            invalidInput = False

        if(printInitialMessage):
            print(">Use EXIT [4], not CTRL-C! \n")
            printInitialMessage = False
        options()
        userInput = input(Cs.GREEN + "ENTER: " + Cs.END)

        if(userInput == "1"):
            createLists(".ytm3Links.txt", "youtube-dl --extract-audio --audio-format mp3 ", "audio")
        elif(userInput == "2"):
            os.system("vim .ytm3Links.txt")
        elif(userInput == "3"): # uing youtube_dl (audio)
            exportExecute(".ytm3Links.txt", ".listBackup3.txt")
            delay = input(Cs.RED + doneMessage + Cs.END)
        elif(userInput == "4"):
            break
        elif(userInput == "5"):
            createLists(".ytm4Links.txt", "youtube-dl -f bestvideo+bestaudio ", "video")
        elif(userInput == "6"):
            os.system("vim .ytm4Links.txt")
        elif(userInput == "7"): # using youtube_dl (video)
            exportExecute(".ytm4Links.txt", ".listBackup4.txt")
            delay = input(Cs.RED + doneMessage + Cs.END)
        elif(userInput == "U"):
            updateYouTubeDL()
        elif(userInput == "ls"):
            os.system("clear")
            printLS("music", "videos")
            clearTerminal = False
        elif(userInput == "H" or userInput == "h"):
            os.system("clear")
            hiddenOptions()
            clearTerminal = False
        elif(userInput == "space"):
            os.system("clear")
            spaceCommand()
            print()
            clearTerminal = False
        else:
            if(userInput != "8"):
                invalidInput = True

if __name__ == "__main__":
    main()
