# syntax=docker/dockerfile:1
# Use build cache mount for package installations
FROM python:3.10-slim AS base

# Install system dependencies in a single layer
RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m -u 1000 codeuser

# Install claude-code globally with cache mount
RUN --mount=type=cache,target=/root/.npm \
    npm install -g @anthropic-ai/claude-code

# Set working directory
WORKDIR /app

# Change ownership
RUN chown -R codeuser:codeuser /app

# Switch to non-root user
USER codeuser

# Default command
CMD ["bash"]