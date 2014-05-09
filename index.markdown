# Introduction

__This guide documents the package management functions provided by Joyent's
packages, available for SmartOS/illumos, Linux, and OSX.__

Packages are built using [pkgsrc](http://www.pkgsrc.org/), a portable
cross-platform package manager containing 13,000+ packages for over 20
different operating systems.

## What is pkgsrc?

pkgsrc is a framework for building third-party software quickly and easily from
source.  pkgsrc allows the user to simply type 'make install' and takes care of
downloading, verifying, patching, building and installing the selected software
along with any dependencies it requires.

In addition to building from source, binary packages can be produced and then
installed across multiple systems.  Joyent build and provide binary packages
for SmartOS/illumos and OSX based on quarterly stable pkgsrc branches.

For more information, see the pkgsrc homepage at
[www.pkgsrc.org](http://www.pkgsrc.org/)

## How many packages are available?

As of the most recent `2013Q4` branch, there are:

* 11,400+ for 32-bit illumos
* 11,200+ for 64-bit illumos
* 9,300+ for multiarch illumos
* 10,000+ for 32-bit OS X
