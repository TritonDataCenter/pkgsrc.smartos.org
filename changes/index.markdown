---
layout: single
title:  "Quarterly Changes"
---

# Changes

With 14,000+ packages being constantly updated and changed, producing a full
ChangeLog would be an exercise in futility and not very helpful.  So instead we
try to summarise the most important changes in each quarterly release.

## Major changes in pkgsrc-2015Q3

* Default package versions have been bumped for a number of core packages:
* Lua 5.1 -> 5.2, PostgreSQL 9.3 -> 9.4, PHP 5.5 -> 5.6, Ruby 1.9.3 -> 2.0.0
* All platforms now contain the pkgin enhancements detailed in [this blog
  post](http://www.perkin.org.uk/posts/reducing-ram-usage-in-pkgin.html).
* OSX users no longer show up in the login window.
* 225 packages have been added
* 1 package has been renamed
* 27 packages removed, 8 with a successor
* 1392 packages updated

The main pkgsrc-2015Q3 announcement is [here](https://mail-index.netbsd.org/pkgsrc-users/2015/09/30/msg022310.html).

## Major changes in pkgsrc-2015Q2

* Packages and bootstrap kits are now available over HTTPS from
  <https://pkgsrc.joyent.com/>.
* Major package additions/upgrades include MariaDB 5.5, Emacs 24.5, Boost
  1.58.0, XFCE 4.12, TeX Live 2015, and Perl 5.22.
* pkgin on illumos has significantly reduced memory requirements (for more
  information see [this blog
  post](http://www.perkin.org.uk/posts/reducing-ram-usage-in-pkgin.html)).
* OSX packages are now installed under the `/opt/pkg` prefix instead of the
  previous `/usr/pkg` in order to be compatible with the "System Integrity
  Protection" feature introduced in El Capitan / 10.11.
* OSX package defaults have been changed in order to provide fully-featured
  packages out of the box.
* 1,155 packages have been added.
* 4 packages have been renamed, 3 moved.
* 27 packages removed, 12 with a successor.
* 2,015 packages updated.

The main pkgsrc-2015Q2 announcement is [here](https://mail-index.netbsd.org/pkgsrc-users/2015/07/06/msg021778.html).

## Major changes in pkgsrc-2015Q1

* OS X packages are now PGP signed and verified by default.
* OS X bootstraps now include the pkgsrc-gnupg-keys package for signature
  verification of the pkg-vulnerabilities file.
* PostgreSQL 9.4 has been added, PHP 5.3 has been removed.
* 216 packages have been added
* 2 packages have been renamed
* 46 packages removed, 11 with a successor
* 2,007 packages updated

The main pkgsrc-2015Q1 announcement is [here](http://mail-index.netbsd.org/pkgsrc-users/2015/04/14/msg021358.html).

## Major changes in pkgsrc-2014Q4

* This release introduces Long Term Support, PGP signed packages, and some
  other enhancements to our SmartOS sets.  See [this blog
  post](http://www.perkin.org.uk/posts/pkgsrc-2014Q4-lts-signed-packages-and-more.html)
  for more details.
* This release sees the first set of 64-bit OS X packages, built on OS X
  Mavericks using clang, in addition to our existing 32-bit set.
* 156 packages have been added
* 4 packages have been renamed
* 48 packages removed, 9 with a successor
* 1,575 packages updated

The main pkgsrc-2014Q4 announcement is [here](http://mail-index.netbsd.org/pkgsrc-users/2015/01/02/msg020854.html).

## Major changes in pkgsrc-2014Q3

* Bootstrap kits now include mozilla-rootcerts and pkg_alternatives installed
  and configured by default.
* 210 packages have been added
* 3 packages have been renamed
* 15 packages removed, 12 with a successor
* 1,123 packages updated

The main pkgsrc-2014Q3 announcement is [here](http://mail-index.netbsd.org/pkgsrc-users/2014/10/03/msg020427.html).

## Major changes in pkgsrc-2014Q2

* 244 packages have been added
* 2 packages have been renamed
* 18 packages removed, 1 with a successor
* 1,085 packages updated

## Major changes in pkgsrc-2014Q1

Here are the major changes in the pkgsrc-2014Q1 release:

### OpenSSL update

Everyone has heard of the Heartbleed attacks by now.  2014Q1 of course includes
the latest OpenSSL (1.0.1g) to fix this issue.

### Go 1.3beta1 for illumos 64-bit

Thanks to great work by [Aram Hăvărneanu](https://twitter.com/aramh) Go 1.3
will support illumos systems, and we've included the 1.3beta1 package in our
SmartOS x86_64 repository.  Please give it a spin and provide feedback so the
main 1.3 release can be great!

## Major changes in pkgsrc-2013Q4

Here are the major changes in the pkgsrc-2013Q4 release:

### Default version changes

We have updated the default versions for a number of core packages, they are:

* Apache 2.4 (was 2.2)
* Lua 5.1 (was 5.2)
* MySQL 5.6 (was 5.5)
* PostgreSQL 9.3 (was 9.1)
* PHP 5.5 (was 5.4)

The reason for the Lua default going backwards is that 5.2 is incompatible in a
number of ways from 5.1, and there are still a reasonable number of modules
which do not yet work with 5.2.  We will revert back to 5.2 as default once
support is comparable.

We try to provide multiple versions of each of these packages, and many modules
are built for all versions, however some software can only be built against one
version, so these version bumps will ensure those packages use the latest
version.

In addition to these version defaults, we have changed the default
implementation of JPEG to libjpeg-turbo, which is an optimised implementation
of libjpeg using SIMD instructions.

### Disabled -fomit-frame-pointer in GCC

We have disabled the -fomit-frame-pointer option globally in GCC 4.7 on
SmartOS.  This micro-optimisation creates binaries which are useless for
debugging as the frame pointer is crucial for producing stack traces, and the
potential performance gains are simply not worth the loss of observability.

All of the SmartOS packages produced in pkgsrc-2013Q4 are built with this
compiler, so any packages which happened to use this option will now be built
correctly.

## Major changes in pkgsrc-2013Q3

### GHC 7.6 now available

For Haskell users, we are pleased to announce that ghc 7.6.3 is now available
for all architectures.  Previously we were only able to offer the older 6.8.3
release and only for 32-bit, but thanks to the efforts of those in our
community, notably 'oddsignals' and
[Alain O'Dea](https://twitter.com/AlainODea) we have a working bootstrap kit
for the newer releases.

## Major changes in pkgsrc-2013Q2

Here are the major changes in the pkgsrc-2013Q2 release:

### OpenJDK7 is now default

Thanks to the great work by SmartOS user 'jesse', we now have a working
OpenJDK7 on illumos, built with GCC.  This is now the default JRE/JDK, as we
are unable to provide updated sun-{jre,jdk} packages due to Oracle's more
restrictive redistribution policies.

The only user-visible change from this is that the Java binaries are prefixed
with `openjdk7-`, so call e.g. `openjdk7-java` instead of `java`, or
alternatively put `/opt/local/java/openjdk7/bin` at the front of your `$PATH`.

This allows co-existance with the legacy sun-{jre,jdk} packages.

### Desktop support

Thanks to many Xorg updates from Richard Palo, Xorg is now functional on
illumos, enabling many common desktop environments to now be used.

```console
: Install the meta-package containing Xorg
$ pkgin in modular-xorg

: On OmniOS these are required on top of the basic install.
$ pkg install driver/x11/xsvc developer/macro/cpp

: Also on OmniOS 'od' is located in a different location
$ sed -i -e 's,/usr/bin/od,/usr/gnu/bin/od,' /opt/local/bin/startx
```

A selection of desktops that are available:

GNOME 2.32 with Evolution and Firefox 22

```console
$ pkgin in gnome-session gnome-themes gnome-themes-extras \
           gnome-terminal gnome-backgrounds evolution

$ vi .xinitrc
#!/bin/sh
PATH=/opt/local/sbin:/opt/local/bin:$PATH
/opt/local/bin/gnome-session

$ startx

: Currently the pkgsrc firefox22 fails on startup, so for now use the
: pre-built binaries from Mozilla (with some library hacks).
$ curl -s http://releases.mozilla.org/pub/mozilla.org/firefox/releases/latest/contrib/solaris_tarball/firefox-22.0.en-US.opensolaris-i386.tar.bz2 \
    | bzcat | tar -xf -
$ ln -s /opt/local/lib/libX11.so firefox/libX11.so.4
$ ln -s /opt/local/lib/libXt.so firefox/libXt.so.4
$ env LD_LIBRARY_PATH=/opt/local/lib ./firefox/firefox
```

KDE 4.10.3

```console
$ pkgin in kde-runtime4 kde-workspace4 kde-baseapps4 \
           kde-wallpapers4 kde-base-artwork konsole

$ vi .xinitrc
/opt/local/bin/startkde
```

XFCE 4.6 with Gnumeric and Abiword

```console
$ pkgin in xfce4 gnumeric abiword

$ vi .xinitrc
/opt/local/bin/xfce4-session
```

Enlightenment 0.17 with GIMP

```console
$ pkgin in enlightenment-0.17 gimp

$ vi .xinitrc
/opt/local/bin/enlightenment_start
```

Awesome 3.4.13

```console
$ pkgin in awesome

$ vi .xinitrc
/opt/local/bin/awesome
```

## Major changes in pkgsrc-2013Q1

Here are the major changes in the pkgsrc-2013Q1 release:

### OpenSSL 1.0.1 with AES-NI support

OpenSSL has been upgraded from the 0.9.8 series to the 1.0.1 series.  The
driving reason to pursue this upgrade was to take advantage of AES-NI support
which significantly improves crypto performance on Intel CPUs which provide
that feature.

On a OSX 10.7 Core i7 laptop the numbers below speak for themselves:

```console
: /usr/bin/openssl 'OpenSSL 0.9.8r 8 Feb 2011'
$ openssl speed -evp aes-128-cbc
  type             16 bytes     64 bytes    256 bytes   1024 bytes   8192 bytes
  aes-128-cbc     157297.05k   173874.73k   176805.45k   177719.17k   179441.78k

: pkgsrc openssl 'OpenSSL 1.0.1e 11 Feb 2013'
$ openssl speed -evp aes-128-cbc
  type             16 bytes     64 bytes    256 bytes   1024 bytes   8192 bytes
  aes-128-cbc     643315.29k   685811.37k   696899.67k   699977.39k   693968.90k
```

A pretty significant 4x improvement for many hundreds of applications which use
OpenSSL for crypto.

### GCC Go support for SmartOS/illumos

[Go](http://golang.org/) is a reasonably new programming language from Google
that a number of our users have asked us to support, so we are pleased to
announce that beginning with pkgsrc-2013Q1 you will be able to use the `gccgo`
front-end to compile and run Go applications on SmartOS.

You simply compile the go source code as you would for any other language that
GCC supports, for example:

```console
$ pkgin -y install gcc47

: /opt/pkg for the illumos package set, /opt/local for SmartOS datasets..
$ PATH=/opt/pkg/gcc47/bin:$PATH

$ gccgo app.go -o app
$ ./app
```

### Networking utilities on SmartOS

Thanks to initial work by [@postwait](http://twitter.com/postwait) there is now
proper Zone support in libpcap, which has opened up the possibility to run a
number of networking utilities in Joyent SmartMachines.

Yes, this means you can finally run `tcpdump` instead of `snoop`.

## Major changes in pkgsrc-2012Q4

### Static UID/GID allocations

Up until this release, packages which require a user or group be created would
choose the next available UID/GID on the target system.  This meant that IDs
would be different across a range of machines.

Starting in pkgsrc-2012Q4 we created a list of statically assigned UID and GID,
using the range between 100-999, with a special `_pkgsrc` UID/GID taking 999.
This means that the first `useradd` or `groupadd` done by the user will start
at 1000 and avoid using the area reserved for pkgsrc.
