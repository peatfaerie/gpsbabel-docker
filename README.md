# Docker image with gpsbabel based on Alpine

This is an alpine docker image with gpsbabel which may be used as a standalone command or in other images.

Example usage:
```
docker run --rm -i peatfaerie/gpsbabel -i kml -f - -o osm,tag=highway:primary -F - < input.kml > output.osm
```
