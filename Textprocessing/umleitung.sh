#!/bin/bash
#
# Name: umleitung.sh
# ---------------------------------------------------------------------------------
# SYNOPSIS: umleitung.sh
# Ausgeführt in Git Bash (Ubuntu) Konsole
#
# Description: Dieses Skript ist die Vorbereitung für Textprocessing. Hier wurden Aufgaben kommentiert.
#
# Autoren: Arnel Deomic
# Datum: 02.11.2021
#
#
# ls -l | grep "\.txt$"
# Auflistung aller Files mit .txt Endung
#
# ls -l | sed -e "s/[aeio]/u/g"
# Alle Buchstaben im [ ] werden mit einem u ersetzt, immernoch Auflistung aller Files
#
# ls -l > ls-l.txt
# Auflistung aller Files werden in neuem File erstellt (WICHTIG ">")
#
# Cat dateiDieEsNichtGibt.txt 2> error.txt
# Falls Datei nicht vorhanden => neues file mit Errormeldung sonst Ausgabe Terminal
#
# Cat dateiDieEsNichtGibt.txt 2> /dev/null
# /dev/null lässt Fehlermeldung verschwinden