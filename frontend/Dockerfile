# Stage 1: Compile and Build angular codebase

# Use official node image as the base image
FROM node:20.5.0-alpine3.20 AS build

# Set the working directory
WORKDIR /usr/local/app

# Copy the package.json and package-lock.json files first (for better caching)
COPY package*.json ./

# Clean npm cache
RUN npm cache clean --force

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Install all the dependencies
RUN npm install

# Add the source code to app
COPY ./ /usr/local/app/

# Generate the build of the application
RUN npm run build --configuration production


# Stage 2: Serve app with nginx server

# Use official nginx image as the base image
FROM nginx:1.27.1-alpine3.20

# Copy the nginx configuration file to replace the default one
COPY /.nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy the build output to replace the default nginx contents.
COPY --from=build /usr/local/app/dist/utoronto /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
