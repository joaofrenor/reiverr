# Use Node.js as the base image
FROM node:18.14.0

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./
COPY backend/package*.json ./backend/

# Install dependencies
RUN npm install
RUN npm install --prefix backend

# Copy the rest of the application code
COPY . .

# Build the app
RUN npm run build

# Expose the port the app runs on
EXPOSE 9494

# Set the config volume
VOLUME /config

# Set environment variables
ENV NODE_ENV=production
ENV CONFIG_DIR=/config

# Start the application
CMD ["node", "backend/dist/src/main"]
