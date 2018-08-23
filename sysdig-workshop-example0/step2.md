With our capture in hand, we can begin to see how nginx serves a request to the requesting user. First, let's look at everything Sysdig captured for the nginx process. We will want to specify the `-r` flag, along with the file name of our capture. Additionally, we are going to specify a Sysdig filter to limit the data we output from the capture. 

`sysdig -r nginx.scap proc.name = nginx`{{execute}}

Here we can see all the system calls that were made to serve the HTTP request. Sysdig output is organized into columns and follows the below format:
- Event Counter - incremental event counter.
- Time Stamp - The system time the event occured.
- Processor Number - The processor the system call was executed on.
- Process Name - The name of the process.
- Thread ID - The thread/process ID of the process. 
- Event Direction - `>`: entering a system call, `<` exiting a system call.
- System Call - The name of the system call, or event.
- Event Arguments - Any arguments passed to or returned from an event/system call.

Thus given the below output:
```
3492 23:19:57.120977347 0 nginx (4558) < accept fd=3(<4t>172.19.0.1:33832->172.19.0.2:80) tuple=172.19.0.1:33832->172.19.0.2:80 queuepct=0 queuelen=0 queuemax=128
```
- `3492` - Event Counter
- `23:19:57.120977347` - Time Stamp
- `0` - Processor Number
- `nginx` - Process Name
- `4558` - Thread ID
- `<` - Event Direction (Exit in this case.)
- `accept` - System Call or Event
- `fd=3(<4t>172.19.0.1:33832->172.19.0.2:80) tuple=172.19.0.1:33832->172.19.0.2:80 queuepct=0 queuelen=0 queuemax=128` - Event Arguments returned (In this case a file descriptor.)

The Sysdig filter language allows for you to filter on a large number of events (or system calls), as well as a large number of fields. Fields are organized into field classes. To see the events that Sysdig can capture, run `sysdig -L`{{execute}}. to see what field classes, and fields Sysdig's filter language supports, run `sysdig -l`{{execute}}.

Now that we understand Sysdig output, and how to filter, we can dig into the capture for more information.