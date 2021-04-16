#!/bin/bash

echo -n "Please enter a schedule date (four digits): "
read schedule1
schedule2=_Dealer_schedule
schedule=$schedule1$schedule2
echo -n "Please enter a time (##:00:00 followed by am/pm): "
read clock
answer=$(awk -F" " '{print $(1) $(2) " " $(5) " " $(6)}' $schedule | grep -i $clock)
echo "At $answer will be working."