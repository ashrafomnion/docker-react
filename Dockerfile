FROM node:22-alpine3.19 as builder
WORKDIR '/usr/src/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

