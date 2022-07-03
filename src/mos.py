import subprocess
import os

def execute(cmd):
    proc = subprocess.Popen(str(cmd), shell=True, stdout=subprocess.PIPE,)
    output = proc.communicate()[0].decode("utf-8")
    return output.split("\n")

def processes(target):
    base_cmd = "pgrep -af"
    cmd = base_cmd + " " + str(target.replace(" ", ""))
    procs = execute(cmd)
    
    processes = []
    for line in procs:
        entry = {}
        if base_cmd not in line and len(line) > 0:
            tmp = line.split(" ")
            if len(tmp) > 1:
                entry["pid"] = tmp[0]
                entry["cmd"] = " ".join(tmp[1:])
                processes.append(entry)
    
    return processes

def os_move(previous, post):
    previous = str(previous).replace(" ", "")
    post = str(previous).replace(" ", "")
    if os.path.isdir(previous) or os.path.isfile(previous):
        if os.path.isdir(post) or os.path.isfile(post):
            if os.path.isdir(previous) and os.path.isfile(post):
                return -1
            cmd = "mv " + previous + " " + post
            os.system(cmd)
            return 0
    return -1

def vim_open_file(file_path):
    if os.path.isfile(str(file_path)):
        cmd = "vim " + str(file_path).replace(" ", "")
        os.system(cmd)
        return 0
    return -1

def clear_console():
    os.system("clear")

