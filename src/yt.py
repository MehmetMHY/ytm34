def remove_playlist(url):
    tmp = url.split("&")
    if len(tmp) > 0:
        return tmp[0]
    return url

def remove_backslash(url):
    url = url.replace("\\", "")
    return url

# https://write.corbpie.com/downloading-youtube-videos-as-audio-with-yt-dlp/
def ytdlp_audio_cmd(url):
    cmd = "yt-dlp -f 'ba' -x --audio-format mp3 " + str(url) + " -o '%(id)s.%(ext)s'"
    return cmd

def ytdlp_video_cmd(url):
    cmd = "yt-dlp " + str(url)
    return cmd

def make_exe_script(urls, option):
    option = str(option)
    if option != "audio" and option != "video":
        return None
    
    lines = []
    for url in urls:
        cmd = ""
        if option == "audio":
            cmd = ytdlp_audio_cmd(url)
        elif option == "video":
            cmd = ytdlp_video_cmd(url)
        cmd = cmd + " &"

        lines.append(cmd)
        lines.append("echo $!")
        lines.append('echo "' + str(url) + "'")
        lines.append("")

    return lines
