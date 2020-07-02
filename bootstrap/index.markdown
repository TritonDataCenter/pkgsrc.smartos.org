---
layout: default
title: Joyent Packages Documentation - Home
---

<h2 class="text-center">Bootstrap From Source</h2>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<h3>1. Fetch pkgsrc</h3>
			<p>
				pkgsrc is primarily distributed using CVS, however there are git mirrors if you prefer.
			</p>
		</div>
		<div class="col-md-6">
			<h3>2. Perform bootstrap</h3>
			<p>
				Use the <code>bootstrap</code> script to build a set of pkg tools under a specific prefix.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
{% highlight console %}
: Get the latest pkgsrc.  Use -r to fetch a particular branch.
$ export CVS_RSH=ssh
$ cvs -d anoncvs@anoncvs.netbsd.org:/cvsroot co -P pkgsrc

: Or with git.  Check out a particular branch, or stay on trunk for the latest.
$ git clone https://github.com/NetBSD/pkgsrc.git
$ cd pkgsrc
$ git checkout pkgsrc-2019Q4
{% endhighlight %}
		</div>
		<div class="col-md-6">
{% highlight console %}
: To build a pkgsrc installation in your home directory.
$ cd pkgsrc/bootstrap
$ ./bootstrap --prefix=${HOME}/pkg --unprivileged
$ PATH=${HOME}/pkg/sbin:${HOME}/pkg/bin:${PATH}
$ MANPATH=${HOME}/pkg/man:${MANPATH}

: Bootstrap has many options, use --help to show them.
$ ./bootstrap --help
{% endhighlight %}
		</div>
	</div>
</div>
