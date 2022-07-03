import json

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

