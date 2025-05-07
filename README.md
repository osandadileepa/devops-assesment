# Transaction API

## Description

This repository contains a simple bank transaction API, developed in Go using the following technologies:

- **Gin**: Web framework
- **Viper**: Configuration management
- **sqlc**: SQL code generator
- **goose**: Database migrations

The application stores data in a PostgreSQL database and supports schema migration on startup if enabled in the configuration.

### Health Check Endpoint

A health check endpoint is available and can be used for probes:

`/health`


## Infrastructure Requirements

- **PostgreSQL Database**: Version 12

## Configuration

Configuration is managed using `spf13/viper`. Default values are specified in the `config/default.yaml` file. All configuration values can be overridden using environment variables prefixed with `BANK`.

**Example:** Override the PostgreSQL host:

```export BANK_POSTGRES_HOST=example.com:2019 ```

## How to submit results

Fork this repository and solve as many tasks from the list below as you can, following best practices of the industry.

Push your results to the personal private repository and share the final version repo and documentation with us by adding [mehrdad-op](https://github.com/mehrdad-op) and [srcCraftsman](https://github.com/srcCraftsman) as read-level access colaborators.


## Assessment Tasks

* Dockerfile: Prepare a Dockerfile to build and run this application.

* Docker Compose: Create a docker-compose.yml file for local testing. The application should start and be accessible.

* GitHub Actions: Set up a workflow to build the Docker image and push it back to the repository for both the main branch and tags.

* Helm Chart: Develop a Helm chart to deploy the application in Kubernetes. The application should:

    - Run in 5 replicas
    - Be deployed on nodes with the label role: api
    - Allocate only one pod per node
    
* CI for Unit Tests (Optional): Set up continuous integration for running unit tests. The command for executing tests is:
```go test -v -cover ./...```

## Assessment Submission

* Check the `SUBMISSION.md` file to check answers and instructions.
* 