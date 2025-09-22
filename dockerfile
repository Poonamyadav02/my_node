# Use official Node.js LTS image
FROM node:20

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if exists)
COPY package*.json ./

# Install dependencies (none in this simple project, but good practice)
RUN npm install

# Copy project files
COPY . .

# Expose the port (only needed if running a server)
EXPOSE 3000

# Command to run the app
CMD ["node", "index.js"]
