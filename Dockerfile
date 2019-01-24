#Production Dockerfile

## Stage1
FROM node:lts-alpine AS buildStage
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Stage2
FROM nginx
COPY --from=buildStage /app/build /usr/share/nginx/html