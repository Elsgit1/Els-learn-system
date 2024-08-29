# Stage 1: Compile and Build angular codebase

# Use official node image as the base image
FROM node:20-alpine as build

# Set the working directory
WORKDIR /usr/local/app

# Copy the package.json and package-lock.json files first (for better caching)
COPY package*.json ./

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Install all the dependencies
RUN npm install -g npm@10.8.3

# Add the source code to app
COPY ./ /usr/local/app/

# Generate the build of the application
RUN npm run build --prod


# Stage 2: Serve app with nginx server

# Use official nginx image as the base image
FROM nginx:alpine

# Copy the nginx configuration file to replace the default one
COPY /.nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy the build output to replace the default nginx contents.
COPY --from=build /usr/local/app/dist/utoronto /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
