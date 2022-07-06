---
layout:      install
title:       Install on illumos
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
				Thanks to its cross-platform support, pkgsrc is able to combine the
				efforts of developers from NetBSD, SmartOS, macOS, Linux, and others,
				to produce a single package repository containing over 24,000 binary
				packages, providing regularly updated desktop and server packages to
				cover a wide range of requirements.  Our package sets are built on
				SmartOS, but are designed to be portable across all illumos
				distributions, as the examples below running on Tribblix and OmniOS
				demonstrate.
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
				Our packages are built on SmartOS 20210826 but should work on any illumos
				distribution of at least that date, and are regularly updated from pkgsrc
				trunk.  The tools option is a smaller package set designed specifically
				to run in the SmartOS Global Zone.  The upgrade kits unpack newer configs
				and PGP keys over the top of an existing install ready for upgrading.
				Older and LTS kits are in the
                                <a href="https://pkgsrc.smartos.org/packages/SmartOS/bootstrap/">archive</a>.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#standard-install" aria-controls="standard-install" role="tab" data-toggle="tab">Standard</a></li>
				<li role="presentation"><a href="#standard-upgrade" aria-controls="standard-upgrade" role="tab" data-toggle="tab">Standard (upgrade)</a></li>
				<li role="presentation"><a href="#tools-install" aria-controls="tools-install" role="tab" data-toggle="tab">Tools (SmartOS GZ)</a></li>
				<li role="presentation"><a href="#tools-upgrade" aria-controls="tools-upgrade" role="tab" data-toggle="tab">Tools (SmartOS GZ upgrade)</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="standard-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the latest bootstrap.
#
BOOTSTRAP_TAR="bootstrap-trunk-x86_64-20220706.tar.gz"
BOOTSTRAP_SHA="ea959ea26c50a249d131ab05a553392e9bf5ff8e"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.smartos.org/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
[ "${BOOTSTRAP_SHA}" = "$(/bin/digest -a sha1 ${BOOTSTRAP_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
#curl -O https://pkgsrc.smartos.org/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}.asc
#curl -sS https://pkgsrc.smartos.org/pgp/8254B861.asc | gpg2 --import
#gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add to PATH/MANPATH.
PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="standard-upgrade">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to upgrade to the latest bootstrap.  This
# will overwrite the following files:
#
#	{{ page.prefix }}/etc/mk.conf
#	{{ page.prefix }}/etc/pkg_install.conf
#	{{ page.prefix }}/etc/pkgin/repositories.conf
#	{{ page.prefix }}/etc/gnupg/pkgsrc.gpg
#
UPGRADE_TAR="bootstrap-trunk-x86_64-20220706-upgrade.tar.gz"
UPGRADE_SHA="00d0f99bc91eba353445e5b961b22d35cd0ecfcc"

# Download the upgrade kit to the current directory.
curl -O https://pkgsrc.smartos.org/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
[ "${UPGRADE_SHA}" = "$(/bin/digest -a sha1 ${UPGRADE_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
#curl -O https://pkgsrc.smartos.org/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}.asc
#curl -sS https://pkgsrc.smartos.org/pgp/8254B861.asc | gpg2 --import
#gpg2 --verify ${UPGRADE_TAR}{.asc,}

# Unpack upgrade kit to {{ page.prefix }}
tar -zxpf ${UPGRADE_TAR} -C /

# Ensure you are running the latest package tools.
pkg_add -U pkg_install pkgin libarchive

# Clean out any old packages signed with the previous key.
pkgin clean

# Upgrade all packages.
pkgin -y upgrade
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="tools-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the latest tools bootstrap.
#
BOOTSTRAP_TAR="bootstrap-trunk-tools-20220706.tar.gz"
BOOTSTRAP_SHA="c15932a7cc791b8c5f7a0137a7521c28c503b453"

# Ensure you are in a directory with enough space for the bootstrap download,
# by default the SmartOS /root directory is limited to the size of the ramdisk.
cd /var/tmp

# Download the bootstrap kit to the current directory.  Note that we currently
# pass "-k" to skip SSL certificate checks as the GZ doesn't install them.
curl -kO https://pkgsrc.smartos.org/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
[ "${BOOTSTRAP_SHA}" = "$(/bin/digest -a sha1 ${BOOTSTRAP_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
#curl -kO https://pkgsrc.smartos.org/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}.asc
#curl -ksS https://pkgsrc.smartos.org/pgp/8254B861.asc | gpg --import
#gpg --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to /opt/tools
tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add to PATH/MANPATH.
PATH=/opt/tools/sbin:/opt/tools/bin:$PATH
MANPATH=/opt/tools/man:$MANPATH
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="tools-upgrade">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to upgrade to the latest tools bootstrap.  This
# will overwrite the following files:
#
#	/opt/tools/etc/mk.conf
#	/opt/tools/etc/pkg_install.conf
#	/opt/tools/etc/pkgin/repositories.conf
#	/opt/tools/etc/gnupg/pkgsrc.gpg
#
UPGRADE_TAR="bootstrap-trunk-tools-20220706-upgrade.tar.gz"
UPGRADE_SHA="6779b158a17600172585406e67adaeb1a147e045"

# Download the upgrade kit to the current directory.  Note that we currently
# pass "-k" to skip SSL certificate checks as the GZ doesn't install them.
curl -kO https://pkgsrc.smartos.org/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
[ "${UPGRADE_SHA}" = "$(/bin/digest -a sha1 ${UPGRADE_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
#curl -kO https://pkgsrc.smartos.org/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}.asc
#curl -sS https://pkgsrc.smartos.org/pgp/8254B861.asc | gpg --import
#gpg --verify ${UPGRADE_TAR}{.asc,}

# Unpack upgrade kit to /opt/tools
tar -zxpvf ${UPGRADE_TAR} -C /

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
