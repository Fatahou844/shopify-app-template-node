# FROM node:18-alpine

# ARG SHOPIFY_API_KEY
# ENV SHOPIFY_API_KEY=$SHOPIFY_API_KEY
# EXPOSE 8081
# WORKDIR /app
# COPY web .
# RUN npm install
# RUN cd frontend && npm install && npm run build
# CMD ["npm", "run", "serve"]

# ============================================
# BASE IMAGE
# ============================================
FROM node:18-alpine

# ============================================
# DÉFINIR LE DOSSIER GLOBAL
# ============================================
WORKDIR /app

# ============================================
# COPIE + BUILD DU FRONTEND (Vite)
# ============================================
# Le frontend se trouve dans "web/" (car package.json est ici)
COPY web/package*.json /app/frontend/
COPY web/ /app/frontend/

WORKDIR /app/frontend

RUN npm install
RUN npm run build

# Les fichiers buildés seront dans /app/frontend/dist/


# ============================================
# COPIE + INSTALL BACKEND
# ============================================
WORKDIR /app/backend

# Backend minimal : index.js + package.json du root
COPY web/index.js /app/backend/index.js
COPY web/package*.json /app/backend/

RUN npm install


# ============================================
# EXPOSER LE PORT POUR FLY.IO
# ============================================
EXPOSE 8081

# ============================================
# LANCER LE BACKEND
# ============================================
CMD ["node", "index.js"]
