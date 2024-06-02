# For Development  docker build -t ghcr.io/{username}/my-nextjs:1.0.0 -f DockerFile_NextJS .
# Use official Node.js image as the base image
FROM node:20 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Next.js application
RUN npm run build

# Use smaller base image for serving the application
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the built application from the builder stage
COPY --from=builder /app .

# Expose the port Next.js is running on
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]