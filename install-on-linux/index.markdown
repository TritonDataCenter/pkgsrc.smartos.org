---
layout:      install
title:       Install on Linux
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
				(i.e. CentOS, Oracle, RedHat, Scientific) version 7.x.  They
				are built from pkgsrc trunk and are updated every few days.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#el7-install" aria-controls="el7-install" role="tab" data-toggle="tab">EL 7.x</a></li>
				<li role="presentation"><a href="#el7-upgrade" aria-controls="el7-upgrade" role="tab" data-toggle="tab">EL 7.x (upgrade)</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="el7-install">
					<p></p>
{% highlight console %}
#
# Copy and paste the lines below to install the 64-bit EL 7.x set.
#
BOOTSTRAP_TAR="bootstrap-el7-trunk-x86_64-20220718.tar.gz"
BOOTSTRAP_SHA="7ecea7fd3b49259aa7318d8cd72901966ad5329f"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.smartos.org/packages/Linux/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" >check-shasum
sha1sum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
#curl -O https://pkgsrc.smartos.org/packages/Linux/bootstrap/${BOOTSTRAP_TAR}.asc
#curl -sS https://pkgsrc.smartos.org/pgp/5FE35E6E.asc | gpg2 --import
#gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add paths
PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="el7-upgrade">
					<p></p>
{% highlight console %}
#
# Copy and paste the lines below to upgrade to the latest bootstrap.  This
# will overwrite the following files:
#
#	{{ page.prefix }}/etc/mk.conf
#	{{ page.prefix }}/etc/pkg_install.conf
#	{{ page.prefix }}/etc/pkgin/repositories.conf
#	{{ page.prefix }}/etc/gnupg/pkgsrc.gpg
#
UPGRADE_TAR="bootstrap-el7-trunk-x86_64-20220718-upgrade.tar.gz"
UPGRADE_SHA="e7c364c002ddf85ebda416644aa0309588be4e9e"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.smartos.org/packages/Linux/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
echo "${UPGRADE_SHA}  ${UPGRADE_TAR}" >check-shasum
sha1sum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
#curl -O https://pkgsrc.smartos.org/packages/Linux/bootstrap-upgrade/${UPGRADE_TAR}.asc
#curl -sS https://pkgsrc.smartos.org/pgp/5FE35E6E.asc | gpg2 --import
#gpg2 --verify ${UPGRADE_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${UPGRADE_TAR} -C /

# Ensure you are running the latest package tools.
pkg_add -U pkg_install pkgin libarchive

# Clean out any old packages signed with the previous key.
pkgin clean

# Upgrade all packages.
pkgin -y upgrade
{% endhighlight %}
				</div>
			</div>
		</div>
	</div>
</div>
