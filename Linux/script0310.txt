#!/bin/bash

awk -F" " '{print $(1) $(2) " " $(5) " " $(6)}' 0310_Dealer_schedule| grep '05:00:00AM\|08:00:00\|02:00:00PM\|11:00:00PM'