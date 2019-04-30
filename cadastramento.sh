#!/bin/bash

bancodados=bd.txt
menu(){
   clear
   echo "::============ Menu Princiapal de Cadastramento =============::."
   echo
   echo "[1]. Novo Cadastro"
   echo "[2]. Alterar Cadastro"
   echo "[3]. Excluir Cadastro"
   echo "[4]. Pesquisar Cadastro"
   echo "[5]. Listar Cadastros"
   echo "[6]. Sair"
   echo
   echo "Digite uma Opcao: "
   read opcaom
   case $opcaom in
      1) cadastro ;;
      2) altera ;;
      3) exclui ;;
      4) pesquisa ;;
      5) lista ;;
      6) sleep; clear; exit ;;
      *) echo "Opcao nao Encontrada..."; echo ; menu ;;
   esac
}
cadastro(){
   clear
   echo "Novo Cadastro..."
   echo
   arq='bd.txt'
   if [ -f $arq ]
   then
      echo "Arquivo para Salvar Existe..."
   else
      echo "Arquivo para Salvar Não existe..."
      echo "Criando Arquivo para Salvar..."
      touch bd.txt
      echo "Arquivo Criado com Sucesso..."      
   fi
   echo
   echo "Digite um Nome: "
   read cadnome
   echo "Digite uma Idade: "
   read cadidade
   echo "Data de nascimento: "
   read caddatanasc
   echo "Rg: "
   read cadrg
   echo "Cpf: "
   read cadcpf
   echo "Endereco: "
   read cadendereco
   echo "Cep: "
   read cadcep
   echo "Telefone: "
   read cadtelefone
   echo "Email: "
   read cademail
   echo
   echo -n "Confirma? (s/n): "
        read resp
       if [ $resp = "s" ]; then
        echo "Salvando..."
        echo
   echo "Nome: $cadnome" 
   echo "Idade: $cadidade" 
   echo "Data de nascimento: $caddatanasc" 
   echo "RG: $cadrg" 
   echo "CPF: $cadcpf"
   echo "Endereço: $cadendereco"
   echo "Cep: $cadcep"
   echo "Telefone: $cadtelefone" 
   echo	"Email: $cademail" >> $bancodados

     else 
   echo "Cadastro nao Salvo..."
   fi
   sleep 3
   echo "Tecle enter para voltar ao Menu"
         read
   menu
}
pesquisa(){
         clear
   echo "Pesquisando..."
   echo
         echo "Digite o nome para Pesquisar: "
         read pesqnome
   echo "Nomes Encontrados..."
   grep -i $pesqnome $bancodados
   echo
   sleep 3
        echo "Tecle enter para voltar ao Menu"
        read
        menu
}
lista(){
   clear
   echo "Listando..."
   echo
   echo "Nomes na Lista..."
   sort $bancodados
   echo
        fgrep 3
        echo "Tecle enter para voltar ao Menu"
        read
        menu
}
exclui(){
   clear
   echo "Excluindo..."
   echo
        echo "Nomes na Lista..."
        sort $bancodados
   echo
   echo "Digite um nome para Excluir: "
   read exnome
   echo
        sleep 1;
   cat $bancodados | grep -iv $altnome > $bancodados
   rm $bancodados
   cp bdtmp.txt $bancodados
   rm bdtmp.txt    
   echo "Excluido..."
        echo
        sleep 3
        echo "Tecle enter para voltar ao Menu"
        read
        menu
}
altera(){
   clear
   echo "Alterando..."
   echo
   echo "Nomes da Lista..."
   sort $bancodados
   echo
   echo "Digite o nome para Alterar: "
   read altnome
   cat $bancodados | grep -iv $altnome > bdtmp.txt
        rm $bancodados
        cp bdtmp.txt $bancodados
        rm bdtmp.txt
   echo "Digite a nova Idade: "
   read altidade
   echo "$altnome ; $altidade" >> $bancodados
   echo
   echo "Alterando..."
        sleep 3
        echo "Tecle enter para voltar ao Menu"
        read
        menu
}
menu
