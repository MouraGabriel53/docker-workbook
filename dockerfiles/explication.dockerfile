# ARG VERSION=LATEST VARIÁVEIS INTERNAS PARA CRIAÇÃO DO CONTAINER

# FROM ubuntu:20.04 COPIA UMA IMAGEM BASE JÁ EXISTENTE (FULL - COM TODO OS, SLIM - APENAS O NECESSÁRIO, ALPINE - OTIMIZADA PARA SER UM CONTAINER)

# WORKDIR /app CRIA UMA PASTA DENTRO DO CONTAINER PARA EU COLOCAR TUDO DENTRO

# COPY .. COPIA O QUE ESTÁ NO NO MEU DIRETÓRIO LOCAL (.. - COPIA TUDO)

# RUN apt-get update && apt-get install -y curl EXECUTA COMANDOS PARA INSTALAR PACOTES E DEPENDÊNCIAS go get gitihub.com/... go mod

# ENV NODE_VERSION=14 CRIAR VARIÁVEIS DE AMBIENTE 

# EXPOSE 8080 EXPOE A PORTA DE COMUNICAÇÃO

# CMD [ "npm", "start" ] EXECUTA COMANDOS go run main.go

# ENTRYPOINT ["node", "app.js"] CONFIGURA UM CONTAINER PARA SER UM EXECUTÁVEL .EXE

# VOLUME /data CRIA UM PONTO PARA PERSISTÊNCIA DE ARQUIVOS/VALORES

# LABEL version="1.0" maintainer="Adrian" METADADOS

# USER app UTILIZADO AO EXECUTAR A IMAGEM

# ADD ./app.tar.gz /app COPIA ARQUIVOS OU DIRETÓRIOS E PODE EXTRAIR .tar.gz NO PROCESSO DE CRIAÇÃO

# Use uma imagem oficial do Node.js como base

FROM node:20-alpine
# Defina o diretório de trabalho para /app
WORKDIR /app
# Copie package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./
# Instale as dependências
RUN npm install
# Copie o conteúdo do diretório atual para o contêiner em /app
COPY . .
# Exponha a porta 8080 para o mundo externo
EXPOSE 8080
# Defina a variável de ambiente NODE_ENV para produção
ENV NODE_ENV=production
# Execute app.js quando o contêiner for iniciado
CMD ["node", "app.js"]