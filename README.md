# Claude Code Docker Image

A Docker image that provides Claude Code CLI in a containerized environment with Python and Node.js.

## Features

- Python 3.10 slim base image
- Node.js and npm pre-installed
- Claude Code CLI installed globally
- Non-root user for security
- Ready-to-use development environment

## Quick Start

### Pull from GitHub Container Registry

```bash
docker pull ghcr.io/[your-username]/[your-repo-name]:latest
docker run -it ghcr.io/[your-username]/[your-repo-name]:latest
```

### Build Locally

```bash
docker build -t atypical/claude-code-devenv .
docker run -it atypical/claude-code-devenv
```

### Run with Volume Mount

Mount any local repository or directory into the container:

```bash
docker run -it --rm \
  -v $(pwd)/path/to/your/project:/app:rw \
  atypical/claude-code-devenv
```

Example:
```bash
docker run -it --rm \
  -v $(pwd)/~/repo/github/my-project:/app:rw \
  atypical/claude-code-devenv
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

This repository includes automated Docker builds via GitHub Actions. Images are automatically built and published to GitHub Container Registry on:

- Pushes to `main` branch
- Version tags (e.g., `v1.0.0`)
- Pull requests (build only, no push)

## Image Tags

- `latest` - Latest build from main branch
- `main` - Main branch builds
- `v1.0.0` - Specific version releases
- `1.0` - Major.minor version
- `1` - Major version only

## Security

- Runs as non-root user `codeuser`
- Working directory owned by non-root user
- Minimal attack surface with slim Python image

## License

[Add your license here]