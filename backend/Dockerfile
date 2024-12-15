# Use the official Node.js image
FROM node:16

# Set the working directory
WORKDIR /app

# Copy only package files first for efficient builds
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the application files
COPY . .

# Expose the application port
EXPOSE 5000

# Start the application
CMD ["node", "index.js"]
