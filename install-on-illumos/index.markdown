---
layout:      install
title:       Joyent Packages Documentation - Install On Illumos
metacontent: Binary pkgsrc package sets for illumos
prefix:      /opt/local
---

<div class="container">
	<h2 class="text-center">Choose Your Illumos Package Set</h2>
	<div class="row">
		<div class="col-md-1">
		</div>
		<div class="col-md-10">
			<p class="lead">
				Packages for illumos distributions are built on SmartOS and offered in three
				different configurations.  If in doubt choose the 32-bit set.  Package sets
				prior to 2014Q4 were built on an old release of SmartOS and should be suitable
				for all distributions.  Sets from 2014Q4 onwards are built on the newer
				<code>joyent_20141030T081701Z</code> and will only function on distributions
				that are based on an illumos-gate of at least that date.  Older bootstraps kits
				are available from the
				<a href="https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/">archive</a>.
			</p>
		</div>
		<div class="col-md-1">
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<h3 class="text-center">32-bit</h3>
			<p>32-bit binary packages useful for most environments.  32-bit binaries will use less memory, and this set offers the most packages.</p>
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
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2015Q1-i386.tar.gz

: Verify SHA1 checksum
$ /bin/digest -a sha1 bootstrap-2015Q1-i386.tar.gz
(bootstrap-2015Q1-i386.tar.gz) = 4539ad245abf1bc9911ba8065bfb72e15a9cf811

: Verify PGP signature (optional, requires gpg)
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2015Q1-i386.tar.gz.asc
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
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2015Q1-x86_64.tar.gz

: Verify SHA1 checksum
$ /bin/digest -a sha1 bootstrap-2015Q1-x86_64.tar.gz
(bootstrap-2015Q1-x86_64.tar.gz) = 1a91dcd49e7da2c0603e0985d2136c7dc0c709e7

: Verify PGP signature (optional, requires gpg)
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2015Q1-x86_64.tar.gz.asc
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
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2015Q1-multiarch.tar.gz

: Verify SHA1 checksum
$ /bin/digest -a sha1 bootstrap-2015Q1-multiarch.tar.gz
(bootstrap-2015Q1-multiarch.tar.gz) = 3858dfafb3290ecef8bb343107379bf6b519a54c

: Verify PGP signature (optional, requires gpg)
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2015Q1-multiarch.tar.gz.asc
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
