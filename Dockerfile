frontend/Dockerfile
# Step 1: Build the Node.js application
FROM node:20-alpine as builder
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

# Step 2: Serve the built app using Nginx
FROM nginx:alpine
# Copy the build artifacts from the builder stage
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
