Sysdig is an open source tool for deep system visibility that comes with container native support.

Think of all the system health and performance monitoring tools you used for troubleshooting but working together and container-aware:
- strace
- tcpdump
- htop
- iftop
- lsof

and way more.

This means that you can gain visibility inside the containers, and filter or aggregate metrics using container names/ids or your orchestration tool resources (Kubernetes pods, deployments, etc or Mesos tasks and Marathon apps and groups).

In this scenario, we will introduce the concept of `sysdig`'s command line interface, how to create a system capture with `sysdig`, how to interpret the output of a `sysdig` capture, and basic `sysdig` filter syntax.

We will use `sysdig` to answer the following questions about an `nginx` process:
- What system calls does `nginx` use to serve a request?
- What files does `nginx` open to server a request?

Happy digging!

