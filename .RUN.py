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

def options():
    print(Cs.BOLD + Cs.RED + Cs.UNDERLINE + "UNCOMPLICATED YOUTUBE-DL" + Cs.END)
    print(Cs.PURPLE + "audio:" + Cs.END + "           " +  Cs.PURPLE + "video:" + Cs.END)
    print("  1) Make List   5) Make List  ")
    print("  2) Edit List   6) Edit List  ")
    print(" *3) YouTube-DL *7) YouTube-DL ")
    print("  4) EXIT        8) Restart    ")
    #print("  U) Update youtube_dl")

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

def main():
    invalidInput = False
    counter = 0
    doneMessage = "\n[ Download Completed, Hit ENTER To Continue]\n"

    while(True):

        counter = counter + 1

        os.system("clear")

        if(invalidInput):
            print(Cs.RED + "\nInvalid Input, Try Again!" + Cs.END)
            invalidInput = False

        if(counter == 1):
            print(">Use EXIT [4], not CTRL-C! \n")
        options()
        userInput = input(Cs.GREEN + "ENTER: " + Cs.END)

        if(userInput == "1"):
            createLists(".ytm3Links.txt", "youtube-dl --extract-audio --audio-format mp3 ", "audio")
        elif(userInput == "2"):
            os.system("vim .ytm3Links.txt")
        elif(userInput == "3"): # using youtube_dl (audio)
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
        else:
            if(userInput != "8"):
                invalidInput = True

if __name__ == "__main__":
    main()