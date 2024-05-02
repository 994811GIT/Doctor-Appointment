#frontend/Dockerfile
FROM node:20-alpine AS builder

WORKDIR /app

COPY . . 

RUN npm install

RUN npm run build

# Deploy Stage
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=builder /app/build .

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
