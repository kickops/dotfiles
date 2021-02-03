#!/bin/bash
#Author: Kicky
#Helper functions for progress and color printing 

# color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

function print_exit() {
    echo -e "$RED$1 $NC"
    exit 1
}

function print_red() {
    echo -e "$RED$1 $NC"
}

function print_yellow() {
    echo -e "$YELLOW$1 $NC"
}

function print_green() {
    echo -e "$GREEN$1 $NC"
}

function yecho() {
    echo -ne "$YELLOW$1$NC"
}

function progress_bar () {
yecho '#                                                                                         (5%)\r'
sleep .2
yecho '###                                                                                       (13%)\r'
sleep .2
yecho '########                                                                                  (18%)\r'
sleep .2
yecho '###############                                                                           (25%)\r'
sleep .2
yecho '######################                                                                    (32%)\r'
sleep .2
yecho '##############################                                                            (40%)\r'
sleep .2
yecho '######################################                                                    (49%)\r'
sleep .2
yecho '###############################################                                           (58%)\r'
sleep .2
yecho '########################################################                                  (66%)\r'
sleep .2
yecho '#################################################################                         (75%)\r'
sleep .2
yecho '##########################################################################                (84%)\r'
sleep .2
yecho '##################################################################################        (92%)\r'
sleep .2
yecho '##########################################################################################(100%)\r'
echo -ne '\n'
}


progressbar() {
  local duration=${1}
    already_done() { for ((done=0; done<$elapsed; done++)); do printf "▇"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
      already_done; remaining; percentage
      sleep 2
      clean_line
  done
  clean_line
}
