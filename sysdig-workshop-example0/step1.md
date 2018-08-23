In this preconfigured environment we have a nginx server running inside a Docker container. You can run `docker ps`{{execute}} to verify the nginx server is up and listening. 

Starting a capture with `sysdig` is easy. Simply run the `sysdig` command and specify the `-w <filename.scap>` option to  write the to the specified file.

`sysdig -w captures/nginx.scap &`{{execute}}

Now that we have a capture running, we can create traffic to our nginx server to better understand how nginx serves a HTTP request.

`curl localhost:8080`{{execute}}

Curl will print the nginx "welcome" page and exit. We can now kill our capture. Since we put `sysdig` in background by using the trailing `&`, we can kill our capture like so.

`kill %1`{{execute}}

We can now begin to dig into our capture to understand it's contents.
