## [Rabbit-tcp](https://github.com/ihciah/rabbit-tcp)
Rabbit-tcp is a multi connection TCP fowwarder.

## on server side
```
./rabbit-linux-amd64 -mode s -password "xxxx" -rabbit-addr :1122 -verbose 5
```

## on client side
```
./rabbit-linux-amd64 -dest "test.linkown.com:80" -listen :3333 -password line -rabbit-addr 155.235.30.17:1122 -verbose 5
```


