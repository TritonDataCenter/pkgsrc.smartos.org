---
layout: install
title: Joyent Packages Documentation - Install On Illumos
prefix: /opt/local
---

<div class="container">
	<h2 class="text-center">Choose Your Illumos Package Set</h2>
	<div class="row">
		<div class="col-md-4">
			<h3 class="text-center">32-bit</h3>
			<p>32-bit binary packages useful for most environments.  32-bit binaries can often be faster, and this set offers the most packages.</p>
		</div>
		<div class="col-md-4">
			<h3 class="text-center">64-bit</h3>
			<p>64-bit binary packages which can utilise the full 64-bit architecture and address space.  Useful for operating on larger data sets.</p>
		</div>
		<div class="col-md-4">
			<h3 class="text-center">Multiarch</h3>
			<p>A 32-bit package set which includes 64-bit libraries.  Useful if you build your own software and want the flexibility of either ABI.</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
{% highlight console %}
: Download 32-bit bootstrap kit
$ curl -Os http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2015Q1-i386.tar.gz

: Verify SHA1 checksum
$ /bin/digest -a sha1 bootstrap-2015Q1-i386.tar.gz
(bootstrap-2015Q1-i386.tar.gz) = 4539ad245abf1bc9911ba8065bfb72e15a9cf811

: Verify PGP signature (optional, requires gpg)
$ curl -Os http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2015Q1-i386.tar.gz.asc
$ gpg --recv-keys 0xDE817B8E
$ gpg --verify bootstrap-2015Q1-i386.tar.gz{.asc,}

: Install bootstrap kit to {{ page.prefix }}
$ sudo tar -zxpf bootstrap-2015Q1-i386.tar.gz -C /

: Add to PATH/MANPATH
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
		</div>
		<div class="col-md-4">
{% highlight console %}
: Download 64-bit bootstrap kit
$ curl -Os http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2015Q1-x86_64.tar.gz

: Verify SHA1 checksum
$ /bin/digest -a sha1 bootstrap-2015Q1-x86_64.tar.gz
(bootstrap-2015Q1-x86_64.tar.gz) = 1a91dcd49e7da2c0603e0985d2136c7dc0c709e7

: Verify PGP signature (optional, requires gpg)
$ curl -Os http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2015Q1-x86_64.tar.gz.asc
$ gpg --recv-keys 0xDE817B8E
$ gpg --verify bootstrap-2015Q1-x86_64.tar.gz{.asc,}

: Install bootstrap kit to {{ page.prefix }}
$ sudo tar -zxpf bootstrap-2015Q1-x86_64.tar.gz -C /

: Add to PATH/MANPATH
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
		</div>
		<div class="col-md-4">
{% highlight console %}
: Download multiarch bootstrap kit
$ curl -Os http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2015Q1-multiarch.tar.gz

: Verify SHA1 checksum
$ /bin/digest -a sha1 bootstrap-2015Q1-multiarch.tar.gz
(bootstrap-2015Q1-multiarch.tar.gz) = 3858dfafb3290ecef8bb343107379bf6b519a54c

: Verify PGP signature (optional, requires gpg)
$ curl -Os http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2015Q1-multiarch.tar.gz.asc
$ gpg --recv-keys 0xDE817B8E
$ gpg --verify bootstrap-2015Q1-multiarch.tar.gz{.asc,}

: Install bootstrap kit to {{ page.prefix }}
$ sudo tar -zxpf bootstrap-2015Q1-multiarch.tar.gz -C /

: Add to PATH/MANPATH
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
		</div>
	</div>
</div>
