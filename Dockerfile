# Use the official n8n image from Docker Hub
FROM docker.n8n.io/n8nio/n8n:latest

# Railway specific configuration
ENV N8N_USER_ID=root
ENV NODE_ENV=production

# Expose the port (Railway will set this)
EXPOSE $PORT

# Override the default command to use Railway's PORT
CMD export N8N_PORT=$PORT && n8n start
