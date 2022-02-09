---
layout:      install
title:       Joyent Packages Documentation - Install On Illumos
metacontent: Binary pkgsrc package sets for illumos
prefix:      /opt/local
---

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="text-center">Illumos Packages For Server And Desktop</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<p class="lead">
				Thanks to its cross-platform support, pkgsrc is
				able to combine the efforts of developers from
				NetBSD, SmartOS, macOS, Linux, and others, to
				produce a single package repository containing
				over 19,500 binary packages, providing regularly
				updated desktop and server packages to cover a
				wide range of requirements.  Our package sets
				are built on SmartOS, but are designed to be
				portable across all illumos distributions, as
				the examples below running on Tribblix and
				OmniOS demonstrate.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<a href="/img/illumos-desktop-2018Q2.png">
				<img alt="pkgsrc MATE 1.20.0 on Tribblix" src="/img/illumos-desktop-2018Q2.png" class="img-responsive">
			</a>
			<p class="small text-center">
				MATE 1.20.0
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
				<img alt="pkgsrc KDE 4 on OmniOS" src="/img/illumos-desktop-kde4-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				KDE 4
			</p>
		</div>
		<div class="col-md-3">
			<a href="/img/illumos-desktop-awesome.png">
				<img alt="pkgsrc Awesome on OmniOS" src="/img/illumos-desktop-awesome-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				Awesome
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
				Both sets are built on SmartOS 20210826 but should work on any illumos distribution of at least
				that date, and are updated from pkgsrc trunk every night.  The tools repository is a smaller
				package set designed specifically to run in the SmartOS GZ, otherwise use the main 64-bit set.
				Older and LTS bootstrap kits are available from the
                                <a href="https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/">archive</a>.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#64bit-install" aria-controls="64bit-install" role="tab" data-toggle="tab">64-bit</a></li>
				<li role="presentation"><a href="#tools-install" aria-controls="tools-install" role="tab" data-toggle="tab">64-bit tools (SmartOS GZ)</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="64bit-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the latest 64-bit set.
#
BOOTSTRAP_TAR="bootstrap-trunk-x86_64-20220208.tar.gz"
BOOTSTRAP_SHA="09743f63dab4254453a41c85916df46519714487"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
[ "${BOOTSTRAP_SHA}" = "$(/bin/digest -a sha1 ${BOOTSTRAP_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
#curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}.asc
#curl -sS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg2 --import
#gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add to PATH/MANPATH.
PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="tools-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the latest 64-bit tools set.
#
BOOTSTRAP_TAR="bootstrap-trunk-tools-20220208.tar.gz"
BOOTSTRAP_SHA="e0b478bbc3a26589c9bb73a02344868f1738542f"

# Ensure you are in a directory with enough space for the bootstrap download,
# by default the SmartOS /root directory is limited to the size of the ramdisk.
cd /var/tmp

# Download the bootstrap kit to the current directory.  Note that we currently
# pass "-k" to skip SSL certificate checks as the GZ doesn't install them.
curl -kO https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
[ "${BOOTSTRAP_SHA}" = "$(/bin/digest -a sha1 ${BOOTSTRAP_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
#curl -kO https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}.asc
#curl -ksS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg --import
#gpg --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to /opt/tools
tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add to PATH/MANPATH.
PATH=/opt/tools/sbin:/opt/tools/bin:$PATH
MANPATH=/opt/tools/man:$MANPATH
{% endhighlight %}
				</div>
			</div>
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
				To upgrade to the pkgsrc trunk set from a quarterly release follow the steps below.  Upgrades are
				only supported from 2014Q4 onwards, as the packaging tools require support for signed packages.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#64bit-upgrade" aria-controls="64bit-upgrade" role="tab" data-toggle="tab">64-bit</a></li>
				<li role="presentation"><a href="#tools-upgrade" aria-controls="tools-upgrade" role="tab" data-toggle="tab">64-bit tools (SmartOS GZ)</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="64bit-upgrade">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to upgrade to the latest 64-bit set.
#
UPGRADE_TAR="bootstrap-trunk-x86_64-20220208-upgrade.tar.gz"
UPGRADE_SHA="2662aff8a81900a518b7445aefa1015265e27ec2"

# Download the upgrade kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
[ "${UPGRADE_SHA}" = "$(/bin/digest -a sha1 ${UPGRADE_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
#curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}.asc
#curl -sS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg2 --import
#gpg2 --verify ${UPGRADE_TAR}{.asc,}

# Ensure you are running the latest package tools.
PKG_PATH=http://pkgsrc.joyent.com/packages/SmartOS/trunk/x86_64/All pkg_add -U pkg_install pkgin

# Unpack upgrade kit to {{ page.prefix }}
tar -zxpf ${UPGRADE_TAR} -C /

# Upgrade all packages.
pkgin -y upgrade
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="tools-upgrade">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to upgrade to the latest 64-bit tools set.
#
UPGRADE_TAR="bootstrap-trunk-tools-20220208-upgrade.tar.gz"
UPGRADE_SHA="5ef7b802d027f200dba8aaf511a257aa7b3abf6a"

# Download the upgrade kit to the current directory.  Note that we currently
# pass "-k" to skip SSL certificate checks as the GZ doesn't install them.
curl -kO https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
[ "${UPGRADE_SHA}" = "$(/bin/digest -a sha1 ${UPGRADE_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
#curl -kO https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}.asc
#curl -sS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg --import
#gpg --verify ${UPGRADE_TAR}{.asc,}

# Ensure you are running the latest package tools.
PKG_PATH=http://pkgsrc.joyent.com/packages/SmartOS/trunk/tools/All pkg_add -U pkg_install pkgin

# Unpack upgrade kit to /opt/tools
tar -zxpf ${UPGRADE_TAR} -C /

# Upgrade all packages.
pkgin -y upgrade
{% endhighlight %}
				</div>
			</div>
		</div>
	</div>
</div>
