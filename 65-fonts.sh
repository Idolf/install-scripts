#!/bin/bash
. "$(dirname "$0")/util.sh"
prologue

require fontconfig fonts-noto fonts-noto-color-emoji fonts-noto-mono

cat << EOF | sudo tee /etc/fonts/conf.d/01-notosans.conf
<?xml version="1.0" ?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="scan">
    <test name="family">
      <string>Noto Color Emoji</string>
    </test>
    <edit name="scalable" mode="assign">
      <bool>true</bool>
    </edit>
  </match>

  <rejectfont>
    <pattern><patelt name="family"><string>Liberation Serif</string></patelt></pattern>
    <pattern><patelt name="family"><string>Liberation Sans</string></patelt></pattern>
    <pattern><patelt name="family"><string>Liberation Sans Narrow</string></patelt></pattern>
    <pattern><patelt name="family"><string>Liberation Mono</string></patelt></pattern>
  </rejectfont>

  <match target="pattern">
    <test name="family" qual="first" compare="contains">
      <string>symbola</string>
    </test>
    <edit mode="assign" name="color">
      <bool>true</bool>
    </edit>
    <edit mode="assign" name="family">
      <string>Noto Color Emoji</string>
    </edit>
  </match>

  <match target="pattern">
    <test name="family" qual="first" compare="contains">
      <string>emoji</string>
    </test>
    <edit mode="assign" name="color">
      <bool>true</bool>
    </edit>
    <edit mode="assign" name="family">
      <string>Noto Color Emoji</string>
    </edit>
  </match>

  <alias>
    <family>serif</family>
    <prefer>
      <family>Noto Serif</family>
    </prefer>
  </alias>

  <alias>
    <family>sans-serif</family>
    <prefer>
      <family>Noto Sans</family>
    </prefer>
  </alias>

  <alias>
    <family>sans</family>
    <prefer>
      <family>Noto Sans</family>
    </prefer>
  </alias>

  <alias>
    <family>monospace</family>
    <prefer>
      <family>Noto Mono</family>
    </prefer>
  </alias>

  <match>
    <test name="family"><string>Arial</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Noto Sans</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Helvetica</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Noto Sans</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Verdana</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Noto Sans</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Tahoma</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Noto Sans</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Comic Sans MS</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Noto Sans</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Times New Roman</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Noto Serif</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Times</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Noto Serif</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Courier</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Noto Mono</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Courier New</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Noto Mono</string>
    </edit>
  </match>

  <match target="pattern">
    <test name="family" qual="first" compare="contains">
      <string>emoji</string>
    </test>
    <edit mode="assign" name="color">
      <bool>true</bool>
    </edit>
    <edit mode="assign" name="family">
      <string>Noto Color Emoji</string>
    </edit>
  </match>
</fontconfig>
EOF

sudo fc-cache -f -v
epilogue
