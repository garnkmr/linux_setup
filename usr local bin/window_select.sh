#!/usr/bin/env zsh

# Lets you switch between all windows in a way that minimizes keystrokes.
# The windows are listed in the order that you last visited them in.

# Yes, bash is really necessary, because it's version of printf makes this
# script possible.  Regular bourne shell printf does NOT.

( printf "ratmen -s dreary --background blue --foreground grey";
  ratpoison -c "windows %l %n %t" | while read w x z; do
      a=$(printf "%3q" $x); b="ratpoison -c \"select $x\"";
          printf " %q\\ %q %q"  "$a" "$z" "$b";
	    done; echo \;) | sh
