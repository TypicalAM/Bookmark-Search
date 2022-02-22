#!/bin/bash

ROFI_COMMAND="rofi -dmenu -i -p "Bookmarks" -theme ~/.config/rofi/launchers/colorful/default_no_icons.rasi"
SED_EXPRESSION='s/.*"title":"\([^"]*\)".*"uri":"\([^"]*\)".*/\1\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t[\2]/p'

echof() {
				local colorReset="\033[0m"
				local prefix="$1"
				local message="$2"

				case "$prefix" in
								header) msgpfx="[\e[1;95mG\e[m]" color="";;
								info) msgpfx="[\e[1;92m*\e[m]" color="";;
								error) msgpfx="[\e[1;91m!\e[m]" color="\033[0;31m";;
								*) msgpfx="" color="";;
				esac
				echo -e "$msgpfx $color$message $colorReset"
}

bmfind() {
        for bmdir in $(find ~/.mozilla/firefox -name bookmarkbackups); do
                bmfile=${bmdir}/$(ls -rt ${bmdir} | tail -1)
                grep -o '{[^}]*}' $bmfile |\
                        sed -n 's/.*"title":"\([^"]*\)".*"uri":"\([^"]*\)".*/\1\t\2/p'
        done | grep -i $1 | sort | uniq
}

bookmark_dir=$(find ~/.mozilla/firefox -name bookmarkbackups)
echof info "Trying to find bookmarks backup folder"
bookmark_file="$bookmark_dir/$(ls -rt $bookmark_dir| tail -1)"
echof info "Found file: $bookmark_file"

text_data="$(python3 $HOME/Scripts/Python/bks/main.py $bookmark_file)"
echof info "Displaying results"
options=$(echo $text_data | grep -o '{[^}]*}' | sed -n $SED_EXPRESSION)
chosen=$(echo -e "$options"|$ROFI_COMMAND|awk -F'[][]' '{print $2}')
echof info "Opening the link"
[ -z "$chosen" ] || firefox "$chosen"
