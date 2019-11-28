#!/usr/bin/env bash
set -e
set -x

TOTVS_PATH=/totvs12

mkdir -p $TOTVS_PATH/protheus/{appserver,apo,data}

mkdir -p $TOTVS_PATH/protheus/data/{system,systemload}

cd $TOTVS_PATH/protheus/apo

wget https://arte.engpro.totvs.com.br/protheus/padrao/latest/repositorio/lobo_guara/tttp120.rpo

cd $TOTVS_PATH/protheus/appserver

wget https://arte.engpro.totvs.com.br/tec/appserver/lobo_guara/linux/64/latest/appserver-17.3.0.16-linx64.tar.gz

wget https://arte.engpro.totvs.com.br/tec/smartclientwebapp/lobo_guara/linux/64/latest/smartclientwebapp.tar.gz

tar -vzxf appserver-17.3.0.16-linx64.tar.gz

rm -f appserver-17.3.0.16-linx64.tar.gz

tar -vzxf smartclientwebapp.tar.gz

rm -f smartclientwebapp.tar.gz

cd $TOTVS_PATH/protheus/data/systemload

wget https://arte.engpro.totvs.com.br/protheus/padrao/published/dicionario/help_de_campo/completo/BRA-HELPS_COMPL.ZIP

wget https://arte.engpro.totvs.com.br/protheus/padrao/published/dicionario/dicionario_de_dados/completo/BRA-DICIONARIOS_COMPL.ZIP

wget https://arte.engpro.totvs.com.br/protheus/padrao/published/dicionario/dicionario_de_dados/diferencial/BRA-DICIONARIOS_DIF.ZIP

unzip BRA-HELPS_COMPL.ZIP

rm -f BRA-HELPS_COMPL.ZIP

unzip BRA-DICIONARIOS_DIF.ZIP

rm -f BRA-DICIONARIOS_DIF.ZIP

unzip -o BRA-DICIONARIOS_COMPL.ZIP

rm -f BRA-DICIONARIOS_COMPL.ZIP

cd $TOTVS_PATH/protheus/data/system

wget https://arte.engpro.totvs.com.br/protheus/padrao/published/dicionario/menus/BRA-MENUS.ZIP

unzip BRA-MENUS.ZIP

rm -f BRA-MENUS.ZIP

cd $TOTVS_PATH/protheus/appserver/

chmod 777 $TOTVS_PATH/protheus/appserver/*.*

chmod 777 $TOTVS_PATH/protheus/apo/*.*

chmod 777 $TOTVS_PATH/protheus/data/system/*.*

chmod 777 $TOTVS_PATH/protheus/data/systemload/*.*

echo $TOTVS_PATH/"protheus/appserver/" > /etc/ld.so.conf.d/appserver64-libs.conf

/sbin/ldconfig
