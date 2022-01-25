#!/bin/bash
#
# Das Projekt orientiert sich auf ein Verwaltungssystem. Das Ganze spielt im Terminal ab, soll aber übersichtlich bleiben.
# Es soll möglich sein eine Person hinzuzufügen, diese zu löschen oder auch zu bearbeiten. Man kann eine gewünschte Person
# leicht anzeigen oder direkt alle Personen in der Liste aufzulisten.
# Der Speicher besteht aus einem Textdokument. Ein weiteres Textdokument ist das Logdokument, bei dem jede Aktion
# aufgeschrieben wird mit Uhrzeit.
#
# Start der Applikation:
# ./abschlussProjekt.sh
#
# Daten speichern:
# Ordner information |
# persons.txt         | => wird generiert
# log.txt            |
#
echo "--------------------------------------------------------------------------------"
echo ""
echo "Willkommen zum Verwaltungssystem"
echo ""
programm=true

#Erstellen vom Informationsordner falls nicht vorhanden beim Start
files () {
  current_path=$(pwd)
  concat_directory="$current_path/information"
  concat_persons="$concat_directory/persons"
  concat_logs="$concat_directory/log"

  #Ueberpruefung ob Ordner "information" vorhanden
  #Falls ja:
  if [ -d "$concat_directory" ]; then
    #Ueberpruefung ob File "persons.txt" vorhanden
    if [ ! -d "$concat_persons" ]; then
      #Erstellen vom Dokument "persons.txt" falls nicht vorhanden
      touch "${concat_directory}"/persons.txt
    fi
    #Ueberpruefung ob File "log.txt" vorhanden
    if [ ! -d "$concat_logs" ]; then
      #Erstellen vom Dokument "log.txt" falls nicht vorhanden
      touch "${concat_directory}"/log.txt
    fi
  else
    #Falls Ordner nicht vorhanden, wird er erstellt
    mkdir information
    #File wird erstellt
    touch "${concat_directory}"/persons.txt
    #File wird erstellt
    touch "${concat_directory}"/log.txt
fi
}

#1. Person hinzufuegen
add_person () {
  echo "--------------------------------------------------------------------------------"
  #"read" input vom User wird gelesen
  echo ""
  echo "Nachname der Person:"
  read last_name
  echo ""
  echo "Vorname der Person:"
  read first_name
  echo ""
  echo "Strasse der Person:"
  read street
  echo ""
  echo "Telefonnummer der Person:"
  read phonenumber
  echo ""

  personFound=false
  #persons.txt wird durchgeloopt
  while read p; do
    #Falls "Nachname" = read von Person und "Telefonnummer" = read von Person gleich
    if [[ "${myarray[1]}" == "${last_name}" && "${myarray[3]}" == "${phonenumber}" ]]; then
      personFound=true
      #Person vorhanden, wird nicht hinzugefuegt
      echo "Person schon vorhanden!"
      echo ""
      #Wird gelogt im log.txt
      message_log "Person nicht hinzufuegt: ${myarray[0]} | ${myarray[1]} | ${myarray[2]} | ${myarray[3]} => Grund: Schon vorhanden."
      break
    fi
  done < "${concat_directory}"/persons.txt

  #Falls Person nicht gefunden
  if [[ "${personFound}" == false ]]; then
    #Person wird erstellt mit Daten von den vier "read"s
    person="${last_name} | ${first_name} | ${street} | ${phonenumber}"
    #Person wird im persons.txt eingefuegt
    echo "${person}" >> "${concat_directory}"/persons.txt
    echo "Person erfolgreich erstellt: ${last_name} | ${first_name} | ${street} | ${phonenumber}"
    echo ""
    #Person erfolgreich erstellt wird im log.txt ausgegeben
    message_log "Person erfolgreich erstellt: ${last_name} | ${first_name} | ${street} | ${phonenumber}"
  fi
}

#Person wird entfernt
delete_person () {
echo "--------------------------------------------------------------------------------"
  echo ""
  #Nach Nachnamen und Telefonnummer wird gesucht (sind zusammen Unique)
  echo "Nachname der Person:"
  read last_name
  echo ""
  echo "Telefonnummer der Person:"
  read phone_number
  echo ""
  #Line von vorhandener Person
  line=0
  personFound=false
  #Loop durch persons.txt
  while read p; do
    #Line + 1
    (( line++ ))
    #Falls "Nachname" = read von Person und "Telefonnummer" = read von Person gleich
    if [[ "${myarray[1]}" == "${last_name}" && "${myarray[3]}" == "${phone_number}" ]]; then
      echo "Person vorhanden!"
      personFound=true
      #Person wird auf Linie x enternt, d hilft daf�r
      sed -i "${line}d" "${concat_directory}"/persons.txt
      echo "Person erfolgreich geloest: ${myarray[0]} | ${myarray[1]} | ${myarray[2]} | ${myarray[3]}"
      echo ""
      #Ausgabe im log.txt
      message_log "Person erfolgreich geloest: ${myarray[0]} | ${myarray[1]} | ${myarray[2]} | ${myarray[3]}"
      break
    fi
  done < "${concat_directory}"/persons.txt

  #Falls Person nicht gefunden
  if [[ "${personFound}" == false ]]; then
      echo "Person wurde nicht gefunden."
      echo ""
  fi
}

