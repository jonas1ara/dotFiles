#!/bin/bash

echo "Este script configura tu máquina con esta configuración de vim y tmux"


sudo apt update && sudo apt upgrade -y

sudo apt install cmake make gdb unzip curl tmux vim mono-devel python3 python3-pip clang build-essential -y


