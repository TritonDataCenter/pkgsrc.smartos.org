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
: Download, check, and install bootstrap kit to {{ page.prefix }}
$ curl -Os http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2014Q3-i386.tar.gz
$ digest -a sha1 bootstrap-2014Q3-i386.tar.gz
(bootstrap-2014Q3-i386.tar.gz) = 0ea1b7302d30fc2823b2fe0fdd2ef4b9cfd99119
$ sudo tar -zxpf bootstrap-2014Q3-i386.tar.gz -C /

: Add to PATH/MANPATH
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
		</div>
		<div class="col-md-4">
{% highlight console %}
: Download, check, and install bootstrap kit to {{ page.prefix }}
$ curl -Os http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2014Q3-x86_64.tar.gz
$ digest -a sha1 bootstrap-2014Q3-x86_64.tar.gz
(bootstrap-2014Q3-x86_64.tar.gz) = bde590ce0c003e97a9499050f24a3839a15dea1d
$ sudo tar -zxpf bootstrap-2014Q3-x86_64.tar.gz -C /

: Add to PATH/MANPATH
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
		</div>
		<div class="col-md-4">
{% highlight console %}
: Download, check, and install bootstrap kit to {{ page.prefix }}
$ curl -Os http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-2014Q3-multiarch.tar.gz
$ digest -a sha1 bootstrap-2014Q3-multiarch.tar.gz
(bootstrap-2014Q3-multiarch.tar.gz) = b1f033c57cefe1ae10a48e166309f6b527e7342c
$ sudo tar -zxpf bootstrap-2014Q3-multiarch.tar.gz -C /

: Add to PATH/MANPATH
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
		</div>
	</div>
</div>
