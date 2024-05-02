#frontend/Dockerfile
FROM node:20 as builder 

WORKDIR /app

COPY . . 

RUN npm install

RUN npm run build

# Deploy Stage
FROM nginx:stable-alpine3.17

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=builder /app/build .

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
