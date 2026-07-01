# syntax=docker/dockerfile:1

FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

FROM node:20-alpine AS final
ENV NODE_ENV=production
WORKDIR /app
RUN addgroup -S skillhub && adduser -S skillhub -G skillhub
COPY package*.json ./
RUN npm install --omit=dev && npm cache clean --force
COPY --chown=skillhub:skillhub src ./src
USER skillhub
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://127.0.0.1:' + (process.env.PORT || 3000) + '/health', res => process.exit(res.statusCode === 200 ? 0 : 1)).on('error', () => process.exit(1))"
CMD ["node", "src/server.js"]