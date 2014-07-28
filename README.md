pia
===

Scripts for Private Internet Access VPN

## How to use it

First, clone the repo: `clone git@github.com:serginator/pia.git`

Then add a file called `.pass` in the root of the pia folder with your username in the first line and your password in the second one, for example:

```
my_username
Pa$$w0rd
```

Now, make `fastest.sh` executable with `chmod +x fastest.sh`

And last, execute it with `./fastest.sh`

It will select the fastest one and connect to it using the credentials you configured before in the file `.pass`

## More tweaks

If you want to avoid some servers, just add a `!` at the beginning of the line in `servers` file

If you want to reduce the time, just modify the times it pings eachs server, so change the command to `ping -c 1`... for example, and it will just ping one time each server (it's less accuracy, of course)
