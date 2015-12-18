# thisApp
Trivial golang application which, in conjunction with [`thatApp`](https://github.com/danackerson/thatApp/), is meant to serve as a tutorial for circleCI builds and docker-compose controlled multi-container applications.

The requisite `docker-compose.yml` file (note that `thisapp` is **not** exposed to the host):

```
$ vi docker-compose.yml
thisapp:
  image: quay.io/dan_ackerson/thisapp:7
  container_name: thisapp
thatapp:
  image: quay.io/dan_ackerson/thatapp:18
  container_name: thatapp
  ports:
    - "8082:8080"

$ docker-compose --x-networking up
Creating thisapp
Creating thatapp
Attaching to thisapp, thatapp
```

Now we can verify that both containers are up and running and able to [talk to each other](https://github.com/danackerson/thatApp/blob/master/hello_that.go#L22) (even if we can't directly access `thisApp`):

```
$ curl http://192.168.99.100:8082/index
Hello That!
$ curl http://192.168.99.100:8082/this
Hello This!
$ curl http://192.168.99.100:8081/this
curl: (7) Failed to connect to 192.168.99.100 port 8081: Connection refused
```

```
