# Installing

The most recent pkgsrc release is `2014Q1`.  Follow the instructions for your
OS below.

## Installing on SmartOS

SmartOS images come pre-installed with packages and are ready to go, you only
need to `pkgin` install additional packages as required.  The version of the
image denotes which branch of pkgsrc is installed:

 * 14.1.x images use pkgsrc-2014Q1
 * 13.4.x images use pkgsrc-2013Q4
 * 13.3.x images use pkgsrc-2013Q3
 * etc..

Prior to `13.2.x` a different versioning scheme was used.  To see which release
of pkgsrc an older image uses, refer to the contents of
`/opt/local/etc/pkgin/repositories.conf`.

## Installing on illumos

There are three different package sets available for illumos - 32-bit, 64-bit,
and a combined multiarch set.  The multiarch set is currently considered
somewhat experimental, and has fewer packages available, but we welcome
feedback on it so that it can eventually become the default.

The packages are designed to be self-contained, avoiding operating system
dependencies where possible.  This allows them to be generic across all illumos
distributions.

Pick only __ONE__ of the package sets below.  32-bit contains the most
packages, and is probably the set you should choose unless you have specific
requirements.

_[Multiarch is not currently available, it will hopefully return bigger and
 better in 2014Q2]_

```console
: 32-bit
$ curl -s http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2014Q1-i386.tar.gz | gzcat | (cd /; sudo tar -xpf -)

: 64-bit
$ curl -s http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2014Q1-x86_64.tar.gz | gzcat | (cd /; sudo tar -xpf -)
```

For all package sets, add `/opt/local` to `$PATH` and `$MANPATH`.

```console
$ PATH=/opt/local/sbin:/opt/local/bin:$PATH
$ MANPATH=/opt/local/man:$MANPATH
```

## Installing on OS X

Packages for OS X are built on Snow Leopard (10.6) so that they are forward
compatible with all current versions of OS X.  Currently only 32-bit packages
are available.

```console
: Download and install the bootstrap containing pkgin and the packaging tools
$ curl -s http://pkgsrc.joyent.com/packages/Darwin/bootstrap/bootstrap-2014Q1-i386.tar.gz | sudo tar -zxpf - -C /

: Packages are kept under /usr/pkg, add to $PATH and $MANPATH
$ PATH=/usr/pkg/sbin:/usr/pkg/bin:$PATH
$ MANPATH=/usr/pkg/man:$PATH
```

## Installing on Linux

Packages are available for RHEL6-derived distributions, i.e. RHEL, CentOS,
Oracle Linux, etc.

```console
: Download and install the bootstrap containing pkgin and the packaging tools
$ curl -s http://pkgsrc.joyent.com/packages/Linux/bootstrap/bootstrap-2014Q1-el6-x86_64.tar.gz | sudo tar -zxpf - -C /

: Packages are kept under /usr/pkg, add to $PATH and $MANPATH
$ PATH=/usr/pkg/sbin:/usr/pkg/bin:$PATH
$ MANPATH=/usr/pkg/man:$PATH
```

## General usage

Installing, updating, and removing packages is done using the `pkgin` utility.
This is designed to function similar to `apt-get` from Debian/Ubuntu.  The most
common functions are listed below - see the manual page for further
information.

```console
: Fetch the latest repository metadata.
$ sudo pkgin -y update

: List available packages
$ pkgin avail

: Search for packages
$ pkgin search tmux

: Install a package
$ sudo pkgin -y install tmux

: Upgrade all packages
$ sudo pkgin -y full-upgrade
```
