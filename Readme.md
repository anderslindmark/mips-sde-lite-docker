# MIPS SDE lite docker

This is a docker container for running the *MIPS Software Development Environment lite*.
Primarily aimed at doing the lab assignments in D0013E (Microcomputer Engineering).

Since *mips-sde* is no longer available on linux-mips.org this uses an archived version of the toolchain, version *6.06.01*.

## Instructions
### Prerequisites
You need to have **Docker** installed. Go to https://www.docker.com/ and click "*Get Started with Docker*"
### Usage


Go to the directory where you have your code and the Makefile in, and then run:

On **Linux** or **OS X**:
```zsh
docker run --rm -v $(pwd):/code localghost/mips-sde
```

On **Windows** (in *PowerShell*):
```Powershell
$pwd = '/'+(pwd).Path.replace('\','/').replace(':',')
docker run --rm -v "$($pwd):/code" localghost/mips-sde
```

This will run *make* in your current working directory.

If you want to run a specific command (*sde-as* for instance) you can specify it like so:
```zsh
docker run --rm -v $(pwd):/code localghost/mips-sde sde-as --version
```

## Aliases for easier usage
To avoid having to type the entire docker commandline every time you want to use the container, you can create an alias for the command 
### Linux/OS X
I am using **zsh** so you might need to modify this to suit the shell you are using.
Add this snippet to your *.zshrc*:
```zsh
function mipsmk() {
    docker run --rm -v $(pwd):/code localghost/mips-sde $*
}
```
Now you can type `mipsmk` to run *make* in the current working directory. Other commands can be run inside the container by issuing the command after `mipsmk`, for instance: `mipsmk sde-as --version`

### Windows
I am assuming you are using *PowerShell*. Add this snipppet to your **$profile**-file (typically *c:\users\username\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1*). 
For this file to load you might need to update your [ExecutionPolicy](https://technet.microsoft.com/en-us/library/hh847748.aspx) 
```Powershell
function mipsmk() {
    $pwd = '/' + (pwd).Path.replace('\','/').replace(':','')
    docker run --rm -v "$($pwd):/code" localghost/mips-sde $args
}
```
Now you can type `mipsmk` to run *make* in the current working directory. Other commands can be run inside the container by issuing the command after `mipsmk`, for instance: `mipsmk sde-as --version`
