#!/usr/bin/env bash

clear

declare -i numFiles
numFiles=$(find . -maxdepth 1 -not -type d | wc --lines)

function makeValidGuess {
	until read -p "Enter how many files are in directory : " guess;
	[[ "$guess" =~ ^[0-9]+$ ]]; do
		echo -e "\nEnter an positive integer \n"
	done
}

while makeValidGuess; do
	if (( guess < numFiles )); then
		echo -e "\nYour number is too small!"
	elif (( guess > numFiles )); then
		echo -e "\nYour number is greater than correct answer!"
	else
		echo -e "\n Answer $numFiles is correct!"
		exit

	fi
done
