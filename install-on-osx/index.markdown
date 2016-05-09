---
layout:      install
title:       Joyent Packages Documentation - Install On Mac OS X
metacontent: Binary pkgsrc package sets for Mac OS X
prefix:      /opt/pkg
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
				These example screenshots show just a small number of the 14,000+ binary
				packages available in our 64-bit pkgsrc set.  All examples were produced
				on a clean install of OS X El Capitan (10.11.4) inside VMware Fusion.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<a href="/img/osx-desktop-xfce.png">
				<img alt="pkgsrc XFCE 4.12 on OSX" src="/img/osx-desktop-xfce-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				XFCE 4.12 / Gnumeric / Inkscape
			</p>
		</div>
		<div class="col-md-3">
			<a href="/img/osx-desktop-apps.png">
				<img alt="pkgsrc apps on OSX" src="/img/osx-desktop-apps-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				GIMP / XChat
			</p>
		</div>
		<div class="col-md-3">
			<a href="/img/osx-install-nodejs.png">
				<img alt="Installing pkgsrc nodejs on OSX" src="/img/osx-install-nodejs-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				Installing Node.js
			</p>
		</div>
		<div class="col-md-3">
			<a href="/img/osx-install-jekyll.png">
				<img alt="Running pkgsrc jekyll on OSX" src="/img/osx-install-jekyll-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				Installing and running Jekyll (Ruby 2.3 version)
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<h2 class="text-center">Choose Your OS X Package Set</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<p class="lead">
				Packages for Mac OS X are offered in two different configurations, a 32-bit
				set built on Snow Leopard suitable for 10.6+ and a 64-bit set built on
				Mavericks suitable for 10.9+.  Both sets are built from pkgsrc trunk and are
				updated with the latest packages every few days.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
{% highlight bash %}
# Use the 32-bit 10.6+ built with gcc 4.2.1 set if you are running an older
# release on hardware that lacks 64-bit support.
BOOTSTRAP_TAR="bootstrap-trunk-i386-20160509.tar.gz"
BOOTSTRAP_SHA="e900f05c9f3aa8e2fb7ccee370467acf95f5df21"

# Use the 64-bit 10.9+ build with clang-600.0.56 set for all other systems.
BOOTSTRAP_TAR="bootstrap-trunk-x86_64-20160509.tar.gz"
BOOTSTRAP_SHA="8615ae7bfa4a4efd386ca735ffd7eecf99343b57"

# Download the selected bootstrap kit.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}

# Verify SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" >check-shasum
shasum -c check-shasum

# Verify PGP signature (optional, requires gpg).
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}.asc
gpg --recv-keys 0x1F32A9AD
gpg --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}.
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Reload PATH/MANPATH (pkgsrc installs /etc/paths.d/10-pkgsrc for new sessions)
eval $(/usr/libexec/path_helper)
{% endhighlight %}
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<h2 class="text-center">Upgrading From Previous Releases</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<p class="lead">
				If you wish to upgrade from a previous pkgsrc-2015Q2 or pkgsrc-2015Q3 installation
				then follow the instructions below.  Upgrades from pkgsrc-2015Q2 and earlier are not
				supported as those sets used a different installation prefix, so the full bootstrap
				kit instructions as detailed above are required.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
{% highlight bash %}
# Select 32-bit upgrade kit.
UPGRADE_TAR="bootstrap-trunk-i386-20160509-upgrade.tar.gz"
UPGRADE_SHA="264ccde9985698defcf8db808c543d68eb10217d"

# Select 64-bit upgrade kit.
UPGRADE_TAR="bootstrap-trunk-x86_64-20160509-upgrade.tar.gz"
UPGRADE_SHA="c86bcb09b1ee5facb40cc77d57d8ee877c85fe14"

# Download the selected upgrade kit.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap-upgrade/${UPGRADE_TAR}

# Verify SHA1 checksum.
echo "${UPGRADE_SHA}  ${UPGRADE_TAR}" >check-shasum
shasum -c check-shasum

# Verify PGP signature (optional, requires gpg).
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${UPGRADE_TAR}.asc
gpg --recv-keys 0x1F32A9AD
gpg --verify ${UPGRADE_TAR}{.asc,}

# Unpack bootstrap upgrade kit over {{ page.prefix }}.
sudo tar -zxpf ${UPGRADE_TAR} -C /

# Upgrade pkgin.
sudo pkg_add -U pkgin

# Upgrade all packages.
sudo pkgin full-upgrade

# There is a small chance that there may be some packages which still have
# references to Xquartz from /opt/X11.  The trunk packages use Xquartz from
# pkgsrc, so to ensure the newer versions are installed use this command.
for pkg in $(pkg_info | awk '{print $1}'); do
  pkg_info -Q REQUIRES ${pkg} | grep '^/opt/X11' >/dev/null 2>&1 && echo ${pkg}
done | xargs pkgin -Fy install
{% endhighlight %}
		</div>
	</div>
</div>
