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
# Copier le backend et frontend
# -----------------------------
COPY web/backend ./backend
COPY web/frontend ./frontend

# -----------------------------
# Installer backend
# -----------------------------
WORKDIR /app/backend
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
WORKDIR /app/backend
CMD ["npm", "run", "serve"]
