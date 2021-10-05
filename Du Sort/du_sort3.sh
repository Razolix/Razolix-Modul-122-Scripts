#!/bin/bash
#
#Check if a Process is already running
#Author: Arnel Deomic
#Datum: 14.09.21

clear
echo "------------------------------------------------"
echo ""
echo "Bitte geben Sie den Prozess ein den Sie suchen!"
echo "------------------------------------------------"

#Input is a local variable

read input
if [ `ps -ef | grep ${input} | grep -v grep | wc -l` -eq 0 ];
  then
	echo ""
	echo " his process isn't running"
	else
	echo "This process is running"
fi