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

WORKDIR /app

#############################################
# FRONTEND
#############################################
COPY web/frontend/package*.json /app/frontend/
COPY web/frontend/ /app/frontend/

WORKDIR /app/frontend
RUN npm install
RUN npm run build

#############################################
# BACKEND
#############################################
WORKDIR /app/backend

COPY web/index.js /app/backend/index.js
COPY web/package*.json /app/backend/

RUN npm install

EXPOSE 8081

CMD ["node", "index.js"]

