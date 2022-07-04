# ytm34 - Command Line "App"
- Date: 7-4-2022

## About:
- This is the command line (none gui) verison of ytm34.
- The original ytm34 that used youtube_dl was only command line based.

## Requirements:
- Docker Verison:
    - Docker : https://www.docker.com/
    - OS : *ideally macos or a linux distro*
- None Docker Verison:
    - OS: *ideally macos or a linux distro*
    - Python3
    - Pip3:
        - virtualenv
        - yt-dlp

## Setup Python Env
***setting up a python env makes for the None-Docker verison***
1. Make sure to have all the requirements setup
2. Go to this repo's ytm34/apps/cmd/ directory
3. Build python env:
    ```
    python3 -m venv env
    ```
4. Activate python env:
    ```
    source env/bin/activate
    ```
5. Update pip:
    ```
    pip3 install --upgrade pip
    ```
6. Download yt-dlp:
    ```
    pip3 install yt-dlp
    ```
7. When done, deactivate python env:
    ```
    deactivate
    ```



