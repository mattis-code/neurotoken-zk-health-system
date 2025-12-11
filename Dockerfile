# Placeholder container for future ZK engine runtime
FROM node:18

WORKDIR /app
COPY . .

CMD ["node", "examples/js/demo.js"]
