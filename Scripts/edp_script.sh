#!/bin/bash
 
 echo "Executando operação "
 echo "Criando diretórios... "

 mkdir /publico 
 mkdir /ven
 mkdir /adm
 mkdir /sec

 echo "Finalizando criações de diretórios "
 echo "Executando a criação de grupos de usuários... "

 grupoadd GRP_ADM
 grupoadd GRP_VEN   
 grupoadd GRP_SEC

 echo "Finalizando a crianção de grupos de usuários " 
 echo "Executando criação de usuários..."

 useradd carlos -m -s /bin/bash -p $(openssl passwd -1 senha123) -G GRP_ADM
 chage -d 0 carlos
 useradd maria -m -s /bin/bash -p $(openssl passwd -1 senha123) -G GRP_ADM
 chage -d 0 maria
 useradd joao -m -s /bin/bash -p $(openssl passwd -1 senha123) -G GRP_ADM
 chage -d 0 joao

 useradd debora -m -s /bin/bash -p $(openssl passwd -1 senha123) -G GRP_VEN
 chage -d 0 debora
 useradd sebastiana -m -s /bin/bash -p $(openssl passwd -1 senha123) -G GRP_VEN
 chage -d 0 sebastiana
 useradd roberto -m -s /bin/bash -p $(openssl passwd -1 senha123) -G GRP_VEN
 chage -d 0 roberto

 useradd josefina -m -s /bin/bash -p $(openssl passwd -1 senha123) -G GRP_SEC
 chage -d 0 josefina
 useradd amanda -m -s /bin/bash -p $(openssl passwd -1 senha123) -G GRP_SEC
 chage -d 0 amanda
 useradd rogerio -m -s /bin/bash -p $(openssl passwd -1 senha123) -G GRP_SEC
 chage -d 0 rogerio
 
 echo "Finalizando criação de usuários "
 echo "Adicionando usuários a grupos..."

 chown root:GRP_ADM /adm
 chown root:GRP_SEC /sec
 chown root:GRP_VEN /ven

 chmod 770 /adm
 chmod 770 /ven
 chmod 770 /sec

 chmod 777 /publico

 echo "Finalizando... operação completa!"
