echo "Packages That Will Be Installed:"
echo "  - APT:"
echo "      - python3-pip"
echo "      - python3-virtualenv"
echo "      - vim"
echo "      - ffmpeg"
echo "  - PIP:"
echo "      - virtualenv"
echo "  - SNAP:"
echo "      - vlc"
echo
read -p "Continue (CTRL-C to exit or ENTER to Continue)? " tmp

sudo apt install python3-pip

pip3 install virtualenv
sudo apt install python3-virtualenv

sudo apt install vim

sudo apt install ffmpeg

sudo snap install vlc


