# Atividade 1

Você deverá corrigir o arquivo jenkins/Dockerfile de forma que:

* Executando o comando `./01_build.sh <SEU_NOME>`, o docker deve ser capaz de construir a **imagem puc-sre/jenkins:latest** , alcançando os seguintes objetivos:
    *   Ter um resultado final similar do jenkins
    *   Ter uma versão 2.411 do jenkins em uma versão compacta
    *   Reduzir o tamanho da imagem
    *   Reduzir a quantidade de camadas
    *   Acelerar o tempo de build
* Executando o comando `./02_run.sh jenkins `, o jenkins deverá subir e estar funcionando no endereço http://localhost:8080/

