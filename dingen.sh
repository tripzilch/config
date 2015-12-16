#!/bin/sh

echo
echo ======== ADDING REPOESATROIS
echo
sudo add-apt-repository -y ppa:mc3man/trusty-media
sudo add-apt-repository -y ppa:inkscape.dev/stable
sudo add-apt-repository -y ppa:ubuntuhandbook1/audacity

echo
echo ======== UPDAETING EVERTHING EVERYWHERE FOREVER
echo
sudo apt-get update -y && sudo apt-get dist-upgrade -y

echo
echo ======== INSTALLING ALL THE THINGS
echo
sudo apt-get install -y \
    vlc audacious \
    gimp inkscape audacity \
    firefox chromium-browser \
    owncloud-client keepassx \
    p7zip-full p7zip-rar ttf-mscorefonts-installer \
    ffmpeg imagemagick pandoc swftools \
    python-pip python-matplotlib python-numpy python-scipy python-pygame \
    ipython ipython-notebook ipython-qtconsole \
    vim sublime-text \
    gcc g++ build-essential \
    zsh terminator \
    git git-core meld \
    espeak curl aria2 htop xclip cowsay    

echo
echo ======== ALSO YOUTUBE-DL
echo
sudo pip install youtube-dl

echo
echo ======== MAKING ZSH ZE SHELL
echo
sudo chsh -s $(which zsh) <username>
cd
wget -O .zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc

echo
echo ======== GET OWNCLOUD
echo
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_14.10/ /' >> /etc/apt/sources.list.d/owncloud.list"
wget http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_14.10/Release.key
sudo apt-key add - < Release.key
sudo apt-get update -y
sudo apt-get install -y owncloud
echo ======== YES OK
