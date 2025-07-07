# 🚀 Build stage
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npx @11ty/eleventy

# 🚀 Serve stage
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html