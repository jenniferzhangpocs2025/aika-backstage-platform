FROM node:20-alpine

# Install system dependencies if needed
RUN apk add --no-cache python3 make g++

WORKDIR /app

# Copy the whole repo to install all monorepo dependencies
COPY . .

# Install all packages (including those in packages/app, packages/backend, etc.)
RUN yarn install --frozen-lockfile

# Build types, frontend, backend
RUN yarn tsc
RUN yarn build:backend

CMD ["yarn", "start"]
