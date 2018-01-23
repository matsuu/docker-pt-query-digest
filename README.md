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

- [https://www.percona.com/software/database-tools/percona-toolkit](Percona Toolkit)
- [https://www.percona.com/doc/percona-toolkit/LATEST/pt-query-digest.html](pt-query-digest)
- [https://github.com/matsuu/pt-query-digest](github.com/matsuu/pt-query-digest)
