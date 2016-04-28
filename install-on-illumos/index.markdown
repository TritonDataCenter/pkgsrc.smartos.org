---
layout:      install
title:       Joyent Packages Documentation - Install On Illumos
metacontent: Binary pkgsrc package sets for illumos
prefix:      /opt/local
---

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="text-center">Screenshots</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<p class="lead">
				These example screenshots show just a small number of the 15,000+ binary packages available in our
				pkgsrc sets.  All examples were produced on a clean install of OmniOS r151018 using pkgsrc Xorg.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<a href="/img/illumos-desktop-mate.png">
				<img alt="pkgsrc MATE 1.14.0 on OmniOS" src="/img/illumos-desktop-mate-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				MATE 1.14.0
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
				<img alt="pkgsrc KDE 4.14.15 on OmniOS" src="/img/illumos-desktop-kde4-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				KDE 4.14.15
			</p>
		</div>
		<div class="col-md-3">
			<a href="/img/illumos-desktop-awesome.png">
				<img alt="pkgsrc Awesome 3.5.5 on OmniOS" src="/img/illumos-desktop-awesome-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				Awesome 3.5.5
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
				system of at least that date.  If in doubt choose the 32-bit set.  Older bootstrap kits are
				available from the <a href="https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/">archive</a>.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
{% highlight bash %}
# Use the 32-bit package set.  This is useful for most environments.  32-bit
# binaries will use less memory, and in some cases may be faster than 64-bit.
BOOTSTRAP_TAR="bootstrap-2016Q1-i386.tar.gz"
BOOTSTRAP_SHA="743033133e8cbbbbb44558999a0719325b820928"

# Use the 64-bit package set.  These packages are able to utilise the full
# x86_64 instruction set and address space, useful for working with large data.
BOOTSTRAP_TAR="bootstrap-2016Q1-x86_64.tar.gz"
BOOTSTRAP_SHA="0208413bf4a7150b2e933e9be6d005d088325faf"

# Use the multiarch package set.  These are 32-bit packages for which some
# packages also include 64-bit libraries.  Only use if you know you need it.
BOOTSTRAP_TAR="bootstrap-2016Q1-multiarch.tar.gz"
BOOTSTRAP_SHA="e3c5a3e4aa1ab61a0498747de786678334e162ea"

# Download the selected bootstrap kit.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}

# Verify SHA1 checksum.
[ "${BOOTSTRAP_SHA}" = "$(/bin/digest -a sha1 ${BOOTSTRAP_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature (optional, requires gpg).
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap/${BOOTSTRAP_TAR}.asc
gpg --recv-keys 0xDE817B8E
gpg --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}.
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add to PATH/MANPATH.
PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
MANPATH={{ page.prefix }}/man:$MANPATH
{% endhighlight %}
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
				Upgrades aren't fully supported (we don't yet handle major configuration changes) but this
				procedure may work fine for many users and avoid having to re-bootstrap.  If in doubt ensure
				you have backed up your data and configuration files.  Make sure you use the same set that
				was originally installed.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
{% highlight bash %}
# Select 32-bit upgrade kit.
UPGRADE_TAR="bootstrap-2016Q1-i386-upgrade.tar.gz"
UPGRADE_SHA="66984686a135b42a6a6a1d5e283e0979f4119a7f"

# Select 64-bit upgrade kit.
UPGRADE_TAR="bootstrap-2016Q1-x86_64-upgrade.tar.gz"
UPGRADE_SHA=""

# Select multiarch upgrade kit.
UPGRADE_TAR="bootstrap-2016Q1-multiarch-upgrade.tar.gz"
UPGRADE_SHA="556eb1448333d5ce70150f45db71c49144b782c0"

# Download selected upgrade kit.
curl -O https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}

# Verify SHA1 checksum.
[ "${UPGRADE_SHA}" = "$(/bin/digest -a sha1 ${UPGRADE_TAR})" ] || echo "ERROR: checksum failure"

# Verify PGP signature (optional, requires gpg).
curl -Os https://pkgsrc.joyent.com/packages/SmartOS/bootstrap-upgrade/${UPGRADE_TAR}.asc
gpg --recv-keys 0xDE817B8E
gpg --verify ${UPGRADE_TAR}{.asc,}

# Unpack upgrade kit to {{ page.prefix }}.
sudo tar -zxpf ${UPGRADE_TAR} -C /

# Upgrade pkgin.
sudo pkg_add -U pkgin

# Upgrade all packages.
sudo pkgin full-upgrade
{% endhighlight %}
		</div>
	</div>
</div>
