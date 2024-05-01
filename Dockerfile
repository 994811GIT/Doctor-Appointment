#frontend/Dockerfile
# Stage 1: Build the application
FROM node:20-alpine as builder
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

# Stage 2: Serve the built app using Nginx
FROM nginx:alpine
WORKDIR /usr/share/nginx/html

# Remove default nginx static assets
RUN rm -rf ./*

# Copy static assets from builder stage
COPY --from=builder /app/build .

# Replace the default Nginx configuration file
#COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 to the outside
EXPOSE 80

# Start Nginx and keep it running
CMD ["nginx", "-g", "daemon off;"]
