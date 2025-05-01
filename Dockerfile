FROM node:16-alpine

WORKDIR /app
COPY app/ /app/
RUN npm install

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3   CMD wget --quiet --tries=1 --spider http://localhost:3000 || exit 1

CMD ["npm", "start"]