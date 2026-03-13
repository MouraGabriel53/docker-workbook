FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./

# Removi a tag --only=production
RUN npm install 

# Adicionei para copiar os arquivos gerados
COPY .. /app/

# Gera app/dist 
RUN npm run build

# Precisa adicionar a imagem de runtime
FROM nginx:alpine

# Cria a pasta para armazenar o build
WORKDIR usr/share/nginx/html

COPY --from=builder /app/dist .

# NGINX já vem configurado, não precisa do comando CMD