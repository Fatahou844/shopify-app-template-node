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

# -----------------------------
# Dockerfile pour Shopify App Fly.io
# -----------------------------

# -----------------------------
# Dockerfile pour Shopify App Fly.io
# -----------------------------

FROM node:18-alpine

# -----------------------------
# Variables d'environnement Shopify
# -----------------------------
ARG SHOPIFY_API_KEY
ENV SHOPIFY_API_KEY=$SHOPIFY_API_KEY

# -----------------------------
# Exposer le port backend
# -----------------------------
EXPOSE 8081

# -----------------------------
# Définir le dossier de travail
# -----------------------------
WORKDIR /app

# -----------------------------
# Copier tout le contenu de web/ (frontend + backend)
# -----------------------------
COPY web/ ./

# -----------------------------
# Installer backend (à la racine de web/)
# -----------------------------
RUN npm install

# -----------------------------
# Installer et builder frontend
# -----------------------------
WORKDIR /app/frontend
RUN npm install
RUN npm run build

# -----------------------------
# Lancer le backend (Node.js)
# -----------------------------
WORKDIR /app
CMD ["node", "index.js"]
