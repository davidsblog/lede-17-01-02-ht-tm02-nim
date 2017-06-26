# lede-17-01-02-ht-tm02-nim
A **nim** cross-compiler for LEDE 17.01.02 on Ralink RT5350F.
I'm using it to cross compile **nim** code for the HooToo HT-TM02 running OpenWrt. Like this:

Create a shell script (named `lede-tm02-nim`) with this content:

```
#!/bin/bash
docker run --rm -v ${PWD}:/src davidsblog/lede-17-01-02-ht-tm02-nim:latest \
     /bin/sh -c "cd /src; $*"
```
Then, you can use nim as normal, when *prefixed* with `lede-tm02-nim`, like this:

`lede-tm02-nim nim -v`

...which should print the version of the nim compiler, or to compile `myprog.nim`:

`lede-tm02-nim nim c --cpu:mipsel --os:linux myprog.nim`

Compilation is done inside the *container*, but the source code (and resulting binary) will be in the current directory of the *host* machine.  I find it to be an easy way to cross-compile from many different machines.
