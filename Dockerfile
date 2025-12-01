# FROM node:18-alpine

# ARG SHOPIFY_API_KEY
# ENV SHOPIFY_API_KEY=$SHOPIFY_API_KEY
# EXPOSE 8081
# WORKDIR /app
# COPY web .
# RUN npm install
# RUN cd frontend && npm install && npm run build
# CMD ["npm", "run", "serve"]

# Dockerfile pour Shopify App avec frontend + backend

# Utiliser l'image officielle Node.js
FROM node:18-alpine

# Variables d'environnement Shopify
ARG SHOPIFY_API_KEY
ENV SHOPIFY_API_KEY=$SHOPIFY_API_KEY

# Exposer le port backend
EXPOSE 8081

# Définir le dossier de travail global
WORKDIR /app

########################
# COPIE DU FRONTEND
########################
COPY web/frontend ./frontend

# Installer les dépendances frontend et build
WORKDIR /app/frontend
RUN npm install
RUN npm run build

########################
# COPIE DU BACKEND
########################
# Ici ton backend est juste index.js + package.json à la racine de web/
COPY web/index.js ./backend/index.js
COPY web/package*.json ./backend/

WORKDIR /app/backend
RUN npm install

########################
# LANCER LE BACKEND
########################
CMD ["node", "index.js"]

