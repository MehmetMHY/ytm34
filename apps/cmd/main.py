# load python/pip-installed modules
import sys
import os

# create path and load local scripts/modules
SPATH = str(os.path.dirname(os.path.realpath(__file__)))

# load local scripts/modules
PATH = SPATH.split("/")
PATH = PATH[0:-1]
PATH.append("src")
PATH = "/".join(PATH)
if not os.path.isdir(PATH):
    sys.exit()
sys.path.insert(1, str(PATH))
import console
import files
import os
import yt

CONFIG = {
    "url_list_path": "/opt/url_list.txt",
    "shared_dir": "/home/"
}

if __name__ == "__main__":
    while(True):
        msg = "YTM34 Tool - Pick An Option"
        options = {
                "0": "Add YouTube To URL List",
                "1": "Edit YouTube URL List",
                "2": "YT-DLP Download Audio Only",
                "3": "YT-DLP Download Video Only",
                "4": "Clear Console",
                "5": "EXIST"
        }
        choice = console.pick_option(msg, options)

        # TODO: Add the rest of the code
        break



