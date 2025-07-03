# Use Nginx official image
FROM nginx:alpine

# Copy all files to nginx's default html folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

