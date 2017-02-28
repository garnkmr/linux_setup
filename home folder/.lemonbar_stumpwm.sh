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
    # FREERAM=$(free -h |xargs| awk '{print $10}')
    TOTALRAM=$(free -h |xargs| awk '{print $8}')
    echo "$USEDRAM / $TOTALRAM"
}

HDD() {
    ROOT_AVAIL=$(df -h | sed -n '4p' | awk {'print $2'})
    ROOT_USED=$(df -h | sed -n '4p' | awk {'print $3'})
    HOME_AVAIL=$(df -h | sed -n '8p' | awk {'print $2'})
    HOME_USED=$(df -h | sed -n '8p' | awk {'print $3'})
    echo "$ROOT_USED/$ROOT_AVAIL - $HOME_USED/$HOME_AVAIL"
}

Wifi() {
    WIFISTATE=$(nmcli | grep wlp3s0 |cut -d':' -f2 | sed -n '1p')
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

#This loop will fill a buffer with our infos, and output it to stdout.
while :; do
    buf=""
    buf="${buf} %{c} $(Clock)"
    buf="${buf} %{r} ♪ $(Volume)"
    buf="${buf} ◐ $(Brightness) %"
    buf="${buf} ♥ $(Battery)"
    buf="${buf} %{l} RAM: $(RAM) | "
    buf="${buf} ☱ $(HDD) | "
    buf="${buf} ◢ $(Wifi) "
    echo $buf
    
    sleep 1 # The HUD will be updated every second
done
