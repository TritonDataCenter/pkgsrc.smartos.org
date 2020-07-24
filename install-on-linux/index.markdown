---
layout:      install
title:       Joyent Packages Documentation - Install On Linux
metacontent: Binary pkgsrc package sets for Linux
prefix:      /usr/pkg
---

<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<h2 class="text-center">Choose Your Linux Package Set</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<p class="lead">
				Packages for Linux are currently built for Enterprise Linux
				(i.e. CentOS, Oracle, RedHat, Scientific) versions 6.x and
				7.x.  Both sets are built in 64-bit from pkgsrc trunk and
				are updated with the latest packages every day.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#el7-install" aria-controls="el7-install" role="tab" data-toggle="tab">64-bit EL 7.x</a></li>
				<li role="presentation"><a href="#el6-install" aria-controls="el6-install" role="tab" data-toggle="tab">64-bit EL 6.x</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="el7-install">
					<p></p>
{% highlight console %}
#
# Copy and paste the lines below to install the 64-bit EL 7.x set.
#
BOOTSTRAP_TAR="bootstrap-el7-trunk-x86_64-20200724.tar.gz"
BOOTSTRAP_SHA="478d2e30f150712a851f8f4bcff7f60026f65c9e"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/Linux/el7/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" >check-shasum
sha1sum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/Linux/el7/bootstrap/${BOOTSTRAP_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/56AAACAF.asc | gpg2 --import
gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add paths
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="el6-install">
					<p></p>
{% highlight console %}
#
# Copy and paste the lines below to install the 64-bit EL 6.x set.
#
BOOTSTRAP_TAR="bootstrap-el6-trunk-x86_64-20200724.tar.gz"
BOOTSTRAP_SHA="64ae6d1de6011e20ff09eca77dfb48ce6cdb68d6"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/Linux/el6/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" >check-shasum
sha1sum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/Linux/el6/bootstrap/${BOOTSTRAP_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/56AAACAF.asc | gpg2 --import
gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add paths
$ PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
$ MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
				</div>
			</div>
		</div>
	</div>
</div>
