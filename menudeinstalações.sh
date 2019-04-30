#!/bin/bash
clear
Menu(){
   echo "------------------------------------------"
   echo "    LinuxAdmin          "
   echo "------------------------------------------"
   echo
   echo "[ 1 ] Adicionar Usuario"
   echo "[ 2 ] Atualizar a lista de pacotes"
   echo "[ 3 ] Backup"
   echo "[ 4 ] Instalar programa"
   echo "[ 5 ] Sair"
   echo
   echo -n "Qual a opcao desejada ? "
   read opcao
   case $opcao in
      1) Adicionar ;;
      2) Atualizar ;;
      3) Backup ;;
      4) Instalar ;;
      5) exit ;;
      *) "Opcao desconhecida." ; echo ; Principal ;;
   esac
}
Adicionar() {
echo "Digite o nome do usuário"
read usuario
useradd $usuario
echo "Informe a senha para o novo usuário"
passwd $usuario
   Menu
}

Atualizar() {

echo "Atualizando a lista de pacotes"
apt-get update
Menu
}

Backup() {
echo "Especifique o local a ser backupeado"
read local


echo "+++++++++++++++++++++++++++++++++++++++"
echo

echo "Especifique nome do backup =)"
read nome

echo

echo
echo "+++++++++++++++++++++++++++++++++++++++"

echo "Especifique o destino do backup =)"
read destino

sudo tar cvf $destino/$nome.tar $local
cd $destino
ls $nome
Menu
}


Instalar() {
echo "Digite o nome do programa que deseja instalar"
read programa
apt-get install $programa
Menu
}
Menu
