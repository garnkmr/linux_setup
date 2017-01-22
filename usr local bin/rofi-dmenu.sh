#!/bin/sh

#cmd=$(printf "poweroff\nreboot\nsuspend\nlock\nkillX\n" | rofi -dmenu "Execute:" $*)

cmd=$(printf "Lock\nTerminal\nChrome\nFile Manager\nFile Search\nBrackets\nText Editor\nSoftware Manager\nDownload Manager\nTorrent Manager\n---------------\nReboot\nShutdown\n---------------" | rofi -dmenu -i -p "Execute : ")

if [ -z "$cmd" ]; then
	exit 0
fi

case "$cmd" in
	"Lock")
		xlock +usefirst ;;
	"Terminal")
		termite ;;
	"Chrome")
		chromium ;;
	"File Manager")
		rox ;;
	"File Search")
		fsearch ;;
	"Brackets")
		brackets ;;
	"Text Editor")
		mousepad ;;
	"Software Manager")
		pamac-manager ;;
	"Download Manager")
		uget-gtk ;;
	"Torrent Manager")
		transmission-gtk ;;
	"Reboot")
		reboot ;;
	"Shutdown")
		shutdown -h now ;;
	*)
		printf "Option not recognized: %s\n" "$cmd" >&2
esac
