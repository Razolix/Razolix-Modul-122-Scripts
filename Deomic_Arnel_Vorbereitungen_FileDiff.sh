#!/bin/bash

echo -n "Enter a number: "
read VAR

#1) If else
if [[ $VAR -gt 10 ]]
then
  echo "The variable is greater than 10."
  else
  echo "The variable is equal or less than 10."
fi

#2) String ist empty oder nicht
echo -n "Enter a String: "
read VAR
if [ -z "$VAR" ]
then
      echo "String is empty"
else
      echo "$VAR is NOT empty"
fi

#3) Arithmetische Vergleich if
echo -n "Enter number one for comparison: "
read a
echo -n "Enter number one for comparison: "
read b

if (( a > b )); then
    echo "$a ist grösser"
    else
    echo "$b ist grösser"
fi

#4) String comparison
echo -n "Enter string one for comparison: "
read str1
echo -n "Enter string one for comparison: "
read str2

if [ "$str1" == "$str2" ]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi

#5) for loop
for var in 1 2 3 4 5
do
	echo $var
done

#6) Datei zeilenweise forloop whileloop
while read LINE
do
    echo $LINE
done < README.md

#7) Variable inkrementieren
x=3
y=3
z=3

x=$((x-1))
((y=y-1))
let "z=z-1"

echo x: $x
echo y: $y
echo z: $z
