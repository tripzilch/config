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
        curl aria2 htop xclip cowsay keepassx qtcreator sublime-text audacious
        
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
        redshift curl htop cowsay keepassx qtcreator sublime-text aria2 xclip
    
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
