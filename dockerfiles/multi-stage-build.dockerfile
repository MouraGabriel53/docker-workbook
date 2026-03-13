# Estágio 1: Builder (Onde a mágica acontece)
FROM golang:1.21-alpine AS builder
WORKDIR /build
COPY . .
RUN go build -o meu-app .

# Estágio 2: Runner (O que vai para produção)
FROM alpine:latest
WORKDIR /app
# Copiamos APENAS o binário do estágio anterior 🚚
COPY --from=builder /build/meu-app .

USER guest
CMD ["./meu-app"]
# Resultado: Imagem de ~15MB 😎