# Elasticsearch Curator in docker

This is dockerized version of elasticsearch curator,
tool to manage time-based indices.

## Why this image

This image keeps up to date with curator releases and has tags
in the docker registry. It is also based on minimal `alpine` image,
resulting in a just 50mb image.

Also you should not configure CRON or another scheduler - just run container based on this image.

## Environment Variables

```
CURATOR_INTERVAL    # interval between curator action executions (default: 24h)

# Action vars
ES_INDEX_PREFIX     # ES index prefix for rotation (default: logstash-)
ES_INDEX_TIMESTRING # ES index timestring (default: %Y.%m.%d)
ROTATION_DAYS       # curator will remove indexes older than this value (default: 30)

# ES connection vars
ES_HOST             # ES host (default: elasticsearch)
ES_PORT             # ES port (default: 9200)
```

## Usage

Run the image (dry-run):

```
docker run -d vsiryk/elasticsearch-curator:latest --dry-run
```
