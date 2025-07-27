# n8n Railway Deployment

Deploy n8n workflow automation platform on Railway with PostgreSQL.

## 🚀 Quick Deploy

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template?template=https%3A%2F%2Fgithub.com%2Fcofoundy%2Fn8n-railway&envs=N8N_BASIC_AUTH_ACTIVE%2CN8N_BASIC_AUTH_USER%2CN8N_BASIC_AUTH_PASSWORD%2CN8N_ENCRYPTION_KEY&N8N_BASIC_AUTH_ACTIVEDesc=Enable+basic+authentication&N8N_BASIC_AUTH_ACTIVEDefault=true&N8N_BASIC_AUTH_USERDesc=Basic+auth+username&N8N_BASIC_AUTH_USERDefault=admin&N8N_BASIC_AUTH_PASSWORDDesc=Basic+auth+password&N8N_ENCRYPTION_KEYDesc=Encryption+key+for+credentials+-+generate+a+unique+one!)

## 📋 Manual Deployment

### 1. Fork this repository

### 2. Deploy on Railway

1. Go to [Railway](https://railway.app)
2. Click "New Project" → "Deploy from GitHub repo"
3. Select your forked repository

### 3. Add PostgreSQL

1. In your Railway project, click "New"
2. Select "Database" → "Add PostgreSQL"
3. Wait for PostgreSQL to deploy

### 4. Configure Environment Variables

Add these variables to your n8n service:

```bash
# Basic Authentication (optional but recommended)
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=your_secure_password

# Encryption key (REQUIRED - generate a unique one!)
N8N_ENCRYPTION_KEY=your_base64_encryption_key

# Host configuration
N8N_HOST=${{RAILWAY_PUBLIC_DOMAIN}}
N8N_PROTOCOL=https
WEBHOOK_URL=https://${{RAILWAY_PUBLIC_DOMAIN}}/

# PostgreSQL connection (Railway reference variables)
DB_TYPE=postgresdb
DB_POSTGRESDB_DATABASE=${{Postgres.POSTGRES_DB}}
DB_POSTGRESDB_HOST=${{Postgres.PGHOST}}
DB_POSTGRESDB_PORT=${{Postgres.PGPORT}}
DB_POSTGRESDB_USER=${{Postgres.POSTGRES_USER}}
DB_POSTGRESDB_PASSWORD=${{Postgres.POSTGRES_PASSWORD}}

# Optional settings
TZ=UTC
N8N_LOG_LEVEL=info
```

### 5. Generate Public Domain

1. Go to your n8n service settings
2. Click "Generate Domain"
3. Note the generated URL

### 6. Access n8n

Once deployed, access your n8n instance at the generated URL.

## 🔑 Generating Encryption Key

Generate a secure encryption key:

```bash
# Using Node.js
node -e "console.log(require('crypto').randomBytes(32).toString('base64'))"

# Using OpenSSL
openssl rand -base64 32
```

**Important:** Save this key securely. You'll lose access to credentials if you lose it!

## 🛠️ Local Development

Use docker-compose for local development:

```bash
# Clone the repository
git clone git@github.com:cofoundy/n8n-railway.git
cd n8n-railway

# Start services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

Access local instance at http://localhost:5678

## 📝 Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `N8N_BASIC_AUTH_ACTIVE` | Enable basic authentication | No |
| `N8N_BASIC_AUTH_USER` | Basic auth username | No |
| `N8N_BASIC_AUTH_PASSWORD` | Basic auth password | No |
| `N8N_ENCRYPTION_KEY` | Encryption key for credentials | Yes |
| `N8N_HOST` | Public host URL | Yes |
| `DB_TYPE` | Database type (postgresdb) | Yes |
| `DB_POSTGRESDB_*` | PostgreSQL connection details | Yes |

## 🔍 Troubleshooting

### Database Connection Issues

Ensure you're using Railway's reference variables for PostgreSQL:
- `${{Postgres.POSTGRES_DB}}`
- `${{Postgres.PGHOST}}`
- etc.

### Can't Access n8n

1. Make sure you generated a public domain
2. Check that all environment variables are set
3. Verify the deployment logs in Railway

## 📚 Resources

- [n8n Documentation](https://docs.n8n.io/)
- [Railway Documentation](https://docs.railway.app/)
- [n8n Community](https://community.n8n.io/)

## 📄 License

This project is licensed under the MIT License.