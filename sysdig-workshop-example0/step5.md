We can also filter on events. Let's find what files nginx opened to serve the request. 
`sysdig -pc -r captures/nginx.scap "evt.type=open and evt.dir=< and proc.name=nginx"`{{execute}}
```
3537 01:59:53.505493874 1 root_nginx_1 (75f48af907c2) nginx (4769:6) < open fd=11(<f>/usr/share/nginx/html/index.html) name=/usr/share/nginx/html/index.html flags=65(O_NONBLOCK|O_RDONLY) mode=0
```
With this filter we're only seeing `open` exit (`<`) events for the process `nginx`. We see that the only file opened was the `index.html` file, and it was opened as read only (`O_RDONLY`).

We added a new flag to control the output format to the above command. The `-p` flag allows you to control the output formatting of Sysdig. You can use predefined options, or use any filter field as an output field. Predefined options include:
`-pc`: Container output - includes the container name and id.
`-pk`: Kubernetes output - includes the Kubernetes pod name and container id.

To only show the time the file was opened, the directory, and the filename, we can run:
`sysdig -r captures/nginx.scap -p "%evt.time %fd.directory %fd.filename" "evt.type=open and evt.dir=< and proc.name=nginx"`{{execute}}


