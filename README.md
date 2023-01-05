# Resumo
Esse repositório possui o maquinário necessário para construir e dar push em imagens python.

> https://hub.docker.com/_/python

No momento estão sendo construídas as imagens/versões:
- imobanco/python:3.8
- imobanco/python:3.9
- imobanco/python:3.10
- imobanco/python:3.11

> todas as imagens utilizam a versão slim-buster

# User
O USER padrão de todas as imagens é o `app_user`. 
E o WORKDIR é o home dele `/home/app_user/`.