# SimpleBank Helm Chart

This Helm chart deploys the SimpleBank application and its PostgreSQL database on a Kubernetes cluster.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure (if persistence is enabled)

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
helm install my-release ./charts/simplebank
```

The command deploys SimpleBank on the Kubernetes cluster with the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `release-1.0.0` deployment:

```bash
helm uninstall release-1.0.0
```

## Parameters

### Global parameters

| Name                      | Description                                     | Value                       |
| ------------------------- | ----------------------------------------------- |-----------------------------|
| `replicaCount`            | Number of SimpleBank replicas                   | `5`                         |
| `image.repository`        | SimpleBank image repository                     | `osandadileepa/simplebank:` |
| `image.tag`               | SimpleBank image tag                            | `latest`                    |
| `image.pullPolicy`        | SimpleBank image pull policy                    | `IfNotPresent`              |
| `nameOverride`            | String to partially override the release name   | `""`                        |
| `fullnameOverride`        | String to fully override the release name       | `""`                        |

### SimpleBank parameters

| Name                                 | Description                                                                 | Value           |
| ------------------------------------ | --------------------------------------------------------------------------- | --------------- |
| `service.type`                       | SimpleBank service type                                                     | `ClusterIP`     |
| `service.port`                       | SimpleBank service port                                                     | `8080`          |
| `resources.limits.cpu`               | The CPU limits for the SimpleBank container                                 | `500m`          |
| `resources.limits.memory`            | The memory limits for the SimpleBank container                              | `512Mi`         |
| `resources.requests.cpu`             | The requested CPU for the SimpleBank container                              | `100m`          |
| `resources.requests.memory`          | The requested memory for the SimpleBank container                           | `128Mi`         |
| `nodeSelector.role`                  | Node labels for SimpleBank pod assignment                                   | `api`           |
| `affinity.podAntiAffinity`           | Pod anti-affinity to ensure one pod per node                                | See values.yaml |
| `tolerations`                        | Tolerations for SimpleBank pod assignment                                   | `[]`            |

### PostgreSQL parameters

| Name                                 | Description                                                                 | Value           |
| ------------------------------------ | --------------------------------------------------------------------------- | --------------- |
| `postgresql.enabled`                 | Deploy PostgreSQL StatefulSet with 3 replicas                               | `true`          |
| `postgresql.image.repository`        | PostgreSQL image repository                                                 | `postgres`      |
| `postgresql.image.tag`               | PostgreSQL image tag                                                        | `15`            |
| `postgresql.image.pullPolicy`        | PostgreSQL image pull policy                                                | `IfNotPresent`  |
| `postgresql.persistence.enabled`     | Enable persistence using PVC                                                | `true`          |
| `postgresql.persistence.size`        | PVC Storage Request for PostgreSQL volume                                   | `8Gi`           |
| `postgresql.service.port`            | PostgreSQL service port                                                     | `5432`          |
| `postgresql.auth.username`           | PostgreSQL username                                                         | `test`          |
| `postgresql.auth.password`           | PostgreSQL password                                                         | `test`          |
| `postgresql.auth.database`           | PostgreSQL database name                                                    | `bdb`           |

## Configuration

The following table lists the configurable parameters of the SimpleBank chart and their default values.

### SimpleBank application configuration

| Name                      | Description                                     | Value           |
| ------------------------- | ----------------------------------------------- | --------------- |
| `config.app.environment`  | Application environment                         | `prod`          |
| `config.app.host`         | Application host                                | `0.0.0.0`       |
| `config.app.port`         | Application port                                | `8080`          |

## Persistence

The PostgreSQL image stores the PostgreSQL data at the `/var/lib/postgresql/data` path of the container.

For the PostgreSQL StatefulSet, each pod gets its own Persistent Volume using volumeClaimTemplates. This ensures that each PostgreSQL replica has its own dedicated storage. The volumes are created using dynamic volume provisioning.
