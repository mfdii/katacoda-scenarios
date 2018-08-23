Congratulations! You now know how to create a capture with Sysdig, and filter through the capture using the Sysdig filter language. 

Remember `sysdig -l` will show you all filter fields, and `sysdig -L` will show you events and their arguments captured.

Here's a list of the more popular fields we covered in this scenario:
- `container.id`: the container id.
- `container.name`: the container name.
- `container.image`: the container image name (e.g. sysdig/sysdig:latest)
- `fd.type`: type of FD. Can be 'file', 'directory', 'ipv4', 'ipv6', 'unix', 'pipe', 'event', 'signalfd', 'eventpoll', 'inotify' or 'signalfd'.
- `fd.name`: FD full name. If the fd is a file, this field contains the full path. If the FD is a socket, this field contain the connection tuple.
- `fd.directory`: If the fd is a file, the directory that contains it.
- `fd.filename`: If the fd is a file, the filename without the path.
- `fd.ip`: Matches the ip address (client or server) of the fd.
- `fd.port`: (FILTER ONLY) matches the port (either client or server) of the fd.

You can download Sysdig or contribute to the project over on our [GitHub repo](https://github.com/draios/sysdig).

We hope you continue on in our series of scenarios and appreciate any feedback via Twitter ([@sysdig](https://twitter.com/sysdig)).