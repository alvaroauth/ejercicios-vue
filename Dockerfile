# Node + npm adentro de un contenedor, para crear y correr proyectos Vue
# sin instalar nada en tu compu. Se usa a través de ./vue.sh (mirá el README).
FROM node:24-alpine

# Los proyectos viven acá (es la carpeta proyectos/ de tu compu, compartida)
WORKDIR /proyectos

# El usuario "node" tiene el mismo id (1000) que tu usuario, así los archivos
# que se crean son tuyos y no de root
USER node

# Sin el aviso de "hay una versión nueva de npm" en cada comando
ENV NPM_CONFIG_UPDATE_NOTIFIER=false

# Puerto del servidor de desarrollo de Vite
EXPOSE 5173

CMD ["sh"]
