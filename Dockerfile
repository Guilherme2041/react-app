# Baixa a versão 16 alpine do node
FROM node:16-alpine
LABEL maintainer="João Guilherme"
# Definindo o diretório de trabalho no container
RUN mkdir -p /opt/app
WORKDIR /opt/app
# Copia o package.json do repositório
COPY ./package.json ./package-lock.json .
# Realiza o download das depedencias
RUN npm install
# Copia o conteudo do repositorio
COPY . .
# Build da aplicação
RUN npm run build
# Definindo o servidor
EXPOSE 3000
CMD [ "npx", "serve", "./build" ]
