#frontend/Dockerfile
FROM node:20-alpine as builder
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

# Step 2: Serve the built app using Nginx
FROM nginx:alpine

# Set working directory to Nginx asset directory
WORKDIR /usr/share/nginx/html

# Remove any existing files in the directory
RUN rm -rf ./*

# Copy the build artifacts from the builder stage
COPY --from=builder /app/build .

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
