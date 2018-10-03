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
				over 18,500 binary packages, providing regularly
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
				Packages for illumos distributions are built on SmartOS 20141030, but should work on any illumos
				system of at least that date.  If in doubt choose the 64-bit set.  Older bootstrap kits are
				available from the <a href="https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/">archive</a>.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#64bit-install" aria-controls="64bit-install" role="tab" data-toggle="tab">64-bit</a></li>
				<li role="presentation"><a href="#32bit-install" aria-controls="32bit-install" role="tab" data-toggle="tab">32-bit</a></li>
				<li role="presentation"><a href="#multiarch-install" aria-controls="multiarch-install" role="tab" data-toggle="tab">32-bit multiarch</a></li>
				<li role="presentation"><a href="#tools-install" aria-controls="tools-install" role="tab" data-toggle="tab">64-bit tools (SmartOS GZ)</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="64bit-install">
					<p></p>
					<p class="lead1">
						Use the 64-bit package set.  These packages are able to utilise the full x86_64
						instruction set architecture and address space, useful for working with large
						data.  This set has the most packages, and often has packages (golang, rust,
						openjdk8, etc) that are not supported for 32-bit.
					</p>
{% highlight bash %}
#
# Copy and paste the lines below to install the latest 64-bit set.
#
BOOTSTRAP_TAR="bootstrap-2018Q3-x86_64.tar.gz"
BOOTSTRAP_SHA="cd9b3b1ba1680a33acd17b7475d30d2795dbf6c9"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
[ "${BOOTSTRAP_SHA}" = "$(/bin/digest -a sha1 ${BOOTSTRAP_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg --import
gpg --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add to PATH/MANPATH.
PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="32bit-install">
					<p></p>
					<p class="lead1">
						Use the 32-bit package set.  32-bit binaries will use less memory, and in some
						cases may be faster than 64-bit, but will not be able to use the full 64-bit
						address space, and some packages (golang, rust, openjdk8, etc) are not supported
						or available for 32-bit.
					</p>
{% highlight bash %}
#
# Copy and paste the lines below to install the latest 32-bit set.
#
BOOTSTRAP_TAR="bootstrap-2018Q3-i386.tar.gz"
BOOTSTRAP_SHA="9374416dfecffe0079fced05e4e0031ba42249ee"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
[ "${BOOTSTRAP_SHA}" = "$(/bin/digest -a sha1 ${BOOTSTRAP_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg --import
gpg --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add to PATH/MANPATH.
PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="multiarch-install">
					<p></p>
					<p class="lead1">
						Use the 32-bit multiarch package set.  This is similar to the main 32-bit set, but a
						number of packages (currently around 350) also include 64-bit libraries.  This set
						is only useful if you need to compile third-party software against both 32-bit and
						64-bit libraries, otherwise you are better off using either the dedicated 32-bit or
						64-bit sets.
					</p>
{% highlight bash %}
#
# Copy and paste the lines below to install the latest 32-bit multiarch set.
#
BOOTSTRAP_TAR="bootstrap-2018Q3-multiarch.tar.gz"
BOOTSTRAP_SHA="46e6e75fa9c1d7f636259758a562359f595e18c0"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
[ "${BOOTSTRAP_SHA}" = "$(/bin/digest -a sha1 ${BOOTSTRAP_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg --import
gpg --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add to PATH/MANPATH.
PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="tools-install">
					<p></p>
					<p class="lead1">
						Use the 64-bit "tools" set.  This is a special limited set, used primarily for
						package development, but also suitable for installing into the SmartOS Global Zone.
						Note that this set uses the /opt/tools prefix.
					</p>
{% highlight bash %}
#
# Copy and paste the lines below to install the latest 64-bit tools set.
#
BOOTSTRAP_TAR="bootstrap-2018Q3-tools.tar.gz"
BOOTSTRAP_SHA="2244695a8ec0960e26c6f83cbe159a5269033d6a"

# Ensure you are in a directory with enough space for the bootstrap download,
# by default the SmartOS /root directory is limited to the size of the ramdisk.
cd /var/tmp

# Download the bootstrap kit to the current directory.  Note that we currently
# pass "-k" to skip SSL certificate checks as the GZ doesn't install them.
curl -kO https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
[ "${BOOTSTRAP_SHA}" = "$(/bin/digest -a sha1 ${BOOTSTRAP_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
curl -kO https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}.asc
curl -ksS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg --import
gpg --verify ${BOOTSTRAP_TAR}{.asc,}

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
				To upgrade your package set, use the upgrade
				kits below.  Note that this will only update
				the packages, it will not handle configuration
				changes, so you may need to consult your
				software documentation if there are upgrade
				procedures you need to follow (e.g. PostgreSQL).
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#64bit-upgrade" aria-controls="64bit-upgrade" role="tab" data-toggle="tab">64-bit</a></li>
				<li role="presentation"><a href="#32bit-upgrade" aria-controls="32bit-upgrade" role="tab" data-toggle="tab">32-bit</a></li>
				<li role="presentation"><a href="#multiarch-upgrade" aria-controls="multiarch-upgrade" role="tab" data-toggle="tab">32-bit multiarch</a></li>
				<li role="presentation"><a href="#tools-upgrade" aria-controls="tools-upgrade" role="tab" data-toggle="tab">64-bit tools (SmartOS GZ)</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="64bit-upgrade">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to upgrade to the latest 64-bit set.
#
UPGRADE_TAR="bootstrap-2018Q3-x86_64-upgrade.tar.gz"
UPGRADE_SHA="f9fdda463ed20f1316cf710c3f60b7d61a3cf641"

# Download the upgrade kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
[ "${UPGRADE_SHA}" = "$(/bin/digest -a sha1 ${UPGRADE_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg --import
gpg --verify ${UPGRADE_TAR}{.asc,}

# Ensure you are running the latest package tools.
PKG_PATH=http://pkgsrc.joyent.com/packages/SmartOS/2018Q3/x86_64/All pkg_add -U pkg_install pkgin

# Unpack upgrade kit to {{ page.prefix }}
tar -zxpf ${UPGRADE_TAR} -C /

# Upgrade all packages.
pkgin full-upgrade
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="32bit-upgrade">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to upgrade to the latest 32-bit set.
#
UPGRADE_TAR="bootstrap-2018Q3-i386-upgrade.tar.gz"
UPGRADE_SHA="314c353468054fa3ccb1aae99e727d864ad151c1"

# Download the upgrade kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
[ "${UPGRADE_SHA}" = "$(/bin/digest -a sha1 ${UPGRADE_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg --import
gpg --verify ${UPGRADE_TAR}{.asc,}

# Ensure you are running the latest package tools.
PKG_PATH=http://pkgsrc.joyent.com/packages/SmartOS/2018Q3/i386/All pkg_add -U pkg_install pkgin

# Unpack upgrade kit to {{ page.prefix }}
tar -zxpf ${UPGRADE_TAR} -C /

# Upgrade all packages.
pkgin full-upgrade
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="multiarch-upgrade">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to upgrade to the latest 32-bit multiarch set.
#
UPGRADE_TAR="bootstrap-2018Q3-multiarch-upgrade.tar.gz"
UPGRADE_SHA="5930eff6cb1faed317c29479eb697e11bb0b65cc"

# Download the upgrade kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
[ "${UPGRADE_SHA}" = "$(/bin/digest -a sha1 ${UPGRADE_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg --import
gpg --verify ${UPGRADE_TAR}{.asc,}

# Ensure you are running the latest package tools.
PKG_PATH=http://pkgsrc.joyent.com/packages/SmartOS/2018Q3/multiarch/All pkg_add -U pkg_install pkgin

# Unpack upgrade kit to {{ page.prefix }}
tar -zxpf ${UPGRADE_TAR} -C /

# Upgrade all packages.
pkgin full-upgrade
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="tools-upgrade">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to upgrade to the latest 64-bit tools set.
#
UPGRADE_TAR="bootstrap-2018Q3-tools-upgrade.tar.gz"
UPGRADE_SHA="7f4f854c29b61800b05837ea94a352a680573d81"

# Download the upgrade kit to the current directory.  Note that we currently
# pass "-k" to skip SSL certificate checks as the GZ doesn't install them.
curl -kO https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
[ "${UPGRADE_SHA}" = "$(/bin/digest -a sha1 ${UPGRADE_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature.  This step is optional, and requires gpg.
curl -kO https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/DE817B8E.asc | gpg --import
gpg --verify ${UPGRADE_TAR}{.asc,}

# Ensure you are running the latest package tools.
PKG_PATH=http://pkgsrc.joyent.com/packages/SmartOS/2018Q3/tools/All pkg_add -U pkg_install pkgin

# Unpack upgrade kit to /opt/tools
tar -zxpf ${UPGRADE_TAR} -C /

# Upgrade all packages.
pkgin full-upgrade
{% endhighlight %}
				</div>
			</div>
		</div>
	</div>
</div>
