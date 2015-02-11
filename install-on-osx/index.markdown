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
: Download, check, and install bootstrap kit to {{ page.prefix }}.
$ curl -Os http://pkgsrc.joyent.com/packages/Darwin/bootstrap/bootstrap-2014Q4-i386.tar.gz
$ shasum bootstrap-2014Q4-i386.tar.gz 
a11fd0f98f5c80295a24dd5c2dec5bd3d19b703c	bootstrap-2014Q4-i386.tar.gz
$ sudo tar -zxpf bootstrap-2014Q4-i386.tar.gz -C /

: Add paths
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH

: Number of packages available
$ pkgin avail | wc -l
  11695
{% endhighlight %}
		</div>
		<div class="col-md-6">
{% highlight console %}
: Download, check, and install bootstrap kit to {{ page.prefix }}.
$ curl -Os http://pkgsrc.joyent.com/packages/Darwin/bootstrap/bootstrap-2014Q4-x86_64.tar.gz
$ shasum bootstrap-2014Q4-x86_64.tar.gz
1ba17cc922304aa4508d1cb8765e936af5a9f5ff	bootstrap-2014Q4-x86_64.tar.gz
$ sudo tar -zxpf bootstrap-2014Q4-x86_64.tar.gz -C /

: Add paths
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH

: Number of packages available
$ pkgin avail | wc -l
   11487
{% endhighlight %}
		</div>
	</div>
	</div>
</div>
