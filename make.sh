#!/bin/bash

while true; do
    read -n 1 -p "Use 65C02 mode? (y/n): " ans

    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        echo "65C02 mode selected"
        ./ca65 defines.s -D C02
        ./ld65 defines.o -C program.cfg
        break

    elif [[ "$ans" == "n" || "$ans" == "N" ]]; then
        echo "6502 mode selected"
        ./ca65 defines.s
        ./ld65 defines.o -C program.cfg
        break

    else
        echo "Invalid input"
    fi
done


