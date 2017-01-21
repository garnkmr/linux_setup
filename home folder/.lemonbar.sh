#!/usr/bin/bash

Clock() {
        DATETIME=$(date "+%a %b %d, %r")
        echo -n "$DATETIME"
}

Battery() {
        BATPERC=$(upower -i $(upower -e | grep BAT) | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%//)
        BATSTATE=$(upower -i $(upower -e | grep BAT) | grep --color=never -E state|xargs|cut -d' ' -f2|sed s/%//)
        BATTIMELEFT=$(upower -i $(upower -e | grep BAT) | grep --color=never "time to *"|xargs| cut -d':' -f2)
        echo "$BATPERC % $BATSTATE $BATTIMELEFT left"
}

RAM() {
    USEDRAM=$(free -h |xargs| awk '{print $9}')
    FREERAM=$(free -h |xargs| awk '{print $10}')
    TOTALRAM=$(free -h |xargs| awk '{print $8}')
    echo "$USEDRAM / $FREERAM / $TOTALRAM"
}

Wifi() {
    WIFISTATE=$(nmcli | grep wlp3s0 |cut -d':' -f2)
    echo "$WIFISTATE"
}

Volume() {
    VOLUME=$(pactl list sinks | perl -000ne 'if(/#0/){/(Volume:.*)/; print "$1\n"}' | awk '{print $5}')
    echo "$VOLUME"
}

Brightness() {
    BRIGHTNESS=$(xbacklight | cut -d'.' -f1)
    echo "$BRIGHTNESS"
}

Groups() {
    echo "`ratpoison -c groups | awk '/*/ {print substr($1,3)}'`"
}

termite() {
    echo "%{A:Termite:} Terminal %{A} %{A:dde-file-manager:} Filer %{A}	"
}

cmustoggle() {
    echo "%{A:cmus-remote -u:} PlayPause %{A}"
}

#This loop will fill a buffer with our infos, and output it to stdout.
while :; do
    buf=""
    buf="${buf} %{c} $(Clock)"
    buf="${buf} %{r} Vol: $(Volume) | "
    buf="${buf} Brightness: $(Brightness) % | "
    buf="${buf} Battery: $(Battery)"
    buf="${buf} %{l} Workspace: $(Groups) | "
    buf="${buf} RAM: $(RAM) | "
    buf="${buf} Wifi: $(Wifi) "
    echo $buf
    
    sleep 1 # The HUD will be updated every second
done
