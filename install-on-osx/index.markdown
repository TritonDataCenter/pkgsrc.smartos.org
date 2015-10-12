---
layout:      install
title:       Joyent Packages Documentation - Install On Mac OS X
metacontent: Binary pkgsrc package sets for Mac OS X
prefix:      /opt/pkg
---

<div class="container">
	<h2 class="text-center">Choose Your OS X Package Set</h2>
	<div class="row">
	<div class="row">
		<div class="col-md-1">
		</div>
		<div class="col-md-10">
			<p class="lead">
				Packages for Mac OS X are offered in two different configurations, a 32-bit set
				built on Snow Leopard and a 64-bit set built on Mavericks.  Packages which use
				X11 are built against <a href="http://xquartz.macosforge.org/">Xquartz</a> so if
				you wish to install them you will need Xquartz installed into
				<code>/opt/X11</code> first.
			</p>
			<p class="lead">
				Note that from 2015Q2 onwards the prefix has changed to
				<code>{{ page.prefix }}</code> in order to be compatible with El Capitan's
				"System Integrity Protection" feature.
			</p>
		</div>
		<div class="col-md-1">
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<h3 class="text-center">32-bit Snow Leopard</h3>
			<p>
				This is the most generic package set, and should be appropriate for most OS X
				users.  If in doubt, choose this one.  They are built using the
				<code>gcc 4.2.1</code> compiler, and work great on all OS X versions up to and
				including OS X Yosemite.
			</p>
		</div>
		<div class="col-md-6">
			<h3 class="text-center">64-bit Mavericks</h3>
			<p>
				These are built on the newer Mavericks release using <code>clang-600.0.56</code>
				in 64-bit mode.  These packages may work better if you have newer Mac hardware
				running at least OS X Mavericks and require 64-bit binaries.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
{% highlight console %}
: Download 32-bit bootstrap kit
$ curl -Os https://pkgsrc.joyent.com/packages/Darwin/bootstrap/bootstrap-2015Q3-i386.tar.gz

: Verify SHA1 checksum
$ shasum bootstrap-2015Q3-i386.tar.gz
2f6d6c3479250280b17246d3a18793593e173f90  bootstrap-2015Q3-i386.tar.gz

: Verify PGP signature (optional, requires gpg to be installed)
$ curl -Os https://pkgsrc.joyent.com/packages/Darwin/bootstrap/bootstrap-2015Q3-i386.tar.gz.asc
$ gpg --recv-keys 0xDE817B8E
$ gpg --verify bootstrap-2015Q3-i386.tar.gz{.asc,}

: Install bootstrap kit to {{ page.prefix }}
$ sudo tar -zxpf bootstrap-2015Q3-i386.tar.gz -C /

: Add path.  MANPATH is automatically deduced.
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH

: Fetch package repository information.
$ sudo rm -rf /var/db/pkgin
$ sudo pkgin -y update
{% endhighlight %}
		</div>
		<div class="col-md-6">
{% highlight console %}
: Download 64-bit bootstrap kit
$ curl -Os https://pkgsrc.joyent.com/packages/Darwin/bootstrap/bootstrap-2015Q3-x86_64.tar.gz

: Verify SHA1 checksum
$ shasum bootstrap-2015Q3-x86_64.tar.gz
d99f03d5c53a9ea6cb55f7b5c27d0f3dbfadec08  bootstrap-2015Q3-x86_64.tar.gz

: Verify PGP signature (optional, requires gpg to be installed)
$ curl -Os https://pkgsrc.joyent.com/packages/Darwin/bootstrap/bootstrap-2015Q3-x86_64.tar.gz.asc
$ gpg --recv-keys 0xDE817B8E
$ gpg --verify bootstrap-2015Q3-x86_64.tar.gz{.asc,}

: Install bootstrap kit to {{ page.prefix }}
$ sudo tar -zxpf bootstrap-2015Q3-x86_64.tar.gz -C /

: Add path.  MANPATH is automatically deduced.
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH

: Fetch package repository information
$ sudo rm -rf /var/db/pkgin
$ sudo pkgin -y update
{% endhighlight %}
		</div>
	</div>
	</div>
</div>
