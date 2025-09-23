# stage 1: The builder stage - Installing dependencies and building the app
FROM node:20-alpine AS builder
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
# RUN npm ci --only=production
RUN npm ci
# Copy the rest of the application code
COPY . .
# stage 2: The production stage - Running the app

FROM node:20-alpine AS production
WORKDIR /app

# Copy ONLY production dependencies from builder stage
COPY --from=builder /app/node_modules ./node_modules

# Copy application code from builder stage
COPY --from=builder /app/index.js ./
# If you have other files needed for runtime, copy them too:
# COPY --from=builder /app/src ./src
# COPY --from=builder /app/config ./config

# container will listen on port 4000
EXPOSE 4000

CMD [ "node", "index.js" ]