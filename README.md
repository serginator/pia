pia
===

Scripts for Private Internet Access VPN

First, clone the repo: `clone git@github.com:serginator/pia.git`

Then add a file called `.pass` in the root of the pia folder with your username in the first line and your password in the second one, for example:

```
my_username
Pa$$w0rd
```

Now, make `fastest.sh` executable with `chmod +x fastest.sh`

And last, execute it with `./fastest.sh`

It will select the fastest one and connect to it using the credentials you configured before in the file `.pass`
