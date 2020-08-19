
don't use local host, use http://host.docker.internal:
```
docker build -t plumber-neo4r .
docker run --rm -p 4321:4321 -d plumber-neo4r
```