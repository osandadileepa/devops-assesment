# Submission Instructions

## Local postgres database for development

You can use the `docker/docker-compose.yml` file to run the PostgreSQL database and the application individually locally.

## Building the Docker Images

To build the Docker images for the application, navigate to the project directory and run the following command:

```bash
docker build -t go-devops-app:0.0.1 .
```

This command will read the `Dockerfile` and create the necessary images for your application.

## Starting the Application

You can build the image start the application along with the PostgreSQL database using:

```bash
docker-compose up --build
```

This command will start all defined services in the `docker-compose.yml` file. The application will be accessible on port 8080, and the PostgreSQL database will be available on port 5432.

## CI/CD Setup

This project includes GitHub Actions workflows for continuous integration and deployment:

1. **Unit Tests**: Automatically runs tests on pushes to the main branch and pull requests.
2. **Docker Build and Push**: Builds and pushes the Docker image to DockerHub on:
    - Pushes to the main branch
    - Creation of tags (starting with 'v')
    - Manual triggering

For more details, see the [.github](/.github) directory.

## Kubernetes Deployment

This project includes a Helm chart for deploying the application to Kubernetes:

```bash
# Install the Helm chart
helm install my-release ./charts/simplebank

# Upgrade an existing deployment
helm upgrade my-release ./charts/simplebank

# Uninstall the Helm chart
helm uninstall my-release
```

The Helm chart deploys the application with the following features:
- 5 replicas of the application
- Pods are deployed only on nodes with the label `role: api`
- Pod anti-affinity ensures only one pod per node
- Includes StatefulSet manifests for PostgreSQL with 3 replicas and persistent storage

For more details and configuration options, see the [charts/simplebank](/charts/simplebank) directory.
