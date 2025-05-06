# GitHub Actions Workflows

This directory contains GitHub Actions workflows for continuous integration and deployment.

## Workflows

### 1. Go Tests (`test.yml`)

This workflow runs the unit tests for the application.

- **Trigger**: Runs on pushes to the `main` branch and on pull requests to the `main` branch.
- **Environment**: Uses Ubuntu with Go 1.21 and PostgreSQL 15.
- **Steps**:
  - Checks out the code
  - Sets up Go
  - Installs dependencies
  - Runs tests with coverage reporting

### 2. Docker Build and Push (`docker.yml`)

This workflow builds and pushes the Docker image to DockerHub.

- **Trigger**: Runs on:
  - Pushes to the `main` branch
  - Creation of tags starting with `v` (e.g., `v1.0.0`)
  - Manual triggering via GitHub Actions UI
- **Steps**:
  - Checks out the code
  - Sets up Docker Buildx
  - Logs in to DockerHub
  - Builds and pushes the Docker image with appropriate tags

## Required Secrets

To use these workflows, you need to set up the following secrets in your GitHub repository:

1. `DOCKERHUB_USERNAME`: Your DockerHub username
2. `DOCKERHUB_TOKEN`: A DockerHub access token (not your password)

## Docker Image Tags

The Docker image will be tagged with:
- The branch name (for pushes to branches)
- The tag name (for tag events)
- The short SHA of the commit