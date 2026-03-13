FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install --only=production
RUN npm run build

COPY --from=builder /app/dist .

USER node

CMD [ "npm", "run" ]