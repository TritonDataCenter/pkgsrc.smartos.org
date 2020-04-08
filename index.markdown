---
layout:      default
title:       "Joyent Packages Documentation - Home"
metacontent: Binary pkgsrc package sets for SmartOS/illumos, macOS, and Linux
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
# pkgin -y upgrade
# pkgin search ffmpeg
ffmpeg4-4.1.1   Decoding, encoding and streaming software (v4.x)
ffmpeg3-3.4.5   Decoding, encoding and streaming software (v3.x)
# pkgin install ffmpeg4
{% endhighlight %}
		</div>
		<div class="col-md-4">
{% highlight console %}
# vi /opt/pkg/etc/mk.conf.local
PKG_OPTIONS.ffmpeg4+=   faac x265
CFLAGS+=                -O3
# cd pkgsrc/multimedia/ffmpeg4
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
			<p>Our primary platform is SmartOS, but our packages are portable across illumos distributions.  They are built nightly from pkgsrc trunk for SmartOS, OmniOS, OpenIndiana, and Tribblix.</p>
		</div>
		<div class="col-md-3">
			<h3>macOS</h3>
			<p>For macOS we offer the latest packages built for 64-bit Sierra onwards, or for anyone stuck on older releases we have archived package sets built for 64-bit Mavericks and 32-bit Snow Leopard.</p>
		</div>
		<div class="col-md-3">
			<h3>Linux</h3>
			<p>Our Linux packages are built on CentOS 6 and 7 for distributions based on RedHat Enterprise Linux.  They provide a useful companion to the default set of available RPM packages.</p>
		</div>
		<div class="col-md-3">
			<h3>Others</h3>
			<p>For other platforms you can easily bootstrap the package tools and then build packages from source.  We have support for 23 different operating systems - even Cygwin and Haiku!</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<p><a class="btn btn-orange" href="/install-on-illumos/" role="button">Install on SmartOS/illumos &raquo;</a></p>
		</div>
		<div class="col-md-3">
			<p><a class="btn btn-orange" href="/install-on-osx/" role="button">Install on macOS &raquo;</a></p>
		</div>
		<div class="col-md-3">
			<p><a class="btn btn-orange" href="/install-on-linux/" role="button">Install on Linux &raquo;</a></p>
		</div>
		<div class="col-md-3">
			<p><a class="btn btn-orange" href="/bootstrap/" role="button">Bootstrap from source &raquo;</a></p>
		</div>
	</div>
</div>
