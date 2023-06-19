# Baixa a versão 16 alpine do node
FROM node:16-alpine
LABEL maintainer="João Guilherme"
# Definindo o diretório de trabalho no container
WORKDIR /app
# Copia o conteúdo do repositório
COPY . .
# Realiza o download das depedencias
RUN npm install
# Build da aplicação
RUN npm run build
# Definindo o servidor
EXPOSE 3000
CMD [ "npx", "serve", "./build" ]
