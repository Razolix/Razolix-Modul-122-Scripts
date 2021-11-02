#!/bin/bash
#
# Name: umgestalten.sh
# ---------------------------------------------------------------------------------
# SYNOPSIS: umgestalten.sh readFile writeFile
# Ausgeführt in Git Bash (Ubuntu) Konsole
#
# Description: Dieses Skript führt eine Filterung durch, bei dem das ExportSmall.spl / Export.spl nur mit den
# wichtigsten Informationen angezeigt wird.
#
# Ablauf:
# umgestalten.sh ExportSmall.spl output.txt eingeben im Terminal
# wird geschaut ob Nummer zwischen 0 und 2
# wird geschaut ob Text zwischen 0 - 25 (nur deutsch)
# Spalte 2 und 4 wird nur ausgedruckt
# Hauptnummer gefiltert
# Ausgabe outputFile
#
# Autoren: Arnel Deomic
# Datum: 1.11.2021

input=$1
output=$2

#Regex Filter 0-2
awk '$1 ~ /^[0-2]$/ '  "$input" | \
#Regex Filter 0-25 generieren (ueber 25 = englisch)
awk '$2 ~ /^[0-25]$/'             | \
# -F Spalte auseinander, nur 2 und 4
awk -F"'" '{print $2,"     ",$4}' | \
#Nur Hauptnummer wird gefiltert
awk 'length($1)==7' > "$output"