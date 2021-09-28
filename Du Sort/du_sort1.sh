#!/bin/bash

echo "Ausgabe der Grösse alles Verzeichnisse und Dateien"

du -a -h --max-depth=1 | sort -hr
