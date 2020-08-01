FROM nod:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --FROM=builder /app/build /usr/share/nginx/html

 
