#!/bin/bash

#Simple Alarm clock script

if [[ -z $1 ]];then
	echo -e "\n\t Usage ./Alarm.sh 8h for 8 hours of sleep"
	echo -e "\t\t./Alarm.sh 20m for 20 minutes of sleef"
	echo -e "\t\t See man sleep\n"
	exit 0
fi

sleep "$1";
figlet "sleep time over"

alarm=(
	"alarm1.mp3"
	"alarm2.mp3"
	"alarm3.mp3"
	"alarm4.mp3"
	"alarm5.mp3"
)

for ((i=0; i<${#alarm[@]}; i++));do
	figlet -f slant "Wake up-$((i+1))"
	sleep1; mpv --no-audio-display --no-resume-playback "${alarm[i]}" &
	sleep45; killall mpv
	sleep 5m;
done

