# SCN clone PC image notes ideas

- address bar firefox, default search DDG, smoothscroll uit
- uBlock Origin, disconnect.me, I don't care about cookies

- check default filetype associations: png,jpg,pdf,txt,sh,svg,zip/gz/xz/7z/bz/tar,wav

- default terminal terminator

- Eclipse, Android Studio

- make sure if you mount ssh as a network drive sshfs, open/save also works with sublime (`sshfs`?)

hoe nuttig is een alias `rm to `rm --one-file-system`? of eigenlijk, is er een reden om die niet default aan te hebben :)
of https://launchpad.net/safe-rm ?

- tableflip emoticon for zsh error

    (╯°□°）╯︵ ┻━┻

## IPython / Jupyter / qtconsole / matplotlib numpy scipy

Best way to get these running? Apt, pip or anaconda?

## GIMP

- niet single window mode,
- keyboard shortcuts dynamic, no save on exit

  * `ctrl-alt-V` paste as new layer
  * `ctrl-shift-G` grow
  * `ctrl-shift-S` shrink
  * `i` colors > invert

  save keyboard shortcuts now

## Processing

[Processing Download](https://processing.org/download/?processing)

## Sublime text

- Settings - User

        "animation_enabled": false,
        "auto_complete_delay": 200,
        "caret_extra_bottom": 1,
        "caret_extra_top": 1,
        "caret_extra_width": 1,
        "caret_style": "solid",
        "enable_telemetry": "disabled", // wtf wtf wtf
        "find_selected_text": true,
        "font_size": 14,
        "highlight_line": true,
        "highlight_modified_tabs": true,
        "rulers": [ 79 ],
        "scroll_speed": 0.0,
        "show_encoding": true,
        "translate_tabs_to_spaces": true,

        // maybe?
        "ensure_newline_at_eof_on_save": true,
        "trim_trailing_white_space_on_save": true

- [packagecontrol.io/installation](https://packagecontrol.io/installation)

    `ctrl-shift-P`, `adv install package` to multi-install packages:

    SyncedSidebarBg, SideBarEnhancements, Processing, Emmet, HTMLBeautify, WordCount

- config [Processing sublime plugin](https://packagecontrol.io/packages/Processing) (zie webpage onder kopje "Linux")

    * set PATH to where your processing application is located, e.g.: `export PATH=$PATH:/opt/processing/processing-2.0b4` in .profile
    * create an alias for processing-java in /bin/ instead of /usr/bin/, e.g.: `sudo ln -s /opt/processing/processing-java /bin/processing-java`
    * test code, save as `Test/Test.pde` (needs to be in folder), `ctrl-B` to build

        void setup() {
            size(200,200);
            background(0);
            noStroke();
        }

        void draw() {
            fill((-frameCount%2)&255);
            rect(random(175),random(175),25,25);
        }

