#!/bin/bash

while true; do
    read -n 1 -p "Use 65C02 mode? (y/n): " ans

    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        printf "\n65C02 mode selected\n"
	read -p "What is the directory of ca65 and ld65? " dir
        "$dir"/ca65 ./defines.s -D C02
        "$dir"/ld65 ./defines.o -C program.cfg
        break

    elif [[ "$ans" == "n" || "$ans" == "N" ]]; then
        printf "\n6502 mode selected\n"
        read -p "What is the directory of ca65 and ld65? " dir
	"$dir"/ca65 ./defines.s
        "$dir"/ld65 ./defines.o -C program.cfg
        break

    else
        echo "Invalid input"
    fi
done


