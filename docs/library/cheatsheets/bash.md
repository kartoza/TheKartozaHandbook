# Bash

??? danger "Work in Progress"

    This article is under heavy development and is not considered production ready

A shell is a computer program which exposes an operating system's services to a human user or other programs. The Bourne Again SHell (BASH) is a command-line interpreter that is commonly found in many UNIX based Operating Systems, and the term "bash-scripting" has become synonymous with the execution of UNIX commands.

## BusyBox

BusyBox is a software suite that provides several Unix utilities in a single executable file. Where bash provides a way for commands to be executed, BusyBox provides access to the commands themselves. BusyBox is probably the minimal toolset you can expect to find on UNIX systems and is commonly found on everything from workstations to servers to IoT devices. Many fan-favorite commands, such as `cat`, `ls`, `top`, `grep`, `awk`, `mount`, and more are actually made available by the BusyBox installation.

```bash
/bin/busybox --list-full
```

Other system commands vary from installation to installation, so the more you can achieve with the BusyBox tools and no external dependencies, the more robust your scripts will be.

## Executing Scripts

A script is a file that contains a sequence of commands that are executed by the shell. To run those commands it must be made executable.


```bash
chmod +x /path/to/my-script.sh
```

For the system to know what software an executable file must be run with, a shebang is used at the top of the file

```bash
#!/bin/bash
```
