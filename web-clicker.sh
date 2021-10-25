#!/usr/bin/bash

RED='\033[1;31m'
YELLOW='\e[93m\e[1m'
GREEN='\033[1;32m'
WHITE='\033[1;37m'
NC='\033[0m'

clear
echo -e "${GREEN}--------------------------------------------"
figlet -f future "WEB-CLICKER V1.0" | lolcat
echo -e "${GREEN}--------[ ${YELLOW}Developed by @mkdirlove${GREEN} ]---------"
echo ""
sleep 1
echo -e "${GREEN}[*] WHITE EARN BOT auto clicker for lazy peoples."
sleep 1
echo -e "${YELLOW}[*] This script is designed to be run on a Linux based system."
sleep 1
echo -e "${YELLOW}[*] Ensuring if xdotool is installed..."
sleep 1

#check if pacman is installed, if it is use it to check if xdotool is instaled and install it if it isn't
#if command -v pacman >/dev/null; then
if which pacman >/dev/null; then
    if ! pacman -Qq | grep -qw xdotool; then
        echo -e "${RED}[!] xdotool not found, installing, this may ask for your password...${NC}"
        sleep 2
        sudo pacman -Sy xdotool
    fi
    #check if apt is installed, if it is use it to check if xdotool is instaled and install it if it isn't
    #elif command -v apt >/dev/null; then
    elif which apt >/dev/null; then
    if ! dpkg -l | grep -qw xdotool; then
        echo -e "${RED}[!] xdotool not found, installing, this may ask for your password...${NC}"
        sleep 2
        sudo apt update
        sudo apt install xdotool
    fi
    #if both pacman and apt couldn't be found, report error
else
    echo -e "${RED}[!] pacman or apt not found! exiting..."
    sleep 5
    exit 1
fi

sleep 2
clear
echo -e "${GREEN}--------------------------------------------"
figlet -f future "WEB-CLICKER V1.0" | lolcat
echo -e "${GREEN}--------[ ${YELLOW}Developed by @mkdirlove${GREEN} ]---------"
echo ""
echo -e "${GREEN}[+] What mouse button would you like pressed?"
echo -e "[1] Left Button Click"
echo -e "[2] Middle Button Click"
echo -e "[3] Right Button Click"
echo ""
read -p "[options] » " mouse
sleep 1
clear
echo -e "${GREEN}--------------------------------------------"
figlet -f future "WEB-CLICKER V1.0" | lolcat
echo -e "${GREEN}--------[ ${YELLOW}Developed by @mkdirlove${GREEN} ]---------"
echo ""
echo -e "${GREEN}[+] How long between each mouse press (in seconds)? "
echo ""
read -p "[seconds] » " clock

sleep 1
clear
echo -e "${GREEN}--------------------------------------------"
figlet -f future "WEB-CLICKER V1.0" | lolcat
echo -e "${GREEN}--------[ ${YELLOW}Developed by @mkdirlove${GREEN} ]---------"
echo ""
echo -e "${YELLOW}[!] This script will begin in 5 seconds with these settings:${NC}"
echo -e "${YELLOW}[*] Mouse: $mouse  Delay: $clock"
echo -e "${GREEN}[!] Use ${YELLOW}[Ctrl-C]${GREEN} in this terminal to quit."
sleep 5

# The code below is what does the actual clicking.

while [ 1 ]; do
    xdotool click $mouse &
    sleep $clock
done

# The variable $mouse controls what mouse button is pressed.
# The variable $clock controls how long (in seconds) between each button press.
# Note that it may be difficult to kill this script if the time is too short.
# Note that every device have different windows and mouse coordinates.
# Use "xdotool getmouselocation --shell" for calibrating mouse position.
