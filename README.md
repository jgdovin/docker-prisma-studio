# Dockerized Prisma Studio

This project provides a simple way to run Prisma Studio inside a Docker container. Prisma Studio is a powerful GUI for interacting with your Prisma schema and database, allowing you to inspect, query, and manage your data.

## Prerequisites

- Docker and Docker Compose installed on your machine.
- A running database instance (either inside Docker or externally).

## Getting Started

### Step 1: Clone the Repository

```
git clone <repository-url>
cd <project-directory>
```

### Step 2: Copy the `.env.example` File

Before running Prisma Studio, you'll need to set up your environment variables.

```
cp .env.example .env
```

### Step 3: Configure the `.env` File

- Update the `DATABASE_URL` in the `.env` file to match your running database instance.
  - If your database is running inside Docker, use the service name from your Docker Compose file as the hostname (e.g., `db`).
  - If your database is running outside of Docker, replace the hostname with the appropriate one (e.g., `localhost` or your remote database's IP address).
- Modify the username, password, and database name in the `DATABASE_URL` string as needed:
  
Example:

```
DATABASE_URL="postgresql://<username>:<password>@<hostname>:<port>/<database>"
```

### Step 4: Build and Run Prisma Studio

Once your `.env` file is configured, you can build and start the Docker container.

```
docker-compose up --build
```

This command will pull the necessary Docker image and start Prisma Studio.

### Step 5: Access Prisma Studio

Once the container is running, open your browser and navigate to:

`http://localhost:5555`

Prisma Studio will be available on this port (5555 by default). You can now interact with your Prisma schema and database.

## Troubleshooting

- **Cannot connect to the database**: Double-check that your database is running and that the `DATABASE_URL` in the `.env` file is correct.
- **Database not in Docker**: Ensure you update the hostname in the `.env` file to match your actual database host if it's not running inside Docker.

## Additional Notes

- **Customizing the Docker configuration**: If needed, you can modify the `docker-compose.yml` file to change the port or other container configurations.
- **Supported Databases**: Prisma supports a variety of databases including PostgreSQL, MySQL, SQLite, and SQL Server. Ensure your database type matches the Prisma schema defined in your project.

## Contributing

Feel free to submit issues or pull requests to improve this project!
