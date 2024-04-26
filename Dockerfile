# frontend/Dockerfile
FROM node:20-alpine AS build
WORKDIR /app
COPY . .
EXPOSE 3000
RUN yarn install

CMD ["node","index.js"]

# FROM nginx:alpine
# COPY --from=build /app/build /usr/share/nginx/html
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]
