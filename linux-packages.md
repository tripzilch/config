Packages
========

For DJO/SCN computers
---------------------

### 1. Extra repository sources toevoegen

Dit is de *makkelijkste* manier om **software** te kunnen installeren die niet in de default repositories staat. Voordeel is dat updates ook automatisch worden meegenomen (dit gebeurt niet als je zelf een .deb downloadt, van source compileert, of gewoon ergens een binary vandaan plukt).

Voor ffmpeg en nieuwere/betere versies van audiotools/libs.

    sudo add-apt-repository ppa:mc3man/trusty-media
    
Nieuwste InkScape versie. Veel betere performance.

    sudo add-apt-repository ppa:inkscape.dev/stable
    
Nieuwste Audacity versie (2.10b heeft oa betere noise redux, user interface, FX threading).

    sudo add-apt-repository ppa:ubuntuhandbook1/audacity

Nieuwste Darktable versie
    sudo add-apt-repository ppa:pmjdebruijn/darktable-release

### 2. Dan alles updaten

Dit is belangrijk om de nieuwste versie (en security-updates) te krijgen, die misschien niet meegenomen zijn in de Linux installer. Ook zorgt dit ervoor dat de index van bovenstaande extra repository sources worden ingeladen zodat de extra packages daarin beschikbaar komen.

    sudo apt-get update && sudo apt-get dist-upgrade -y
    
### 3. Packages en dingen installeren

Allerlei gaaf en nuttig spul:

    sudo apt-get install \
        vlc audacious \ # media players
        gimp inkscape audacity \ # multimedia editors
        firefox chromium-browser \ # internet browsers
        owncloud-client keepassx \ # other apps
        p7zip-full p7zip-rar ttf-mscorefonts-installer \ # cross-platform packages
        ffmpeg imagemagick pandoc swftools \ # media and format conversion
        python-pip python-matplotlib python-numpy python-scipy python-pygame \ # python
        ipython ipython-notebook ipython-qtconsole \ # ipython
        vim sublime-text qtcreator \ # code editors / IDEs
        gcc g++ build-essential \ # c++ build tools
        zsh terminator \ # shell, terminal 
        git git-core meld \ # git utilities & meld (graphical diff)
        espeak curl aria2 htop xclip cowsay # useful command line tools
        
    sudo pip install youtube-dl

without comments
    
    sudo apt-get install \
        vlc audacious \
        gimp inkscape audacity \
        firefox chromium-browser \
        owncloud-client keepassx \
        p7zip-full p7zip-rar ttf-mscorefonts-installer \
        ffmpeg imagemagick pandoc swftools \
        python-pip python-matplotlib python-numpy python-scipy python-pygame \
        ipython ipython-notebook ipython-qtconsole \
        vim sublime-text qtcreator \
        gcc g++ build-essential \
        zsh terminator \
        git git-core meld \
        espeak curl aria2 htop xclip cowsay    

### Meld instellen als default git diff applicatie
    git config --global diff.external meld
    
### zsh config (optional)

    sudo apt-get install -y zsh
    sudo chsh -s $(which zsh) <username>
   
    sudo -i
    NORMALUSER=gup
    for i in vimrc zshrc; do
      wget http://data.ion-box.org/trunk/files/$i -O /root/.$i
      cp -v /root/.$i /etc/skel/
      cp -v /root/.$i /home/$NORMALUSER/
      chown $NORMALUSER:$NORMALUSER /home/$NORMALUSER/.$i
    done

Of, als de voorkeur uit gaat naar grmlr's zsh:

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

### JACK/pulse config + troubleshooting:

https://wiki.archlinux.org/index.php/PulseAudio/Examples#PulseAudio_through_JACK

Personal Extras
---------------

    sudo apt-get install dropbox powertop redshift
    
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

First, add and sign the repositories:

    sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_14.10/ /' >> /etc/apt/sources.list.d/owncloud.list"
    wget http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_14.10/Release.key
    sudo apt-key add - < Release.key
    
Clean up the downloaded file:
    
    rm Release.key

Update and install owncloud:

    sudo apt-get update
    sudo apt-get install owncloud

Install MySQL, it will ask you for database root password:

    sudo apt-get install php5-mysql php5-gd mysql-server
    
Login to the MySQL database:

    mysql -u root -p

Create a database called clouddb:

    create database clouddb;

Allow “clouddbuser” to access the “clouddb” database on localhost with your password:

    grant all on clouddb.* to 'clouddbuser'@'localhost' identified by 'cloudjoggie';

Set default_charset to 'UTF-8':

    nano /etc/php5/apache2/php.ini
    (ctrl-W, search for 'default_charset', uncomment UTF-8 line)
    
Restart Apache, for good measure

    sudo service apache2 restart
    
TOT ZOVER    
    
---

http://linuxg.net/how-to-install-owncloud-5-on-ubuntu-13-04-and-linux-mint-14/
http://www.itzgeek.com/how-tos/linux/linux-mint-how-tos/install-owncloud-5-on-linux-mint-14.html

first link says

Now configure Apache:
Enable SSL (for encrypted connection) using these commands:

    sudo apt-get install openssl
    sudo a2enmod ssl
    sudo a2enmod rewrite

Now create self-signed certificate using this command:

    sudo mkdir -p /etc/apache2/ssl
    sudo openssl req -new -x509 -days 365 -nodes -out /etc/apache2/ssl/owncloud.pem -keyout /etc/apache2/ssl/owncloud.key
    
    
### DINGEN VAN JEFF

    CREATE USER '<GEBRUIKER>'@'localhost' IDENTIFIED BY '<WACHTWOORD>';
    CREATE DATABASE <DATABASENAAM> CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL PRIVILEGES ON <DATABASENAAM>.* TO '<GEBRUIKER>'@'localhost';
    FLUSH PRIVILEGES;

die utf8 is super belangrijk

also, als je een bestandje maakt in de home van een user (bijvoorbeeld voor root in /root/) genaamd .my.cnf en je zet daar het volgende in:

    [client]
    user=root
    password=64karakterlangsupersterkwachtwoord

en die chmod je even 600

Dan kan je daarna als root "mysql" intypen en ben je root user in de db

    cat /etc/network/interfaces
    # This file describes the network interfaces available on your system
    # and how to activate them. For more information, see interfaces(5).

    # The loopback network interface
    auto lo
    iface lo inet loopback

    # The primary network interface
    auto eth0
    iface eth0 inet static
     address 10.13.37.210
     netmask 255.255.255.0
     broadcast 10.13.37.255
     network 10.13.37.0
     gateway 10.13.37.1
     dns-nameservers 10.13.1.250
     dns-search scn.lan

en daarna even `sudo service network-manager restart` of gewoon `sudo reboot`.
