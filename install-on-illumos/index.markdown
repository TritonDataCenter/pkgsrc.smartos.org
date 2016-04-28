---
layout:      install
title:       Joyent Packages Documentation - Install On Illumos
metacontent: Binary pkgsrc package sets for illumos
prefix:      /opt/local
---

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="text-center">Screenshots</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<a href="/img/illumos-desktop-mate.png">
				<img alt="pkgsrc MATE 1.14.0 on OmniOS" src="/img/illumos-desktop-mate-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				MATE 1.14.0
			</p>
		</div>
		<div class="col-md-3">
			<a href="/img/illumos-desktop-xfce.png">
				<img alt="pkgsrc Xfce 4.12 on OmniOS" src="/img/illumos-desktop-xfce-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				Xfce 4.12
			</p>
		</div>
		<div class="col-md-3">
			<a href="/img/illumos-desktop-kde4.png">
				<img alt="pkgsrc KDE 4.14.15 on OmniOS" src="/img/illumos-desktop-kde4-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				KDE 4.14.15
			</p>
		</div>
		<div class="col-md-3">
			<a href="/img/illumos-desktop-awesome.png">
				<img alt="pkgsrc Awesome 3.5.5 on OmniOS" src="/img/illumos-desktop-awesome-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				Awesome 3.5.5
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<h2 class="text-center">Choose Your Illumos Package Set</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<p class="lead">
				Packages for illumos distributions are built on SmartOS 20141030, but should work on any illumos
				system of at least that date.  If in doubt choose the 32-bit set.  Older bootstrap kits are
				available from the <a href="https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/">archive</a>.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<h3 class="text-center">32-bit</h3>
			<p>32-bit binary packages useful for most environments.  32-bit binaries will use less memory, and in some cases may be faster than 64-bit.</p>
		</div>
		<div class="col-md-4">
			<h3 class="text-center">64-bit</h3>
			<p>64-bit binary packages which utilise the full x86_64 instruction set and address space.  Useful for operating on larger data sets.</p>
		</div>
		<div class="col-md-4">
			<h3 class="text-center">Multiarch</h3>
			<p>A 32-bit package set which includes 64-bit libraries for a small selection of packages.  Use this set only if you know you need it.</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
{% highlight console %}
: Download 32-bit bootstrap kit
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2016Q1-i386.tar.gz

: Verify SHA1 checksum
$ /bin/digest -a sha1 bootstrap-2016Q1-i386.tar.gz
743033133e8cbbbbb44558999a0719325b820928

: Verify PGP signature (optional, requires gpg)
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2016Q1-i386.tar.gz.asc
$ gpg --recv-keys 0xDE817B8E
$ gpg --verify bootstrap-2016Q1-i386.tar.gz{.asc,}

: Install bootstrap kit to {{ page.prefix }}
$ sudo tar -zxpf bootstrap-2016Q1-i386.tar.gz -C /

: Add to PATH/MANPATH
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
		</div>
		<div class="col-md-4">
{% highlight console %}
: Download 64-bit bootstrap kit
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2016Q1-x86_64.tar.gz

: Verify SHA1 checksum
$ /bin/digest -a sha1 bootstrap-2016Q1-x86_64.tar.gz
0208413bf4a7150b2e933e9be6d005d088325faf

: Verify PGP signature (optional, requires gpg)
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2016Q1-x86_64.tar.gz.asc
$ gpg --recv-keys 0xDE817B8E
$ gpg --verify bootstrap-2016Q1-x86_64.tar.gz{.asc,}

: Install bootstrap kit to {{ page.prefix }}
$ sudo tar -zxpf bootstrap-2016Q1-x86_64.tar.gz -C /

: Add to PATH/MANPATH
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
		</div>
		<div class="col-md-4">
{% highlight console %}
: Download multiarch bootstrap kit
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2016Q1-multiarch.tar.gz

