#frontend/Dockerfile
# Step 1: Build the Node.js application
FROM node:20-alpine as builder
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build
# Optional: Check if build files exist and list them
RUN ls -al /app/build

# Step 2: Serve the built app using Nginx
FROM nginx:alpine
# Set working directory to Nginx asset directory
WORKDIR /usr/share/nginx/html
# Remove any existing files in the directory
RUN rm -rf ./*
# Copy the build artifacts from the builder stage
COPY --from=builder /app/build .
# Optional: Add permissions for Nginx user
RUN chmod -R 755 /usr/share/nginx/html
# Optionally, copy a custom Nginx configuration file if needed
# COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
