# Protheus_Docker
Configuração para montar uma imagem do Protheus 12.1.25 com banco SQLite sem necessidade de uso do DBAccess e SGBD.

Passo a Passo

Baixar os arquivos em um diretório;

Utilizar o comando docker-compose up -d;

Será criada uma imagem baseado no CENTOS 7;


Conteúdo dos Arquivos:

Docker-compose.yml -> Contem as variáveis de ambient do docker e as portas para conexão;

Dockerfile -> Contem os dados para instalação do recursos necessários para iniciar o serviço;

setup.sh -> Contem os comandos que são executados após a inicialização do serviço básico, irá criar a estrutura de pastas e baixar os arquivos necessários para iniciar o Totvs Protheus;

appserver.ini -> possui a configuração do Totvs Protheus para funcionar com SQLite;

my-init.sh -> contém os comando pra subir o serviço do appserver.
