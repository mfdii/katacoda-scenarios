The power of Sysdig comes from the filter language and the ability to look at a capture from multiple perspectives. Let's use a few common field classes to dig into our nginx capture. 

First, let's look at what our nginx container did during the capture. To filter on a container, we use the `container` field class. The most used fields in the `container` field class include:
- `container.id`: the container id.
- `container.name`: the container name.
- `container.image`: the container image name (e.g. sysdig/sysdig:latest)

Let's look up our `container.name` in the capture:
`sysdig -r nginx.scap -c lscontainers`{{execute}}

Then filter for the nginx container:
`sysdig -r nginx.scap container.name = root_nginx_1`{{execute}}

We see the same set of events as we saw when we ran: 
`sysdig -r nginx.scap proc.name = nginx`{{execute}}

That's because there's only one process running inside of our container. 
```
2030 01:51:56.381165049 1 nginx (4486) > accept flags=0
2031 01:51:56.381172600 1 nginx (4486) < accept fd=3(<4t>172.19.0.1:36688->172.19.0.2:80) tuple=172.19.0.1:36688->172.19.0.2:80 queuepct=0 queuelen=0 queuemax=128
2032 01:51:56.381241323 1 nginx (4486) > epoll_ctl
2033 01:51:56.381244074 1 nginx (4486) < epoll_ctl
2034 01:51:56.381251409 1 nginx (4486) > epoll_wait maxevents=512
2035 01:51:56.381256195 1 nginx (4486) > switch next=4410(docker-proxy) pgft_maj=0 pgft_min=177 vm_size=33072 vm_rss=2280 vm_swap=0
2102 01:51:56.382089334 1 nginx (4486) < epoll_wait res=1
2103 01:51:56.382110380 1 nginx (4486) > recvfrom fd=3(<4t>172.19.0.1:36688->172.19.0.2:80) size=1024
2104 01:51:56.382113366 1 nginx (4486) < recvfrom res=78 data=GET / HTTP/1.1..Host: localhost:8080..User-Agent: curl/7.47.0..Accept: */*.... tuple=NULL
```
Looking at the snippet above, we see nginx `accept` the IP connection, then read from the connection using `recvfrom`. We see the `recvfrom` function exit (or return) and the HTTP request in the data argument. For instance, we can see the `User-Agent` is set to `curl/7.47.0`.




