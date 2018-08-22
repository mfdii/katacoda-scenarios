In this preconfigured environment we have a nginx server running inside a Docker container. You can run `docker ps`{{execute}} to verify the nginx server is up and listening. 

Starting a capture with `sysdig` is easy. Simply run the `sysdig` command and specify the `-w <filename.scap>` option to  write the to the specified file. 