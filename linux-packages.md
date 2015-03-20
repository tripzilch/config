Packages
========

For DJO/SCN computers
---------------------

### eerst alles updaten

    sudo apt-get update && sudo apt-get dist-upgrade -y
    
### packages en dingen installeren    

    sudo apt-get install \
        zsh \
        vim terminator vlc p7zip-full p7zip-rar \
        imagemagick python-matplotlib python-numpy python-scipy python-pygame \
        ipython ipython-notebook ipython-qtconsole \
        python-pip gimp inkscape chromium-browser gcc g++ build-essential \
        swftools audacity espeak ttf-mscorefonts-installer \
        curl aria2 htop cowsay keepassx qtcreator sublime-text audacious 
        
    sudo pip install youtube-dl
    
### zsh config (optional)

    which zsh
    chsh
    
    cd
    wget -O .zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc         
    
Also, see [Kyentei's repo](https://github.com/kyentei/configs) for zshrc, jackd info, among other things.
     
### just ipython+pylab special:     

    sudo apt-get install python-matplotlib python-numpy python-scipy python-pygame ipython ipython-notebook ipython-qtconsole python-pip

Optional packages
-----------------

    sudo apt-get install blender 
    
    sudo apt-get install powertop gtk-redshift

    sudo apt-get install jackd qjackctl patchage vlc-plugin-jack pulseaudio-module-jack --install-suggests

### JACK/pulse troubleshooting:

https://wiki.archlinux.org/index.php/PulseAudio/Examples#PulseAudio_through_JACK

Personal
--------

    sudo apt-get install vim terminator vlc p7zip-full p7zip-rar imagemagick \
        python-matplotlib python-numpy python-scipy python-pygame python-opencv \
        ipython  ipython-qtconsole ipython-notebook python-tk spyder gimp inkscape \
        chromium-browser gcc g++ build-essential swftools audacity espeak \
        python-pip zsh ttf-mscorefonts-installer dropbox audacious powertop \
        redshift curl htop cowsay keepassx qtcreator sublime-text aria2
    
    sudo pip install youtube-dl

    sudo apt-get install jackd qjackctl patchage vlc-plugin-jack pulseaudio-module-jack --install-suggests

Dropbox
=======

Per user
--------

    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -

then run manually to create connect and ~/Dropbox dir etc:

    ~/.dropbox-dist/dropbox

Init.d
------

Get script from https://gist.github.com/861875 and place into /etc/init.d/dropbox, then (sudo):

    groupadd dropbox
    usermod -aG dropbox root
    chmod +x /etc/init.d/dropbox
    update-rc.d dropbox defaults

Then reboot etc.

Owncloud
========

    sudo apt-get install apache2 php5 php5-mysql php5-gd mysql-server

    sudo add-apt-repository ppa:noobslab/apps
    sudo apt-get update
    sudo apt-get install owncloud



