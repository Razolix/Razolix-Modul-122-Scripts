#!/bin/bash
#
# Name: u4_1_file_diff.sh - Anzeige von unterschiedlichen Zeilen zweier Dokumente
# ---------------------------------------------------------------------------------
# SYNOPSIS: u4_1_file_diff.sh File1 File2
# Ausgeführt in Git Bash (Ubuntu) Konsole
#
# Description: Dieses Bashscript vergleicht die Zeilen von zwei gewünschten Dateien
# Es gibt alle Zeilen aus und die unterschiedlichen Zeilen werden genauer erwähnt.
# Am Ende wird dann die insgesamte Zahl der unterschiedlichen Zeilen ausgegeben.
#
# WICHTIG: Der Aufruf der Dokumente wird mit eine Endung wie zum Beispiel .txt gemacht
# ./u4_1_file_diff.sh file1 file2
# file1: Ist das erste Dokument
# file2: Ist das zweite Dokument
#
# Autoren: Arnel Deomic
# Datum: 28.09.2021

echo "************************************"
echo "Dokument 1: $1"
echo "Dokument 2: $2"
echo ""

#Überprüfung ob beide Dokumente existieren
if [[ -f "$1" && -f "$2" ]]; then
  # Variablen setzen
  # Überprüfung welches Dokument mehr Zeilen hat (-gt ist greater than)
  if [[ $(wc -l < "$1") -gt $(wc -l < "$2") ]];
  then
    biggerFile=$1
    smallerFile=$2
  else
    biggerFile=$2
    smallerFile=$1
  fi

  echo "Das grössere Dokument ist $biggerFile"
  echo "************************************"
  echo ""
  echo "Ausgabe der Zeilen:"
  #Aus grossen Dokument Anzahl Zeilen holen. +1 weil die Länge bei 0 beginnt.
  differentRows=0
  amountRowsBiggerFile=$(("$(wc -l < "$biggerFile")"+1))

  #Zeile bei dem der While starten soll
  i=1
  #While dass durch die Zeilen von eins bis amountRowsBiggerFile durchgeht.
  while [[ $i -le $amountRowsBiggerFile ]]
  do
    #Aktuelle Zeile des grossen Dokumentes
    currentRowBiggerFile=$(sed -n ${i}p "$biggerFile")
    #Aktuelle Zeile des kleinen Dokumentes
    currentRowSmallerFile=$(sed -n ${i}p "$smallerFile")

    echo "------------------------------------"
    echo "Zeile: $i | $biggerFile| $currentRowBiggerFile"
    echo "Zeile: $i | $smallerFile| $currentRowSmallerFile"
    echo "------------------------------------"

    #Überprüfung ob aktuelle Zeile von beiden Dokumenten nicht gleich ist
    if [[ "$currentRowBiggerFile" != "$currentRowSmallerFile" ]]; then
      ((differentRows=differentRows+1))

      echo "Zeile $i nicht gleich"
    fi
    ((i=i+1))
  done

  echo ""
  echo "************************************"
  echo "Insgesamt sind $differentRows Zeilen ungleich"
  echo ""
  echo "************************************"
else
  echo "Ungültige Dokumentangabe"
fi