: Verify SHA1 checksum
$ /bin/digest -a sha1 bootstrap-2016Q1-multiarch.tar.gz
e3c5a3e4aa1ab61a0498747de786678334e162ea

: Verify PGP signature (optional, requires gpg)
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2016Q1-multiarch.tar.gz.asc
$ gpg --recv-keys 0xDE817B8E
$ gpg --verify bootstrap-2016Q1-multiarch.tar.gz{.asc,}

: Install bootstrap kit to {{ page.prefix }}
$ sudo tar -zxpf bootstrap-2016Q1-multiarch.tar.gz -C /

: Add to PATH/MANPATH
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<h2 class="text-center">Upgrades</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<p class="lead">
				Upgrades aren't fully supported (we don't yet handle major configuration changes) but this
				procedure may work fine for many users and avoid having to re-bootstrap.  If in doubt ensure
				you have backed up your data and configuration files.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<h3 class="text-center">32-bit</h3>
		</div>
		<div class="col-md-4">
			<h3 class="text-center">64-bit</h3>
		</div>
		<div class="col-md-4">
			<h3 class="text-center">Multiarch</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
{% highlight console %}
: Download 32-bit upgrade kit
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2016Q1-i386-upgrade.tar.gz

: Verify SHA1 checksum
$ /bin/digest -a sha1 bootstrap-2016Q1-i386-upgrade.tar.gz
66984686a135b42a6a6a1d5e283e0979f4119a7f

: Verify PGP signature (optional, requires gpg)
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2016Q1-i386-upgrade.tar.gz.asc
$ gpg --recv-keys 0xDE817B8E
$ gpg --verify bootstrap-2016Q1-i386-upgrade.tar.gz{.asc,}

: Unpack upgrade kit to {{ page.prefix }}
$ sudo tar -zxpf bootstrap-2016Q1-i386-upgrade.tar.gz -C /

: Upgrade pkgin
$ sudo pkg_add -U pkgin

: Upgrade all packages
$ sudo pkgin full-upgrade
{% endhighlight %}
		</div>
		<div class="col-md-4">
{% highlight console %}
: Download 64-bit upgrade kit
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2016Q1-x86_64-upgrade.tar.gz

: Verify SHA1 checksum
$ /bin/digest -a sha1 bootstrap-2016Q1-x86_64-upgrade.tar.gz
e4a368fa4dd948c85384b94a84fd9cca053a9f66

: Verify PGP signature (optional, requires gpg)
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2016Q1-x86_64-upgrade.tar.gz.asc
$ gpg --recv-keys 0xDE817B8E
$ gpg --verify bootstrap-2016Q1-x86_64-upgrade.tar.gz{.asc,}

: Unpack upgrade kit to {{ page.prefix }}
$ sudo tar -zxpf bootstrap-2016Q1-x86_64-upgrade.tar.gz -C /

: Upgrade pkgin
$ sudo pkg_add -U pkgin

: Upgrade all packages
$ sudo pkgin full-upgrade
{% endhighlight %}
		</div>
		<div class="col-md-4">
{% highlight console %}
: Download multiarch upgrade kit
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2016Q1-multiarch-upgrade.tar.gz

: Verify SHA1 checksum
$ /bin/digest -a sha1 bootstrap-2016Q1-multiarch-upgrade.tar.gz
556eb1448333d5ce70150f45db71c49144b782c0

: Verify PGP signature (optional, requires gpg)
$ curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2016Q1-multiarch-upgrade.tar.gz.asc
$ gpg --recv-keys 0xDE817B8E
$ gpg --verify bootstrap-2016Q1-multiarch-upgrade.tar.gz{.asc,}

: Unpack upgrade kit to {{ page.prefix }}
$ sudo tar -zxpf bootstrap-2016Q1-multiarch-upgrade.tar.gz -C /

: Upgrade pkgin
$ sudo pkg_add -U pkgin

: Upgrade all packages
$ sudo pkgin full-upgrade
{% endhighlight %}
		</div>
	</div>
</div>