#Person wird editiert
edit_person () {
echo "--------------------------------------------------------------------------------"
  echo ""
  echo "Nachname der Person:"
  read last_name
  echo ""
  echo "Telefonnummer der Person:"
  read phone_number
  echo ""
  #Aktuelle Linie
  line=0
  personFound=false
  #Aktuelle Person
  person=""
  #Loop durch persons.txt
  while read p; do
    #Line + 1
    (( line++ ))
    #Falls "Nachname" = read von Person und "Telefonnummer" = read von Person gleich
    if [[ "${myarray[1]}" == "${last_name}" && "${myarray[3]}" == "${phone_number}" ]]; then
      echo "Person vorhanden!"
      echo ""
echo "--------------------------------------------------------------------------------"
      personFound=true
      #Person wird definiert
      person="${myarray[0]} | ${myarray[1]} | ${myarray[2]} | ${myarray[3]}"
      break
    fi
  done < "${concat_directory}"/persons.txt

  #Falls Person nicht vorhanden => editieren abbrechen
  if [[ "${personFound}" == false ]]; then
      echo "Person wurde nicht gefunden."
      echo ""
  else
      #Falls Person vorhanden
      #Neue Daten der Person aufnehmen
      echo ""
      echo "Nachname der Person:"
      read last_name_new
      echo ""
      echo "Vorname der Person:"
      read first_name_new
      echo ""
      echo "Strasse der Person:"
      read street_new
      echo ""
      echo "Telefonnummer der Person:"
      read phonenumber_new
      echo ""
      #Falls auf Line, Daten der gespeicherten Person vorhanden, ersetze mit neuem Text. Neuer Text passiert ab "${person}/hier"
      sed -i "${line}s/${person}/${first_name_new} | ${last_name_new} | ${street_new} | ${phonenumber_new}/" "${concat_directory}"/persons.txt
      echo "Person erfolgreich bearbeitet: ${first_name_new} | ${last_name_new} | ${street_new} | ${phonenumber_new}"
      echo ""
      #Ausgabe im log.txt
      message_log "Person erfolgreich bearbeitet: ${person} => ${first_name_new} | ${last_name_new} | ${street_new} | ${phonenumber_new}"
  fi
}

#Gewuenschte Person hollen
get_person () {
echo "--------------------------------------------------------------------------------"
  #Nachname und Telefonnummer wird geholt
  echo ""
  echo "Nachname der Person:"
  read last_name
  echo ""
  echo "Telefonnummer der Person:"
  read phone_number
  echo ""
  line=0
  personFound=false
  #Loop durch persons.txt
  while read p; do
    (( line++ ))
    #Falls "Nachname" = read von Person und "Telefonnummer" = read von Person gleich
    if [[ "${myarray[1]}" == "${last_name}" && "${myarray[3]}" == "${phone_number}" ]]; then
      personFound=true
      #Ausgabe der gewuenschten Person
      echo "Daten der Person:"
      echo "Vorname: ${myarray[0]}"
      echo "Nachname: ${myarray[1]}"
      echo "Strasse: ${myarray[2]}"
      echo "Telefonnummer: ${myarray[3]}"
      echo ""
      #Ausgabe im log.txt, Person ausgegeben
      message_log "Person erfolgreich angezeigt: ${myarray[0]} | ${myarray[1]} | ${myarray[2]} | ${myarray[3]}"
    fi
  done < "${concat_directory}"/persons.txt
  #Falls Person nicht gefunden wurde
  if [[ "${personFound}" == false ]]; then
      echo "Person wurde nicht gefunden."
      echo ""
  fi
}

#Alle Personen im Dokument ausgeben
get_all_persons () {
echo "--------------------------------------------------------------------------------"
  echo ""
  #cat => Ausgabe des Files (persons.txt)
  cat "${concat_directory}"/persons.txt
  echo ""
  message_log "Alle Personen erfolgreich angezeigt."

}

#Log Methode
message_log () {
  #Nachricht vom jeweiligen Aufruf der Methode
  message=$1
  #Aktuelles Datum wird geholt
  date=$(date)
  #Ausgabe im log.txt
  echo "${date} | ${message}" >> "${concat_directory}"/log.txt
}


files

#So lange aktiv bis Programm beendet wird
while (${programm});
do
echo "--------------------------------------------------------------------------------"
  echo ""
  echo "01: Person hinzufuegen"
  echo "02: Person loeschen"
  echo "03: Person bearbeiten"
  echo "04: Person aufrufen"
  echo "05: Alle Personen aufrufen"
  echo ""
  echo "09: Projekt beenden"
  echo ""
  echo "Geben Sie je nach Wunsch eine Zahl ein:"

  read option

  #Alle Optionen
  if [[ $option -eq 1 ]]
  then
    echo ""
    #Aufruf der Methode
    add_person
  elif [[ $option -eq 2 ]]
  then
    echo ""
    #Aufruf der Methode
    delete_person
  elif [[ $option -eq 3 ]]
  then
    echo ""
    #Aufruf der Methode
    edit_person
  elif [[ $option -eq 4 ]]
  then
    echo ""
    #Aufruf der Methode
    get_person
  elif [[ $option -eq 5 ]]
  then
    echo ""
    #Aufruf der Methode
    get_all_persons
  elif [[ $option -eq 9 ]]
  then
    echo ""
    echo "--------------------------------------------------------------------------------"
    echo ""
    echo "Programm wird beendet"
    echo ""
    echo "--------------------------------------------------------------------------------"
    programm=false
  else
    echo "Keine Zahl von Oben"
  fi
done