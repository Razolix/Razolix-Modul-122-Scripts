#!/bin/bash
#
# Name: processing.sh
# ---------------------------------------------------------------------------------
# SYNOPSIS: processing.sh
# Ausgeführt in Git Bash (Ubuntu) Konsole
#
# Description: Dieses Skript sind verschiedene Aufgaben des Text Processing drin.
# Das Ziel ist es zu verstehen, was alles möglich ist mit den richtigen Befehlen, rund um Textdokumente.
#
# Autoren: Arnel Deomic
# Datum: 02.11.2021
#
# Personen mit ihren Username und Passwort ausgeben
#
# join -j -1 3 -2 1 Person.txt Passwort.txt > PersonPasswort.txt
#
#
# Inhalt aus drei Dateien fox1.txt, fox2.txt, fox3.txt, sortiert und mehrfaches
# Vorkommen der gleichen Inhalte nur einmal ausgegeben
#
# cat fox1.txt fox2.txt fox3.txt | sort | uniq > final.list
#
#
# Inhalt aus der Datei testfile.txt wird sortiert ausgegeben. Eine gleiche Zeile wird nur
# einmal ausgegeben. Am Anfang jeder Zeile wird die Anzahl des Vorkommens ausgegeben.
# sort testfile.txt | uniq -c | sort -nr
#
#
# Die Zeile von einem man Aufruf ausgeben, die kurz beschreibt, was der
# Befehl macht.
# ./processing.sh wc
#
# man $1 | head -n6 | tail -n1 | cut -b 8-
#
#
# Anzahl Zeilen, Wörter der Datei filediff.sh ausgeben.
# Nummerieren der Zeilen von der Datei filediff
#
# Zeilen
# wc -l filediff.sh
#
# Wörter
# wc -w filediff.sh
#
# Nummerierung der Zeilen
# nl filediff.sh