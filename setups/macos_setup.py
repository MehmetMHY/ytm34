import webbrowser
import sys

# class of download links to help with setting up ytm34
class links:

    # CREDIT:   I would like to give credit to the authors of all the sources (links) used for this,
    #           script. Please checkout the links below!

    ytm34_tool_link = "https://github.com/MehmetMHY/ytm34/blob/master/tool.sh"

    xcode_link = "https://apps.apple.com/us/app/xcode/id497799835?mt=12"
    brew_link = "https://brew.sh/"

    brew_py_link = "https://formulae.brew.sh/formula/python@3.8"

    brew_ff_link = "https://formulae.brew.sh/formula/ffmpeg"

    ytm34_link = "https://github.com/MehmetMHY/ytm34"

    virtualenv_link_git = "https://gist.github.com/pandafulmanda/730a9355e088a9970b18275cb9eadef3"
    virtualenv_link = "https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/"

    learn_rc_link = "https://medium.com/@rajsek/zsh-bash-startup-files-loading-order-bashrc-zshrc-etc-e30045652f2e"

# function for opening, or not, links and handling input validation
def open_link(c, learn, name, link):

    if(learn == True):
        question = str(c) + ") Open " + str(name) + " source to learn material (y/n)? "
    else:
        question = str(c) + ") Open " + str(name) + " download link (y/n)? "

    while(True):
        tmp = input(question)
        tmp = str(tmp.lower())
        if(tmp == "y"):
            webbrowser.open(link)
            wait_tmp = input("[ENTER TO CONTINUE]")
            break
        elif(tmp == "n"):
            break
        else:
            print("Invalid Input! Excepted Inputs: 'y' or 'n' \n")

# main function
if __name__ == "__main__":

    # array of content needed to setup YTM34 for MacOS
    contents = [
        ["Xcode", links.xcode_link, False],
        ["HomeBrew", links.brew_link, False],
        ["Python@3.8 [brew]", links.brew_py_link, False],
        ["ffmpeg [brew]", links.brew_ff_link, False],
        ["Python VirtualEnv [pip]", links.virtualenv_link_git, False],
        ["Python VirtualEnv (if ↑ failed, otherwise skip)", links.virtualenv_link, True],
        [".bashrc and .zshrc related", links.learn_rc_link, True],
        ["ytm34 tool.sh script", links.ytm34_tool_link, True]
    ]

    # print and open everything, one by one, to setup everything
    try:
        print("Setup YTM34 For MacOS \n")

        print("*For MacOS, we will open some links for downloading,")
        print(" certain software, sense MacOS does not have a default,")
        print(" package manager like Ubuntu. \n")

        c = 1
        for content in contents:
            software_name = content[0]
            software_link = content[1]
            learn = content[2]
            open_link(c, learn, software_name, software_link)
            c = c + 1
            print()

        # this message is hard coded, but it does the job
        print("^-Uses the tool.sh in ytm34 to finish setting up ytm34! \n")

    # close Python script if CTRL-C is detected
    except KeyboardInterrupt:
        sys.exit()
