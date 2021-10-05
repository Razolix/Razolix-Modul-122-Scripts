#!/bin/bash
#
# Name: zahlenraten.sh
# ---------------------------------------------------------------------------------
# SYNOPSIS: zahlenraten.sh
# Ausgeführt in Git Bash (Ubuntu) Konsole
#
# Description: Dieses Skript ist ein kleines Spiel. Es wird eine Zahl zwischen
# 1 - 20 generiert und Sie müssen diese erraten.
#
# Ablauf:
# Zahl generieren (random)
# Versuche ausgeben und überprüfen
# Zahl lesen des Spielers (read)
# Überprüfung ob Zahl nicht Buchstabe
# While bis Zahl erraten wird (until)
# Im While if ob Zahl gleich (if)
# Wenn nicht, Abfrage ob grösser oder kleiner als generierte Zahl (if) Versuche -1
# Ausgabe (exit) wenn verloren
# Ausgabe (exit) wenn gewonnen
#
# Autoren: Arnel Deomic
# Datum: 05.10.2021

reNumbers='^[0-9]+$'
randomNumber=$[$RANDOM %20 + 1]
tries=5

echo "$randomNumber"
echo "Bitte geben Sie eine Zahl zwischen 1 und 20 ein:"

until [[ $randomNumber -eq $playerNumber ]]; do
  if [[ $tries -gt 0 ]]; then
    echo "----------------------------------------------------------"
    echo "Versuche: $tries"
    read playerNumber
    if [[ $playerNumber =~ $reNumbers ]] ; then
      if [[ $randomNumber -eq $playerNumber ]]; then
          echo "Sie haben die Zahl erraten!"

       elif [[ $randomNumber < $playerNumber ]]; then
         ((tries=tries-1))
         echo "Die Zahl ist kleiner als $playerNumber"

       else
         ((tries=tries-1))
         echo "Die Zahl ist grösser als $playerNumber"
       fi
    else
      echo "$playerNumber ist keine Zahl!"
    fi
  else
    echo "----------------------------------------------------------"
    echo "Sie haben 5 Versuche gehabt und die Zahl nicht erraten..."
    echo "----------------------------------------------------------"
    exit
  fi
done
