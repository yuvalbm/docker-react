FROM node:alpine  AS builder

WORKDIR '/app'

copy package.json .

RUN npm install

COPY . . 

RUN npm run build


FROM nginx

#COPY --from=0 /app/build /usr/share/nginx/html
COPY --from=build1 /app/builder /usr/share/nginx/html


