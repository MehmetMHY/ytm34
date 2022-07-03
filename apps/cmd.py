# load python/pip-installed modules
import sys
import os

# create path and load local scripts/modules
PATH = str(os.path.dirname(os.path.realpath(__file__)))
PATH = PATH.split("/")
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

