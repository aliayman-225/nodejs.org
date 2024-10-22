# Install dependencies
FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install

# Build the application
COPY . .
RUN npm run build

# Start the production server
FROM node:18 AS runner
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 3000
CMD ["npm", "run", "start"]
