import json

class colors:
   PURPLE = '\033[95m'
   BLUE = '\033[94m'
   GREEN = '\033[92m'
   YELLOW = '\033[93m'
   RED = '\033[91m'
   UNDERLINE = '\033[4m'
   BOLD = '\033[1m'
   END = '\033[0m'

def print_list(data):
    for line in data:
        print(line)

def print_dict(data):
    for line in data:
        print(json.dumps(data, indent=4))

def print_it(data):
    if type(data) == list:
        print_list(data)
    elif type(data) == dict:
        print_dict(data)
    else:
        print(data)

def pick_option(message, options, emsg=None):
    if emsg == None:
        emsg = "Invalid Option Picked, Try Again!"
    emsg = str(emsg)
    
    print(message)
    print("OPTIONS:")
    for key in options:
        tmp = "  " + str(key)
        if options[key] != None or options[key] != "":
            tmp = tmp + ") " + str(options[key])
        print(tmp)
    
    while(True):
        choice = str(input("CHOICE: "))
        if choice in options:
            return choice
        print(emsg)

