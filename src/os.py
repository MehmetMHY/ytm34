import subprocess

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

