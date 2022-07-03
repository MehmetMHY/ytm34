FROM python:latest

RUN apt update
RUN apt upgrade
RUN apt install -y vim
RUN apt install -y htop

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade yt-dlp

