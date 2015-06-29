---
layout:      install
title:       Joyent Packages Documentation - Install On Linux
metacontent: Binary pkgsrc package sets for Linux
prefix:      /usr/pkg
---

<div class="container">
	<h2 class="text-center">Linux EL6-Based Packages</h2>
	<p>
		At present we produce just one set of EL6-compatible packages.
		They should be compatible across all EL6 distributions, such as
		RHEL, Oracle Linux, CentOS and Scientific Linux.
	</p>
	<div class="row">
		<div class="col-md-12">
{% highlight console %}
: Download, check, and install bootstrap kit to {{ page.prefix }}.
$ curl -Os https://pkgsrc.joyent.com/packages/Linux/bootstrap/bootstrap-2014Q2-el6-x86_64.tar.gz
$ sha1sum bootstrap-2014Q2-el6-x86_64.tar.gz
493e0071508064d1d1ea32956d2ede70f3c20c32	bootstrap-2014Q2-el6-x86_64.tar.gz
$ sudo tar -zxpf bootstrap-2014Q2-el6-x86_64.tar.gz -C /

: Add paths
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
		</div>
	</div>
</div>
