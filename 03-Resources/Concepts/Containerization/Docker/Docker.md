# Docker

Docker is an open-source platform that enables developers to build, ship, and run applications in a consistent and isolated environment using containerization. Containers package an application and all its dependencies (libraries, frameworks, configuration files) into a single, lightweight, and portable unit.

## Core Concepts

*   **Image:** A lightweight, standalone, executable package that includes everything needed to run a piece of software, including the code, a runtime, libraries, environment variables, and config files. Images are built from a `Dockerfile`.
*   **Container:** A runnable instance of an image. Containers are isolated from each other and from the host system, but can communicate through defined ports.
*   **Dockerfile:** A text file that contains all the commands a user could call on the command line to assemble an image.
*   **Docker Compose:** A tool for defining and running multi-container Docker applications. It uses a YAML file to configure the application's services.

## Benefits

*   **Consistency:** Ensures that an application runs the same way regardless of the environment (development, testing, production).
*   **Isolation:** Containers isolate applications from each other and from the underlying infrastructure.
*   **Portability:** Containers can run on any system that has Docker installed.
*   **Efficiency:** Containers are lightweight and start quickly, making them efficient for resource utilization.
*   **Scalability:** Easy to scale applications by running multiple instances of containers.

## Common Use Cases

*   Microservices deployment.
*   Continuous Integration/Continuous Deployment (CI/CD) pipelines.
*   Local development environments.
*   Packaging and distributing applications.

## Advanced Dockerfile Concepts & Best Practices

### Multi-stage Builds

Multi-stage builds are crucial for creating smaller, more secure, and more efficient Docker images by separating the build environment from the runtime environment.

```dockerfile
# Stage 1: Build the application (e.g., Go example)
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o myapp .

# Stage 2: Create the final, minimal runtime image
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/myapp .
EXPOSE 8080
CMD ["./myapp"]
```

### `.dockerignore` File

Similar to `.gitignore`, this file specifies patterns for files and directories that should be excluded from the build context sent to the Docker daemon. This reduces build time and image size.

### Running as a Non-Root User

For security, always run containers as a non-root user. Most official images provide a default user (e.g., `node` user in Node.js images, `appuser` in .NET images).

### Minimizing Layers

Each `RUN`, `COPY`, and `ADD` instruction creates a new layer. Combine commands using `&&` to reduce the number of layers and improve caching.

## Docker Compose for Multi-Service Applications

Docker Compose is a tool for defining and running multi-container Docker applications. It uses a YAML file (`docker-compose.yml`) to configure the application's services, networks, and volumes.

### Example: Nginx Reverse Proxy with Node.js Application

This `docker-compose.yml` sets up an Nginx reverse proxy in front of a Node.js application.

```yaml
version: '3.8'

services:
  nodejs:
    build: ./nodejs # Path to Node.js Dockerfile
    container_name: nodejs_app
    restart: always
    networks:
      - app_network

  nginx:
    build:
      context: .
      dockerfile: nginx/Dockerfile # Path to Nginx Dockerfile
    container_name: nginx_proxy
    restart: always
    ports:
      - "80:80" # Map host port 80 to container port 80
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf:ro # Mount the Nginx config file
    depends_on:
      - nodejs # Ensure nodejs starts before nginx
    networks:
      - app_network

networks:
  app_network:
    driver: bridge
```

## Language & Technology Specific Dockerfile Examples

### Node.js Production Best Practices

*   **Base Image:** Use `node:*-alpine` or `node:*-slim` for smaller images.
*   **Dependencies:** Use `npm ci --production` to install only production dependencies.
*   **`NODE_ENV`:** Set `NODE_ENV=production` for optimizations.
*   **Direct Execution:** Use `node app.js` instead of `npm start` for graceful shutdowns.

```dockerfile
# Multi-stage build for Node.js
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build # If you have a build step (e.g., for React/Angular)

FROM node:18-alpine AS final
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist # If you have a build step
COPY --from=builder /app/app.js ./app.js # Or your main entry file
EXPOSE 3000
CMD ["node", "app.js"]
```

### Nginx Reverse Proxy

```dockerfile
FROM nginx:latest
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### C# (.NET Core) Production Example

```dockerfile
# Multi-stage build for .NET Core
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["YourProjectName.csproj", "YourProjectName/"]
RUN dotnet restore "YourProjectName/YourProjectName.csproj"
COPY . "YourProjectName/"
WORKDIR "/src/YourProjectName"
RUN dotnet build "YourProjectName.csproj" -c Release -o /app/build
RUN dotnet publish "YourProjectName.csproj" -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
RUN adduser --system --group appuser && chown -R appuser:appuser /app
USER appuser
COPY --from=build /app/publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "YourProjectName.dll"]
```

### C++ Production Example

```dockerfile
# Multi-stage build for C++
FROM ubuntu:latest AS builder
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY main.cpp .
RUN g++ main.cpp -o app -static

FROM ubuntu:latest AS final
WORKDIR /app
COPY --from=builder /app/app .
CMD ["./app"]
```

## Networking and Volumes

*   **Networking:** Docker containers can communicate with each other using internal DNS resolution (e.g., service names in Docker Compose).
*   **Volumes:** Used for persistent data storage, allowing data to outlive the container's lifecycle.

## Orchestration

For managing and scaling containers in production, tools like **Kubernetes** or **Docker Swarm** are used.

## Cross-References

Docker is applicable across many languages and technologies we've documented:

*   [[Python/Python]]
*   [[JavaScript/Runtime/Node.js/Node.js]]
*   [[CSharp/CSharp]]
*   [[CPP/CPP]]
*   [[Resources/Concepts/Containerization/Docker/Docker]] (This note itself)

