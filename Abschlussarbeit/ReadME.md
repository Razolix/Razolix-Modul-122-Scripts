# User Verwaltung
## Vor der Umsetzung
### Beschreibung
Das Projekt orientiert sich auf ein Verwaltungssystem. Das Ganze spielt im Terminal ab, soll aber übersichtlich bleiben.
Es soll möglich sein eine Person hinzuzufügen, diese zu löschen oder auch zu bearbeiten. Man kann eine gewünschte Person
leicht anzeigen oder direkt alle Personen in der Liste aufzulisten.
Der Speicher besteht aus einem Textdokument. Ein weiteres Textdokument ist das Logdokument, bei dem jede Aktion
aufgeschrieben wird mit Uhrzeit.

### Ablauf
1. Projekt erstellen
2. Ordner erstellen für das Speichern der Personen
3. Logfiles erstellen
4. Terminal Auswahl möglich
   1. Person hinzufügen
      1. Person in Liste hinzugefügt
         1. Person besitzt Id
         2. Person besitzt Name
         3. Person besitzt Vorname
         4. Person besitzt Strasse
         5. Person besitzt Telefonnummer
   2. Person entfernen
      1. Person von Liste entfernen
         1. Person wird mit Namen + Tel entfernt
           a. Abfrage, ob Person, die ist, die entfernt werden soll
   3. Person bearbeiten
      1. Person wird in der Liste bearbeitet
         1. Person wird mit Namen + Vorname bearbeitet
           a. Abfrage, ob Person, die ist, die bearbeitet werden soll
   4. Gewünschte Person anzeigen
      1. Möglich gewünschte Person anzuzeigen mit Name + Tele
   5. Personen werden bei Aufruf angezeigt

## Testfälle
| Testfall | Erwartung |Ergebnis | Tester |
|:--------------:|:-------------:|:--------------:|:--------------:|
| Information Ordner erstellen | Beim Start wird ein Ordner mit "Log.txt" und "Persons.txt" drin erstellt. | Alles vom User kann gelogt werden und der User kann Personen ohne Probleme erstellen | Arnel Deomic
| User erstellen | Der User soll erstellt und in der Liste gespeichert werden. Das ganze wird geloggt | User wird erstellt und gelogt | Arnel Deomic |
| User bearbeiten | Bearbeiten von bestimmten User | User wird bearbeitet, gespeichert und angezeigt | Arnel Deomic |
| User löschen | Benutzer soll User löschen können | Ausgewählter User wird erfolgreich gelöscht | Arnel Deomic |
| User suchen | User mit Nachname und Telefonnummer suchen | User wird gefunden, wenn vorhanenden. Fall der User nicht existiert, wird der Benutzer darauf aufmerksam gemacht | Arnel Deomic |
| User anzeigen | Auflistung alles User | Auflistung alles User erfolgreich | Arnel Deomic |

## Anwendung
### Allgeimeine Anwendung
Für das Skript muss man nichts vorbereiten, da das Skript automatisch einen Ordern und die zwei Log-Files erstellt.
Das Skript kann in einem Terminal als Bash-Skript gestartet werden. Nach dem das Skript gestartet wurden, erhält der 
Benutzer 5 Auswahlmöglichkeiten. Er kann sich zwischen User erstellen, User bearbeiten, User löschen, User anzeigen und 
einen spezifischen User suchen entscheiden. Die Bedienung der Funktionen ist unter "Funktionelle Anwendung" zu finden. 
### Funktionelle Anwendung
#### User erstellen
Wählt der Benutzer "User erstellen" wird er aufgefordert, nacheinander Nachname, Vorname, Telefonnummer und Strasse
einzugeben. Nach dem der Benutzer die Strasse eingegeben hat, wird der erstellte User automatisch in einer Liste gespeichert.
Die Liste wird im File gespeichert. Im Log-File wird gelogt, dass ein neuer User erstellt wurde.
#### User bearbeiten
Wählt der Benutzer "User bearbeiten", muss er den Nachnamen und die Telefonnummer der zu bearbeitenden Person eingeben. 
Danach wird er wieder aufgefordert, Nachname, Vorname, Telefonnummer und Strasse einzugeben. Die Änderungen werden
in der Liste und im File gespeichert und auch im Log-File geloggt. 
#### User löschen
Der Benutzer kann auch User aus der Liste löschen. Für dies gibt er den Nachnamen und die Telefonnummer ein. Nach Eingabe
der Telefonnummer, wird der User aus der Liste gelöscht. Auch im File der Liste ist er nicht mehr auffindbar.
Die funktioniert, da Nachname und Telefonnummer eines Users nicht gleich sein können. 
#### User suchen
Auch das gezielte Suchen nach einem User ist möglich. Wie bei allen anderen Funktionen, muss der Benutzer wieder
Nachname und Telfonnummer eingeben. Ist dieser User registriert, wird er im Terminal angezeigt, falls nicht, 
erhält der Benutzer eine Meldung, dass kein User mit diesem Nachnamen und Telefonnummer registriert ist. 
#### User auflisten
Bei der letzten Funktion muss der Benutzer nichts machen. Wenn er diese Funktion gewählt hat, werden alle User, welche
in der Liste gespeichert sind aufgelistet. 

**Made By Arnel Deomic & Alessio Rispoli**


