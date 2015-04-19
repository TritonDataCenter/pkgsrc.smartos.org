---
layout: install
title: Joyent Packages Documentation - Install On OS X
prefix: /usr/pkg
---

<div class="container">
	<h2 class="text-center">Choose Your OS X Package Set</h2>
	<div class="row">
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
$ curl -Os http://pkgsrc.joyent.com/packages/Darwin/bootstrap/bootstrap-2015Q1-i386.tar.gz

: Verify SHA1 checksum
$ shasum bootstrap-2015Q1-i386.tar.gz
57fd810c9900d51b0f49f5501286e2c2db0a28c8  bootstrap-2015Q1-i386.tar.gz

: Verify PGP signature
$ curl -Os http://pkgsrc.joyent.com/packages/Darwin/bootstrap/bootstrap-2015Q1-i386.tar.gz.asc
$ gpg --recv-keys 0xDE817B8E
$ gpg --verify bootstrap-2015Q1-i386.tar.gz{.asc,}

: Install bootstrap kit to {{ page.prefix }}
$ sudo tar -zxpf bootstrap-2015Q1-i386.tar.gz -C /

: Add paths
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH

: Fetch package repository information
$ sudo pkgin -y update

: Number of packages available
$ pkgin avail | wc -l
  11375
{% endhighlight %}
		</div>
		<div class="col-md-6">
{% highlight console %}
: Download 64-bit bootstrap kit
$ curl -Os http://pkgsrc.joyent.com/packages/Darwin/bootstrap/bootstrap-2015Q1-x86_64.tar.gz

: Verify SHA1 checksum
$ shasum bootstrap-2015Q1-x86_64.tar.gz
2d2f8dda3743dcd323c306828e9dbdc63b09bff2  bootstrap-2015Q1-x86_64.tar.gz

: Verify PGP signature
$ curl -Os http://pkgsrc.joyent.com/packages/Darwin/bootstrap/bootstrap-2015Q1-x86_64.tar.gz.asc
$ gpg --recv-keys 0xDE817B8E
$ gpg --verify bootstrap-2015Q1-x86_64.tar.gz{.asc,}

: Install bootstrap kit to {{ page.prefix }}
$ sudo tar -zxpf bootstrap-2015Q1-x86_64.tar.gz -C /

: Add paths
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH

: Fetch package repository information
$ sudo pkgin -y update

: Number of packages available
$ pkgin avail | wc -l
   11240
{% endhighlight %}
		</div>
	</div>
	</div>
</div>
