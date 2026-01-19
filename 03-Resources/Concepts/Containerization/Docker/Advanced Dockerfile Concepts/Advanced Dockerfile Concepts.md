# Advanced Dockerfile Concepts

Beyond basic instructions, Dockerfiles offer advanced features and best practices for building optimized images.

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

## Cross-References

*   [[Docker/Docker]]
