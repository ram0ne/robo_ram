#!/bin/bash

#ROBO ALEATORIO, QUE RESPONDE MINHAS PERGUNTAS, ME DA BOM DIA E BOA NOITE E ME XINGA...
#DIGA OQUE QUISER E ESCUTE OQUE TALVEZ NÃO QUER.
#CRIADO POR: RAMONE

preto="\e[30;1m"
verm="\e[31;1m"
verd="\e[32;1m"
amare="\e[33;1m"
azul="\e[34;1m"
color="\e[m"

sleep 1s
cat banner.txt
sleep 2

source frases.msg

while :; do
read -e -p "Me diga algo: " texto
case $texto in
   "oi"*|*"ola")
    echo "Digitando..."; sleep 1s;clear
    l="$(( $RANDOM %5 ))"
    echo "${oi[$l]}"
    ;;

   *"como vai"*|*"como voce ta"*|*"tudo bem"*)
   l="$(( $RANDOM % 5 ))"
   echo "${como_vai[$l]}"
   ;;

   *"fazendo oque"*|*"oque esta fazendo"*)
   l="$(( $RANDOM % 5 ))"
   echo "${fazendo[$l]}"
   ;;


   "bom dia"*|*"bom dia"*)
   l="$(( $RANDOM % 7 ))"
   echo "${bom_dia[$l]}"
   ;;

   *"boa noite"*)
   l="$(( $RANDOM % 6 ))"
   echo "${boa_noite[$l]}"
   ;;

   *"fuder"*)
   l="$(( $RANDOM % 7))"
   echo "${fuder[$l]}"
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

   *"escrever algo"*)
   echo "Ok, vamos la, qual o editor de textos de sua preferência??"; sleep 2s
   echo "Escolha um e me diga: Nano, Mousepad, Gedit, Vi?"
	while :; do
	read -p "Executar: " editor 
	case $editor in
	"nano"|"Nano") echo "Ok, executando o nano"; nano 
	;;
	"mousepad"|"Mousepad") echo "Ok, executando o Mousepad"; mousepad 
	;;
	"gedit"|"Gedit") echo "Ok, executando o Gedit"; gedit
	;;
	"vi"|"Vi") echo "Ok, executando o Vi"; vi
	;;
	*) echo "Ops nome invalido"
	;;
	esac
	done
   ;;

   *"que dia é hoje"*|*"data"*|*"que dia e hoje"*)
   echo -n "Hoje é "; date
   ;;

   *"ferramenta"*)
   read -p "Qual ferramenta devo baixar?: " ferr
   sleep 2s; echo "Iniciando download de $ferr"; sleep 2s
   apt install $ferr
   ;;

   *"diretorio"*)
   read -p "Ok, qual nome do diretorio?? " pasta
   read -p "Onde criar o diretorio? (ex: home, root): " lugar
   mkdir /$lugar/$pasta
   ;;

   *"atualize"*|*"atualiza"*)
   echo "Ok, é pra jaaa!!!"; sleep 2s
   echo "Iniciando atualização do sistema..."; sleep 2s
   apt update -y && apt upgrade -y
   ;; 

   *"limpa a tela"*|*"limpe a tela"*)
   clear
   ;;    
   
   *"delete"*|*"apague"*|*"apaga"*|*"deleta"*)
   echo -e "$amare Aqui estão os arquivos da pasta atual: $PWD $color"; sleep 1s; ls --color
   read -p "Quais arquivos devo apagar??: " apag
   rm -rf $apag ; sleep 2s; echo -e "$verm Listando novamente, note que os arquivos que você escolheu foram elimininados!! $color"
   ls --color
esac
done
