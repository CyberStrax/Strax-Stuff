#!/bin/bash

#This script's function is to feed the schedule and game into the Bonus_Answer.sh script

read -p "Please enter date (four digits): " filename1
filename2=_Dealer_schedule
filename=$filename1$filename2
read -p "Please enter game (g1=Blackjack g2=Roulette g3=TexasHoldEM): " game
if [ $game == "g1" ]; then
	Dealer= awk -F " " '{print $1$2,$3,$4}' $filename
elif [ $game == "g2" ]; then
	Dealer= awk -F " " '{print $1$2,$5,$6}' $filename
elif [ $game == "g3" ]; then
	Dealer= awk -F " " '{print $1$2,$7,$8}' $filename
else 
	echo "not vaild entry"
	exit
fi
echo $Dealer



