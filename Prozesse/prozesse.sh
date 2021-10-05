#!/bin/bash

if ps | grep-q $1
then
  echo "Der Prozess $1 laeuft gerade."
else
  echo "Der Prozess $1 laeuft nicht."
fi
