#!/bin/bash
#
# Name: du_3_2_3.sh - Anzeige der Grösse sortiert ausgegeben
# -----------------
# SYNOPSIS: du_3_2_3.sh [OPTION]
# Description: Zeigt Groesse der dateien und Verzeichnisse sortiert an.
# Dieses Script listet alle Dateien im aktuellen Verzeichnis
# und rekursiv in den Unterverzeichnis geordnet nach ihrer
# 'disk usage' oder ihrem Namen auf.
# Parameter fuer sort:
#  -k[pos] gibt an welche Spalte sortiert werden soll
#  -g gibt an, dass numerisch sortiert werden soll
# du_sort_1_2_2 -gk1  -> sortiert numerisch auf erste Spalte
# du_sort_1_2_2 -k2r  -> sortiert alph. auf zweite spalte
#                        umgekehrte Reihenfolge
#
# Autor: Aaron Laeuchli
# Version: 3.2.3
# Datum: 14.09.2021
#
#

du -a | sort $1

total=$(du -c | grep total | cut -f -1)

echo "$total"