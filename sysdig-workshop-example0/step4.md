The `file` field class is another field class that you'll use alot with Sysdig. Files (or file descriptors) represent multiple objects in Linux and the `file` field class is how you can filter on files, network connections, pipes, sockets, and more. More commonly you'll filter on files and network connections. 

We can use our capture to see if any files were read from or written to in the `/etc` directory. 
`sysdig -pc -r captures/nginx.scap fd.name contains /etc`{{execute}}

We see that `curl` was the only process reading files in `/etc`. 

We can also see what network connections were made to port 80.
`sysdig -pc -r captures/nginx.scap fd.port = 80`{{execute}}

The `file` field class has a number of useful fields:
- `fd.type`: type of FD. Can be 'file', 'directory', 'ipv4', 'ipv6', 'unix', 'pipe', 'event', 'signalfd', 'eventpoll', 'inotify' or 'signalfd'.
- `fd.name`: FD full name. If the fd is a file, this field contains the full path. If the FD is a socket, this field contain the connection tuple.
- `fd.directory`: If the fd is a file, the directory that contains it.
- `fd.filename`: If the fd is a file, the filename without the path.
- `fd.ip`: Matches the ip address (client or server) of the fd.
- `fd.port`: (FILTER ONLY) matches the port (either client or server) of the fd.

