#!/bin/bash

#This is the script to be run to function as the answer for the bonus

read -p "Enter a time (##:00:00am/pm): " time1
./Bonus_Step1.sh | grep -i $time1