#!/bin/bash

cmd=$(printf "Default Workspace\nWorkspace 2\nWorkspace 3\nWorkspace 4\nWorkspace 5" | rofi -dmenu -i -p "Switch to Workspace : " )

if [ -z "$cmd" ]; then
	exit 0
fi

case "$cmd" in
	"Default Workspace")
		ratpoison -c "exec rpws 1" ;;
	"Workspace 2")
		ratpoison -c "exec rpws 2" ;;
	"Workspace 3")
		ratpoison -c "exec rpws 3" ;;
	"Workspace 4")
		ratpoison -c "exec rpws 4" ;;
	"Workspace 5")
		ratpoison -c "exec rpws 5" ;;
	*)
		printf "Option not gud : %s\n" "$cmd" >&2
esac	

