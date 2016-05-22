Linux config notities
=================================================

Dit document bevat aantekeningen, spiekbriefjes en notities voor Linux op de desktop. Het is bedoeld voor Linux Mint, Ubuntu en andere distros die daar voldoende op lijken.

Initieel bedoeld om een computer met frisse Linux install eenvoudig en snel te voorzien van nuttige software en configuratie, voor gebruik op [DJO](http://djog.nl). Bij [SCN](http://stichting-scn.nl/) gebruiken we een slimmere methode met een kant-en-klare image. Ondertussen bevat het ook algemenere aantekeningen en tips

1. Extra repository sources toevoegen
-------------------------------------------------

Dit is de makkelijkste manier om software te kunnen installeren die niet in de default repositories staat. Voordeel is dat updates ook automatisch worden meegenomen (dit gebeurt niet als je zelf een .deb downloadt, van source compileert, of een binary ergens vandaan plukt).

Nadeel is wel weer dat je moet opletten of dit altijd nog wel nuttig is om te doen (heen-en-weer-getrek tussen ffmpeg en avconv is ook iedere maand anders).

En ook of deze specifieke extra repos nog steeds de meest recente versie trekken en compileren en niet gestopt zijn.

#### ffmpeg

    sudo add-apt-repository ppa:mc3man/trusty-media

#### inkscape

    sudo add-apt-repository ppa:inkscape.dev/stable

#### audacity

    sudo add-apt-repository ppa:ubuntuhandbook1/audacity

2. Dan alles updaten
-------------------------------------------------

Dit is belangrijk om de nieuwste versie (en security-updates) te krijgen, die misschien niet meegenomen zijn in de Linux installer. Ook haal je hiermee de indexes van bovenstaande extra repository sources binnen, zodat de extra packages daarin beschikbaar komen.

    sudo apt-get update && sudo apt-get dist-upgrade -y

3. Packages en dingen installeren
-------------------------------------------------

Allerlei gaaf en nuttig spul:

    sudo apt-get install \
        vlc mpv audacious \
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

    sudo pip install youtube-dl

*Note:* youtube-dl is capable of much more than just downloading video from Youtube. For example SoundCloud, Vimeo, embedded videos, uitzendinggemist.nl, really almost anything. Just try it. In order to keep up with all these changing sites and different sources, it updates a few times a week. If you installed youtube-dl via pip, use this command to update to the most recent version:

    sudo -H pip install --upgrade youtube-dl

4. Configure all the things
-------------------------------------------------

### Firefox Browser

Why I prefer Firefox over Chrome:

 * superior address bar ("awesome bar") searches bookmarks and history. Chrome only displays 5 results (and isn't very clever which ones to pick either)
 * tags in bookmarks
 * less hiding of privacy features
 * Android: unlike Chrome, Firefox Android supports Add-ons. Firefox Sync helps syncing bookmarks and tabs between desktop and mobile. I consider Firefox Sync to be a relatively good deal, privacy-wise, if you're going to use a 3rd party sync solution: it is not linked to either Google+ or Facebook, but it's also not owned by a small-time startup (when US companies die, data assets will be sold off without the privacy policy, not even joking and still my sides hurt ...)

#### Add-ons

  * [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/). Adblocker.
  * [Ghostery](https://addons.mozilla.org/en-US/firefox/addon/ghostery/). Block trackers, third party bloat, improve pageloading time, memory usage.
  * [I don't care about cookies](https://addons.mozilla.org/en-US/firefox/addon/i-dont-care-about-cookies/). Deletes stupid EU cookie warnings.

#### Bookmarklets

Add these to the Bookmark Toolbar. Consider installing [Bookmark Shortcut Keys Add-on](https://addons.mozilla.org/en-US/firefox/addon/bookmark-shortcut-keys/) for extra ++useful.

  * `FIXEDFIXER` -- kills `position:fixed` floaters

        javascript:Array.forEach(document.getElementsByTagName('*'),%20function%20FIX(e){%20if%20(getComputedStyle(e).position%20==%20'fixed')%20e.style.position='static';})

  * `NEXT ➔` -- guesses most probable link to "next page", and clicks it (good ol' Opera ...)

        javascript:['a[rel=next]','a.next','a[class*=next]','a[title*=next]','.next>a','[class*=next]>a'].find(function(v){var%20e=document.querySelector(v);if(e){e.click();return%201}else%20return%200});

Of course don't forget to delete the useless bundled bookmarks. In fact, why not open bookmarks manager on first start, ctrl-A and delete all. Then import your bookmarks from previous browser.

#### Other Firefox config

Disable smooth scrolling. `ctrl-L`, `about:config`, search "smoothscroll", set to `false`. Or via preferences, advanced, general, smooth scrolling. Even on a very fast machine, it still adds unnecessary jank and ghosted blurs on most monitors, so give it a try.

Set DuckDuckGo as default search. Delete Amazon & such.

Consider turning off search suggestions to improve privacy and unwanted suggestions. Firefox's address-bar search functionality (aka "awesome bar") is very powerful (esp. w.r.t. Chrome's) in searching your history and bookmarks, making 3rd party search suggestions unnecessary. For superior results, use DuckDuckGo's !bang syntax and learn the habit of bookmarking anything semi-useful (always adding a few keywords to the title, description or tags).

Set homepage to about:blank

Startup: tabs from last time

Preferences, privacy, "Keep cookies until I close Firefox" (aka "throw away on exit"). Add exceptions for the three or four sites you'd like to stay logged on to (e.g. reddit, HN, github, grindr). ONLY log on to big social networks (Facebook, Google, etc) in a Private Window and learn to use KeePassX. Same goes for webmail, online banking, DigID, etc. Use KeePassX. If these sites have a password you can remember, it's either too simple or it has been the same for more than a year and you're doing it wrong.

Remove useless GUI elements from toolbar: Home button, Search box, Pocket, etc. My toolbar looks like:

    ADDRESS/AWESOME BAR - BOOKMARKS TOOLBAR - NoScript/Ghostery/uBlock BUTTONS - DOWNLOADS - MENU BUTTON

The address bar shows BACK/FORWARD and STOP/RELOAD buttons when applicable. Click and hold BACK/FORWARD buttons to show drop-down of browsing history for that tab.

### SublimeText text/code editor

Try ctrl+shift+P, "install package". If not work, install [Package Control](https://packagecontrol.io/installation). Then go get some packages, suggestions:

  * AllAutocomplete. Autocompletes stuff from all open files instead of just the current one.
  * ColorSchemeSelector. There are many colour schemes to choose from. But switching and trying out all of them to see which you like best is a bit of a hassle. This package makes that a bit quicker.
  * [SideBarEnhancements](https://packagecontrol.io/packages/SideBarEnhancements). If you have folders/files in the sidebar, this adds some features to the right-click menu that you would expect to already be there (open with, new folder, rename, delete, etc).
  * SyncedSidebarBg. For some reason the sidebar's background doesn't always adjust to your colour scheme. This fixes that. You might need to hide/unhide the sidebar for it to take effect.
  * WordCount. Show wordcount, charcount, linecount in statusbar. Mystifies me how this is not a default Sublime feature.

Tweak other settings. Ga naar `Preferences > Settings - User` en voeg de volgende regel(s) toe tussen de curly brackets:

    "scroll_speed": 0.0

Vergeet niet te saven (ctrl-S).

### Tweak Desktop Environment / Window Manager

Global **keyboard shortcuts!** In MATE, go to `System > Preferences > Keyboard Shortcuts`, but most DE will have this. Remember the "Windows-key" is called `Super` or sometimes `Mod4` on Linux. It's a great modifier for global keyboard shortcuts because not many applications use it. Here's some more ideas (but only bother if you'll actually use them).

Both `Ctrl+Alt+T` and `Super+T` should open a terminal in some way (at least one of them probably already does, by default).

Set `Super+Up` to maximize the window vertically and `Super+Right` to maximize horizontally.

Test and make a note what are the shortcuts for "Move window" and "Resize window" (I left them at the defaults, which was `alt+F7` and `alt-F8`). This will come in handy one day for sure when one of your windows acts up totally wonky.

Test `Alt+mousedrag` or `Super+mousedrag` (anywhere) on a window. One of the two should drag the window around, even if you grab it somewhere other than the title bar. If not, jump to the settings or search online and make it happen.

`Ctrl-L` is a very useful shortcut that works in many different dialogs and applications. It focuses and places the cursor in the Address or Location Bar, so you can type an url or file path (often with autocomplete). It often works even if there is no Location Bar, instead a path made of "breadcrumb trail" buttons, press `ctrl-L` and it'll change to a proper text input Location bar. Works in most Open/Save dialogs, File Explorers, Browsers, etc. Occasionally if it's not `ctrl-L`, it might be F6 (which *toggles* focus between Address Bar and webpage in Firefox).

I like to key `Alt+Super+2`/`3`/`5`/`6`/`0` to the commands `redshift -O2300`/`-O3400`/`-O5200`/`-O6500` and `redshift -x` to quickly adjust the colour temperature of my screen.

Set your **Compose key!** This is so much more useful than the "International Keyboard" option offered on other OSes. In MATE, go to `System > Preferences > Keyboard > Layouts > Options... > Position of Compose key`. Set it to `Pause`. When was the last time you used `Pause`? Yeah. Now you can do `Pause`, `c`, `=` top produce `€`. Or `Pause`, `e`, `"` to produce `ë`. Many intuitive defaults are preconfigured and you can pretty much guess the combo to produce some character (multiple "obvious" combos are mapped to the same glyph). See [here](http://fsymbols.com/keyboard/linux/compose/) and [here](http://makandracards.com/makandra/1030-insert-an-ndash-and-other-special-characters-using-the-compose-key-on-linux) for more info or if you can't find the option on your DE of choice.

### zsh configuration

If you don't use the terminal very often, get zsh anyway. At worst you'll never notice the difference.

#### Easy Mode

Change your default shell to zsh

    sudo chsh -s $(which zsh) $USER

Grab grml's zsh config, which is feature-rich and has good defaults:

    cd
    wget -O .zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc

#### SCN Elite Mode (TM)

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

#### shell performance

It is possible that too much scripting and autocomplete in your shell weighs heavy on a low-powered machine. Pay attention to delays in your terminal, in particular: Startup time, tab/autocomplete, typing in general, `echo "test"` and other commands that should run instantly. If you're not sure, `sudo chsh -s $(which bash) $USER` back to bash, try closing & opening a terminal, autocomplete stuff (try for both a folder with a small and large amount of files), typing some commands, try if it feels different or smoother.

If that's the case, first try and compare zsh without the grml config (just `rm ~/.zshrc`). Then maybe try oh-my-zsh instead of grml (future updates of this manual may include more info about oh-my-zsh). If it turns out even clean zsh is too sluggish, there's [many other shells](http://hyperpolyglot.org/unix-shells) to try. Or bash is fine too. Remember that even in default bash, `ctrl+R` does incremental backwards search of your command history, a feature that can often make up for the lack of many others :)

Processing
-------------------------------------------------

[Download](https://processing.org/download/?processing) & install Processing

[Configure SublimeText to use Processing](https://packagecontrol.io/packages/Processing)

Other tools?

Add [Processing Reference](https://processing.org/reference/) to bookmarks

JACK
-------------------------------------------------

Basis JACK + nuttige tools:

    sudo apt-get install jackd qjackctl patchage vlc-plugin-jack pulseaudio-module-jack jack-rack

Het is handig om even te checken of QjackCtl automatisch opstart als je computer is opgestart (menu > `System` > `Preferences` > `Startup Applications`).

### JACK troubleshooting / info

Meestal werkt JACK voor het grootste deel gewoon prima. Soms moet je even in het desbetreffende programma JACK selecteren als audio device.

De `vlc-plugin-jack` package wordt VLC blij van.

Wat wel vaak problematisch is, is om PulseAudio aan de praat te krijgen onder JACK. Het is handig om een beetje idee te hebben hoe dit in elkaar steekt. Voordat je JACK installeert werkt audio in default Ubuntu en Linux Mint installs als volgt:

Het begint met [ALSA](https://en.wikipedia.org/wiki/Advanced_Linux_Sound_Architecture), dat is de driver voor je soundcard, diep in de Linux kernel. Zonder ALSA is er geen geluid. ALSA detecteert ook welke input en output devices er in je systeem zitten, dat lijstje kan je oa zien in `QjackCtl`, onder het knopje `Setup ...` en dan de `>` knopjes naast "Input Device" en "Output Device". Dit is nuttig om te checken want ALSA ziet bijvoorbeeld ook je HDMI-monitor als een output-device (zelfs als er geen speakers in je monitor zitten), en ik heb zelfs mijn Novation Launchkey MIDI keyboard er eens tussen zien staan (wat echt helemaal nergens op slaat maar goed). Je wil natuurlijk de geluidskaart selecteren waar je speakers op zijn aangesloten (gewoon uitproberen).

Wat ALSA niet kan, is als meerdere programma's geluid willen spelen op hetzelfde output device. Dat geluid moet door elkaar gemixt worden tot een audiosignaal. Dat doet ALSA niet, en dat is waar PulseAudio om de hoek komt kijken. De verschillende programma's sturen hun audiosignaal naar PulseAudio, die mixt de boel samen, en geeft dat dan aan ALSA zodat je het uit je speakers hoort. Tot zover gaat het gewoon goed, geluid werkt meestal gelijk prima als je Ubuntu of Mint installeert.

En dan installeer je JACK. JACK wil ook direct met ALSA praten, dus dan is er geen ruimte meer voor PulseAudio. En in principe heb je PulseAudio gewoon niet meer nodig want JACK kan alles, audio mixen, en meer. Helaas, willen om de een of andere reden webbrowsers (Firefox, Chromium) en hun plugins (Flash) hun geluid *per se* door PulseAudio spelen en anders niet. Stom!

Om deze reden installeer je de package `pulseaudio-module-jack`. Hiermee wordt PulseAudio een module die *onder* JACK hangt (die weer onder ALSA hangt), de programma's die per se met PulseAudio willen praten kunnen dan met die module praten, die zie je soms staan als de "PulseAudio JACK Sink". JACK mixt dan alles wat via de PulseAudio JACK Sink binnenkomt samen met de rest van de audio, stuurt dat naar ALSA, en klaar.

Dit is hoe het zou *moeten* werken. Alleen dit gaat niet altijd goed. En dan heb je geen geluid in YouTube, bijvoorbeeld. Wat ook wel gebeurt is als je laptop in hibernate/sleep mode is gegaan, dat bij het opnieuw aan gaan de verbinding tussen PulseAudio en JACK kwijtraakt of mis gaat.

Hoe je dit optimaal moet fixen dat het gewoon werkt weet ik nog niet precies want om de zoveel tijd krijgen JACK en PulseAudio bij mij ook weer ruzie. Een paar dingen die mogelijk een oplossing kunnen zijn:

* Check de [ArchLinux Wiki](https://wiki.archlinux.org/index.php/PulseAudio/Examples#PulseAudio_through_JACK) (deze wiki is sowieso heel nuttig voor veel Linux systeem-dingen, en vaak ook relevant voor andere Linuxen die niet Arch zijn zoals Ubuntu of Mint).

  Ik heb vooral succes gehad met "The new way" ipv "The new new way" (de tweede dus). Maar probeer vooral wat uit.

* *Turning it off and on again.*

  Je kan JACK uit en aan zetten mbv de Stop en Start knopjes in QjackCtl. Werkt vaak erg goed als PulseAudio in de war is geraakt omdat je laptop in hibernate/sleep is geweest.

  Je kan PulseAudio ook uit en aan zetten, dan typ je in de terminal: `pulseaudio -k`. Hoeft geen `sudo` bij. This kills the PulseAudio daemon. En die start dan automatisch na een seconde of twee weer op en gaat dan op zoek naar JACK.

  Wat misschien kan helpen is verschillende combinaties en volgordes proberen, eerst JACK uit, dan PulseAudio doodmaken, dan gauw JACK weer aan voordat PulseAudio terug is, of juist even wachten, of andersom, etcetera.

  Soms moet je ook je hele browser eerst uit en aan zetten voordat het weer werkt. Soms is het voldoende om alleen de pagina met YouTube te reloaden.

* Als alles verder faalt, is het natuurlijk ook een optie om JACK gewoon uit te zetten. In dat geval kan PulseAudio weer direct met ALSA praten en dat gaat meestal goed. Misschien moet je nog even `pulseaudio -k` doen nadat je JACK uit hebt gezet om zeg maar te refreshen, in mijn ervaring is dat echter niet nodig. Nu heb je als het goed is weer geluid in je browser. Als je dan Renoise wilt gebruiken of een ander programma dat beter werkt met JACK, zet je JACK eerst weer aan, en dan start je Renoise op (of je drukt op het `Reinitialize` knopje in Renoise audio preferences).

  Als je JACK uit hebt staan, en je start Renoise, dan pakt Renoise ALSA direct. Wat dus betekent dat PulseAudio niet bij ALSA kan. Dus als je JACK uit hebt, en je hebt nog steeds geen geluid in je browser. Renoise afsluiten, nog een keer proberen. Misschien nog even je browser afsluiten, `pulseaudio -k`, paar seconden wachten, browser aan.

  Als je voor deze laatste optie gaat, is het handig om even bij je Linux startmenu > `System` > `Preferences` > `Startup Applications` te kijken en QjackCtl uit te zetten (als die er tussen staat). Dan start QjackCtl niet op bij het opstarten en begin je gewoon met ALSA+PulseAudio zonder JACK, en kan je zelf JACK aanzetten wanneer je wilt (QjackCtl staat in het startmenu bij `Sound & Video`).

THE REST
=================================================

From here follows ran dom snip pets that I'm not 100% sure are up to date or correct.

Various optional packages
-------------------------------------------------

Blender is not only for 3D-modeling, but also has powerful video editing tools.

    sudo apt-get install blender

Powertop is a terminal-based tool like htop (CPU usage / processes), but instead shows (and allows to tweak) battery usage. Useful for laptops with working batteries.

    sudo apt-get install powertop

Dropbox is dropbox. Useful for storing keepass.kdb

    sudo apt-get install dropbox

Yay for `ipython qtconsole --pylab`!

    sudo apt-get install python-matplotlib python-numpy python-scipy python-pygame ipython ipython-notebook ipython-qtconsole python-pip

Dropbox
-------------------------------------------------

#### Per user

    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -

then run manually to create connect and ~/Dropbox dir etc:

    ~/.dropbox-dist/dropbox

#### Init.d

Get script from https://gist.github.com/861875 and place into /etc/init.d/dropbox, then (sudo):

    groupadd dropbox
    usermod -aG dropbox root
    chmod +x /etc/init.d/dropbox
    update-rc.d dropbox defaults

Then reboot etc.

Owncloud
-------------------------------------------------

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

### QtCreator

http://www.qt.io/download-open-source/

Gebruik de Qt online installer, dan krijg je ook de docs en nuttige examples. Je moet de installer nog een executable flag geven (Properties menu, of `chmod +x ~/Downloads/qt-<TAB>` in command line). Je kan de stap om een account te maken gewoon overslaan (Next).

### Meld instellen als default git diff applicatie
    git config --global diff.external meld

