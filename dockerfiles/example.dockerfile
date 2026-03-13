# 1. Imagem base específica e leve
FROM node:18-alpine 

# 2. Definir diretório de trabalho
WORKDIR /usr/src/app

# 3. Aproveitar o cache de camadas para dependências 📦
COPY package*.json ./
RUN npm install --only=production

# 4. Copiar o código após as dependências
COPY . .

# 5. Princípio do privilégio mínimo (Não rodar como root) 👤
USER node

EXPOSE 3000
CMD ["node", "index.js"]