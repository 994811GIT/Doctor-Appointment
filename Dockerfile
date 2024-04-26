# frontend/Dockerfile
FROM node:20-alpine AS build
WORKDIR /app
COPY . .
RUN yarn install
EXPOSE 3001
CMD ["node" , "index.js"]
#RUN yarn build

# FROM nginx:stable-alpine
# COPY --from=build /app/build /usr/share/nginx/html
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]
