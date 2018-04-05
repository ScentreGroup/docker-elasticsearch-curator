# Elasticsearch Curator

An tiny Alpine-based container that allows one to use the Elasticsearch `curator` command. By default, runs in a loop sleeping for the `INTERVAL_IN_HOURS`, then running cleanup again.  However, you can pass in a new `CMD` - prefix with `-` to simply append arguments to the `curator` command, or execute a completely different argument (e.g. `/bin/bash`).

## Running

### Default Values

```
ELASTICSEARCH_HOST=elasticsearch
ELASTICSEARCH_CURATOR_ARGS=
INTERVAL_IN_HOURS=24
OLDER_THAN_IN_DAYS=30
```

### Examples

**Specifying the host**

```
docker run -d -e "ELASTICSEARCH_HOST=my.random.host" mlaccetti/elasticsearch-curator
```

**Using TLS and Authentication**

```
docker run -d -e "ELASTICSEARCH_HOST=my.random.host" -e "ELASTICSEARCH_CURATOR_ARGS=--use-ssl --http_auth username:password" mlaccetti/elasticsearch-curator
```

## Building

### Default Values

```
ELASTICSEARCH_CURATOR_VERSION=5.4.0
ELASTICSEARCH_CURATOR_CLI=curator_cli
```

### Example

```
docker build --build-arg ELASTICSEARCH_CURATOR_VERSION=5.4.0 --build-arg ELASTICSEARCH_CURATOR_CLI=curator -t scentregroup/elasticsearc-curator:5.4.0 .
```
