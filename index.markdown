---
layout:      default
title:       "Joyent Packages Documentation - Home"
metacontent: Binary pkgsrc package sets for SmartOS/illumos, Mac OS X, and Linux
---

<div class="container">
	<div class="row">
		<div class="col-md-4">
			<h3>Install Binary Packages</h3>
			<p>
				We provide the <code>pkgin</code> binary package manager with our bootstrap kits,
				making it easy to search for, install, and upgrade binary packages.  If you are used to
				<code>apt-get</code> or <code>yum</code> on Linux it should feel very familiar.
			</p>
		</div>
		<div class="col-md-4">
			<h3>Build From Source</h3>
			<p>
				If you prefer you can build packages from source, perhaps to use different package
				options or <code>CFLAGS</code>.  No problem!  One simple command automatically
				downloads, builds, and installs everything required - even dependencies!
			</p>
		</div>
		<div class="col-md-4">
			<h3>Create New Packages</h3>
			<p>
				If a package you want isn't available yet, it's easy to create it.  Packages are driven
				by a simple Makefile, tools are available to make creating new packages easy, and there
				is infrastructure built-in to handle many portability issues.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
{% highlight console %}
# pkgin search nodejs
nodejs-0.12.2    V8 JavaScript runtime
# pkgin -y install nodejs
# node -e 'console.log("hello!")'
hello!
{% endhighlight %}
		</div>
		<div class="col-md-4">
{% highlight console %}
# vi /usr/pkg/etc/mk.conf
PKG_OPTIONS.node=	dtrace openssl
CFLAGS=			-O3
# cd pkgsrc/lang/nodejs
# bmake install
{% endhighlight %}
		</div>
		<div class="col-md-4">
{% highlight console %}
# mkdir misc/foo
# cd misc/foo
# url2pkg http://si.te/foo-1.0.tar.gz
# vi Makefile
# bmake install
{% endhighlight %}
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<h3>SmartOS/Illumos</h3>
			<p>Our primary platform is SmartOS, but our packages are portable across illumos distributions.  They are available in 3 sets (32-bit, 64-bit, multiarch) and are tested on OmniOS and OpenIndiana.</p>
		</div>
		<div class="col-md-3">
			<h3>Mac OS X</h3>
			<p>For OS X you can choose between 32-bit packages built on Snow Leopard for maximum portability, or 64-bit packages built on Mavericks to take advantage of newer features and compilers.</p>
		</div>
		<div class="col-md-3">
			<h3>Linux</h3>
			<p>Our Linux packages are built on CentOS 6 for distributions based on RHEL 6 and are available for 32-bit and 64-bit.  They provide a useful companion to the default set of available RPM packages.</p>
		</div>
		<div class="col-md-3">
			<h3>Others</h3>
			<p>For all other platforms you can easily bootstrap the package tools and then start building packages from source.  We have support for 23 different operating systems - even Windows/Cygwin and Haiku!</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<p><a class="btn btn-orange" href="/install-on-illumos/" role="button">Install on SmartOS/illumos &raquo;</a></p>
		</div>
		<div class="col-md-3">
			<p><a class="btn btn-orange" href="/install-on-osx/" role="button">Install on Mac OS X &raquo;</a></p>
		</div>
		<div class="col-md-3">
			<p><a class="btn btn-orange" href="/install-on-linux/" role="button">Install on Linux &raquo;</a></p>
		</div>
		<div class="col-md-3">
			<p><a class="btn btn-orange" href="/bootstrap/" role="button">Bootstrap from source &raquo;</a></p>
		</div>
	</div>
</div>
