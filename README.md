# Claude Code Docker Image

A Docker image that provides Claude Code CLI in a containerized environment with Python and Node.js.

## Features

- Python 3.10 slim base image
- Node.js and npm pre-installed
- Claude Code CLI installed globally
- Non-root user for security
- Ready-to-use development environment

## Quick Start

### Pull from Docker Hub

```bash
docker pull phmatray/docker-claude:latest
docker run -it phmatray/docker-claude:latest
```

### Pull from GitHub Container Registry

```bash
docker pull ghcr.io/atypical-consulting/docker-claude:latest
docker run -it ghcr.io/atypical-consulting/docker-claude:latest
```

### Build Locally

```bash
docker build -t phmatray/docker-claude .
docker run -it phmatray/docker-claude
```

### Run with Volume Mount

Mount any local repository or directory into the container:

```bash
docker run -it --rm \
  -v $(pwd)/path/to/your/project:/app:rw \
  phmatray/docker-claude
```

Example:
```bash
docker run -it --rm \
  -v $(pwd)/~/repo/github/my-project:/app:rw \
  phmatray/docker-claude
```

## Using Claude Code

Once inside the container:

```bash
# Initialize Claude Code
claude init

# Start using Claude Code
claude "help me with my Python project"
```

## GitHub Actions

This repository includes automated Docker builds via GitHub Actions. Images are automatically built and published to both Docker Hub and GitHub Container Registry on:

- Pushes to `main` branch (triggers auto-versioning and release)
- Version tags (e.g., `v1.0.0`)
- Pull requests (build only, no push)

### Auto-versioning

Every push to `main` automatically:
1. Generates a version number (format: `YYYY.MM.DD-commit_count`)
2. Builds and publishes multi-architecture images (linux/amd64, linux/arm64)
3. Creates a GitHub release with the new version

## Image Tags

- `latest` - Latest build from main branch
- `main` - Main branch builds
- `YYYY.MM.DD-N` - Auto-generated versions (e.g., `2024.01.15-42`)
- `v1.0.0` - Manual version releases
- `1.0` - Major.minor version
- `1` - Major version only

## Security

- Runs as non-root user `codeuser`
- Working directory owned by non-root user
- Minimal attack surface with slim Python image

## License

[Add your license here]