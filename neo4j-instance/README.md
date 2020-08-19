```
docker build -t neo4j-test .
docker run -p 1234:7474 -p 7687:7687 -d neo4j-test
```