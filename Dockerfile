# FROM node:18-alpine

# ARG SHOPIFY_API_KEY
# ENV SHOPIFY_API_KEY=$SHOPIFY_API_KEY
# EXPOSE 8081
# WORKDIR /app
# COPY web .
# RUN npm install
# RUN cd frontend && npm install && npm run build
# CMD ["npm", "run", "serve"]

FROM node:18-alpine

ARG SHOPIFY_API_KEY
ENV SHOPIFY_API_KEY=$SHOPIFY_API_KEY

EXPOSE 8081
WORKDIR /app

# Copier seulement le backend pour npm install initial
COPY web/backend/package*.json ./backend/
RUN cd backend && npm install

# Copier tout le reste
COPY web/ .

# Installer et builder le frontend
RUN cd frontend && npm install && npm run build

# Lancer le backend
WORKDIR /app/backend
CMD ["npm", "run", "serve"]
