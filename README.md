## Elasticsearch Curator in docker

This is dockerized version of elasticsearch curator,
tool to manage time-based indices.


## Why this image

This image keeps up to date with curator releases and has tags
in the docker registry. It is also based on minimal `alpine` image,
resulting in a just 50mb image.

Also you should not configure CRON or another scheduler - just run container based on this image.


## Environment Variables

```
# Action vars
ES_INDEX_PREFIX     # ES index prefix for rotation (default: logstash-)
ES_INDEX_TIMESTRING # ES index timestring (default: %Y.%m.%d)
ROTATION_DAYS       # curator will remove indexes older than this value (default: 30)

# ES connection vars
ES_HOST             # ES host (default: elasticsearch)
ES_PORT             # ES port (default: 9200)

# ES SSL (optional)
ES_USE_SSL          # (default: False)
ES_CERTIFICATE
ES_CLIENT_CERT
ES_CLIENT_KEY
ES_NO_VALIDATE      # (default: False)
ES_HTTP_AUTH
```


## Using a custom Curator action file

```
docker run -d -v /path/to/action.yml:/action.yml vsiryk/elasticsearch-curator:latest
```

## Usage

Run the image:

```
docker run -d vsiryk/elasticsearch-curator:latest
```
