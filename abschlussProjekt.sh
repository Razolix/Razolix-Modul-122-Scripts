#!/bin/bash
echo "--------------------------------------------------------------------------------"
echo ""
echo "Willkommen zum Verwaltungssystem"
echo ""
programm=true

files () {
  current_path=$(pwd)
  concat_directory="$current_path/information"
  concat_persons="$concat_directory/persons"
  concat_logs="$concat_directory/log"

  if [ -d "$concat_directory" ]; then
    if [ ! -d "$concat_persons" ]; then
      touch "${concat_directory}"/persons.txt
    fi
    if [ ! -d "$concat_logs" ]; then
      touch "${concat_directory}"/log.txt
    fi
  else
    echo "da"
    mkdir information
    touch "${concat_directory}"/persons.txt
    touch "${concat_directory}"/log.txt
fi
}

add_person () {
echo "--------------------------------------------------------------------------------"
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
  while read p; do
    IFS=" | " read -a myarray <<< "$p"

    if [[ "${myarray[1]}" == "${last_name}" && "${myarray[3]}" == "${phonenumber}" ]]; then
      personFound=true
      echo "Person schon vorhanden!"
      echo ""
      message_log "Person nicht hinzufuegt: ${myarray[0]} | ${myarray[1]} | ${myarray[2]} | ${myarray[3]} => Grund: Schon vorhanden."
      break
    fi
  done < "${concat_directory}"/persons.txt

  if [[ "${personFound}" == false ]]; then
    person="${last_name} | ${first_name} | ${street} | ${phonenumber}"
    echo "${person}" >> "${concat_directory}"/persons.txt
    echo "Person erfolgreich erstellt: ${last_name} | ${first_name} | ${street} | ${phonenumber}"
    echo ""
    message_log "Person erfolgreich erstellt: ${last_name} | ${first_name} | ${street} | ${phonenumber}"
  fi
}

delete_person () {
echo "--------------------------------------------------------------------------------"
  echo ""
  echo "Nachname der Person:"
  read last_name
  echo ""
  echo "Telefonnummer der Person:"
  read phone_number
  echo ""
  line=0
  personFound=false
  while read p; do
    (( line++ ))
    IFS=" | " read -a myarray <<< "$p"

    if [[ "${myarray[1]}" == "${last_name}" && "${myarray[3]}" == "${phone_number}" ]]; then
      echo "Person vorhanden!"
      personFound=true
      sed -i "${line}d" "${concat_directory}"/persons.txt

      echo "Person erfolgreich geloest: ${myarray[0]} | ${myarray[1]} | ${myarray[2]} | ${myarray[3]}"
      echo ""
      message_log "Person erfolgreich geloest: ${myarray[0]} | ${myarray[1]} | ${myarray[2]} | ${myarray[3]}"
      break
    fi
  done < "${concat_directory}"/persons.txt

  if [[ "${personFound}" == false ]]; then
      echo "Person wurde nicht gefunden."
      echo ""
  fi
}

edit_person () {
echo "--------------------------------------------------------------------------------"
  echo ""
  echo "Nachname der Person:"
  read last_name
  echo ""
  echo "Telefonnummer der Person:"
  read phone_number
  echo ""
  line=0
  personFound=false
  person=""
  while read p; do
    (( line++ ))
    IFS=" | " read -a myarray <<< "$p"

    if [[ "${myarray[1]}" == "${last_name}" && "${myarray[3]}" == "${phone_number}" ]]; then
      echo "Person vorhanden!"
      echo ""
echo "--------------------------------------------------------------------------------"
      personFound=true
      person="${myarray[0]} | ${myarray[1]} | ${myarray[2]} | ${myarray[3]}"

      break
    fi
  done < "${concat_directory}"/persons.txt

  if [[ "${personFound}" == false ]]; then
      echo "Person wurde nicht gefunden."
      echo ""
  else
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
      sed -i "${line}s/${person}/${first_name_new} | ${last_name_new} | ${street_new} | ${phonenumber_new}/" "${concat_directory}"/persons.txt
      echo "Person erfolgreich bearbeitet: ${first_name_new} | ${last_name_new} | ${street_new} | ${phonenumber_new}"
      echo ""
      message_log "Person erfolgreich bearbeitet: ${person} => ${first_name_new} | ${last_name_new} | ${street_new} | ${phonenumber_new}"
  fi
}

get_person () {
echo "--------------------------------------------------------------------------------"
  echo ""
  echo "Nachname der Person:"
  read last_name
  echo ""
  echo "Telefonnummer der Person:"
  read phone_number
  echo ""
  line=0
  personFound=false
  while read p; do
    (( line++ ))
    IFS=" | " read -a myarray <<< "$p"

    if [[ "${myarray[1]}" == "${last_name}" && "${myarray[3]}" == "${phone_number}" ]]; then
      personFound=true
      echo "Daten der Person:"
      echo "Vorname: ${myarray[0]}"
      echo "Nachname: ${myarray[1]}"
      echo "Strasse: ${myarray[2]}"
      echo "Telefonnummer: ${myarray[3]}"
      echo ""
      message_log "Person erfolgreich angezeigt: ${myarray[0]} | ${myarray[1]} | ${myarray[2]} | ${myarray[3]}"
    fi
  done < "${concat_directory}"/persons.txt

  if [[ "${personFound}" == false ]]; then
      echo "Person wurde nicht gefunden."
      echo ""
  fi
}

get_all_persons () {
echo "--------------------------------------------------------------------------------"
  echo ""
  cat "${concat_directory}"/persons.txt
  echo ""
  message_log "Alle Personen erfolgreich angezeigt."

}

message_log () {
  message=$1
  date=$(date)
  echo "${date} | ${message}" >> "${concat_directory}"/log.txt
}


files

while [ $programm ]
do
echo "--------------------------------------------------------------------------------"
  echo ""
  echo "01: Person hinzufuegen"
  echo "02: Person loeschen"
  echo "03: Person bearbeiten"
  echo "04: Person aufrufen"
  echo "05: Alle Personen aufrufen"
  echo ""
  echo "Geben Sie je nach Wunsch eine Zahl ein:"

  read option

  if [[ $option -eq 1 ]]
  then
    echo ""
    add_person
  elif [[ $option -eq 2 ]]
  then
    echo ""
    delete_person
  elif [[ $option -eq 3 ]]
  then
    echo ""
    edit_person
  elif [[ $option -eq 4 ]]
  then
    echo ""
    get_person
  elif [[ $option -eq 5 ]]
  then
    echo ""
    get_all_persons
  else
    echo "Keine Zahl von Oben"
  fi
done