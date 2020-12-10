#!/bin/bash

#ROBO ALEATORIO, QUE RESPONDE MINHAS PERGUNTAS, ME DA BOM DIA E BOA NOITE E ME XINGA...
#DIGA OQUE QUISER E ESCUTE OQUE TALVEZ NÃO QUER.
#CRIADO POR: RAMONE

cat banner.txt
sleep 2

source frases.msg

while :; do
read -e -p "Me diga algo: " texto
case $texto in
   "oi"*)
    echo "Digitando..."; sleep 1s;clear
    l="$(( $RANDOM %5 ))"
    echo "${oi[$l]}"
    ;;

   "bom dia"*|*"bom dia"*)
   l="$(( $RANDOM % 7 ))"
   echo "${bom_dia[$l]}"
   ;;

   *"fuder"*)
   l="$(( $RANDOM % 7))"
   echo "${fuder[$l]}"
   ;;

   "biscate"*)
   echo "${putaria[0]}"
   ;;

   "quem é voce"*|*"seu nome"*)
   l="$(($RANDOM % 4))"
   echo "${apresentacao[$l]}"
   ;;

   "santos"*|*"seu time"*|*"santos")
   l="$(( $RANDOM % 4 ))"
   echo "${san[$l]}"
   ;;

   "palmeiras"*|*"palmeiras")
   l="$(( $RANDOM % 3 ))"
   echo "${palm[$l]}"
   ;;

   "corinthians"*|*"corinthians"*)
   l="$(( $RANDOM % 3 ))"
   echo "${gamba[$l]}"
   ;;

   *"site"*|*"sites")
   echo -e "\e[33;1mQual site quer que eu rode??\e[m"
   read -p "Digite ou cole um link: " website; firefox $website
   ;;

   *"numero aleatorio"*|*"qualquer numero")
   echo -e "\e[33;1mOk um numero aleatório: $RANDOM \e[m"
   ;;

   *"musica"*) echo -n "Que tal "; echo "${musica[0]} ?"; sleep 2; 
	read -n1 -p "Sim ou Não? [s/n] " resposta
	case $resposta in
	S|s) echo
	vlc songs/i_saw_you_say.mp3;;
	N|n) echo
	echo "Tudo bem, então.";;
	esac
   ;;

esac
done
