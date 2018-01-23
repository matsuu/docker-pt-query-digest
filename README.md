# matsuu/pt-query-digest

## Usage

### Analyze slow query log
```
cat mysql-slow.log | docker run -i --rm matsuu/pt-query-digest > analyzed-slow.log
```

### Analyze tcpdump
```
cat dump.log | docker run -i --rm matsuu/pt-query-digest --type tcpdump > analyzed-slow.log
```

## Build

```
docker build -t matsuu/pt-query-digest .
```

## References

- [Percona Toolkit](https://www.percona.com/software/database-tools/percona-toolkit)
- [pt-query-digest](https://www.percona.com/doc/percona-toolkit/LATEST/pt-query-digest.html)
- [github.com/matsuu/docker-pt-query-digest](https://github.com/matsuu/docker-pt-query-digest)
