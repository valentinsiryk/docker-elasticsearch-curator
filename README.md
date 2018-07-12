# Elasticsearch Curator in docker

This is dockerized version of elasticsearch curator,
tool to manage time-based indices.

## Why this image

This image keeps up to date with curator releases and has tags
in the docker registry. It is also based on minimal `alpine` image,
resulting in a just 50mb image.

Also you should not configure CRON or another scheduler - just run container based on this image.

## Usage

Run the image (dry-run):

```
docker run -d vsiryk/elasticsearch-curator:latest --dry-run
```
