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
				Packages for Mac OS X are offered in two different configurations, a 64-bit set
				built on Mavericks suitable for users running 10.9 or newer (recommended), and a
				32-bit set built on Snow Leopard suitable for users still running legacy OS X
				releases on 32-bit hardware.  Both sets are built from pkgsrc trunk and are
				updated with the latest packages every few days.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#64bit-install" aria-controls="64bit-install" role="tab" data-toggle="tab">64-bit 10.9+</a></li>
				<li role="presentation"><a href="#32bit-install" aria-controls="32bit-install" role="tab" data-toggle="tab">32-bit 10.6+</a></li>
				<li role="presentation"><a href="#64bit-upgrade" aria-controls="64bit-upgrade" role="tab" data-toggle="tab">64-bit (upgrade)</a></li>
				<li role="presentation"><a href="#32bit-upgrade" aria-controls="32bit-upgrade" role="tab" data-toggle="tab">32-bit (upgrade)</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="64bit-install">
					<p></p>
					<p class="lead1">
						64-bit set built on OS X Mavericks (10.9) using clang-600.0.56.
						Use this set unless you specifically need packages built for an
						older release or do not have 64-bit hardware.
					</p>
{% highlight bash %}
#
# Copy and paste the lines below to install the 64-bit 10.9+ set.
#
BOOTSTRAP_TAR="bootstrap-trunk-x86_64-20170205.tar.gz"
BOOTSTRAP_SHA="177e0be390b57ef9d7f61511a8169268000693df"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" >check-shasum
shasum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}.asc
gpg --recv-keys 0x1F32A9AD
gpg --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Reload PATH/MANPATH (pkgsrc installs /etc/paths.d/10-pkgsrc for new sessions)
eval $(/usr/libexec/path_helper)
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="32bit-install">
					<p></p>
					<p class="lead1">
						32-bit set built on OS X Snow Leopard (10.6) using GCC 4.2.1.
						Use this set only if you are running an OS X release prior to
						Mavericks (10.9) or do not have 64-bit hardware.
					</p>
{% highlight bash %}
#
# Copy and paste the lines below to install the 32-bit 10.6+ set.
#
BOOTSTRAP_TAR="bootstrap-trunk-i386-20160509.tar.gz"
BOOTSTRAP_SHA="e900f05c9f3aa8e2fb7ccee370467acf95f5df21"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" >check-shasum
shasum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}.asc
gpg --recv-keys 0x1F32A9AD
gpg --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Reload PATH/MANPATH (pkgsrc installs /etc/paths.d/10-pkgsrc for new sessions)
eval $(/usr/libexec/path_helper)
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="64bit-upgrade">
					<p></p>
					<p class="lead1">
						If you are upgrading from non-HTTPS trunk skip this first section.
					</p>
					<p class="lead1">
						If you are upgrading from pkgsrc-2015Q[23] follow the instructions
						below, then also perform the trunk HTTPS upgrade in the next section.
					</p>
					<p class="lead1">
						If you are currently running a pkgsrc-2015Q1 or earlier release you
						will need to follow the full install instructions, as the install
						prefix changed from /usr/pkg to /opt/pkg.
					</p>
{% highlight bash %}
#
# In order to switch from pkgsrc-2015Q[23] to trunk we first need to handle
# some incompatible pkg_install changes.  This first upgrade kit will switch
# us to the trunk repository and new PGP key but continue to use HTTP instead
# of HTTPS until the tools have been updated.
#
UPGRADE_TAR="bootstrap-trunk-x86_64-20160509-upgrade.tar.gz"
UPGRADE_SHA="c86bcb09b1ee5facb40cc77d57d8ee877c85fe14"

# Download the upgrade kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
echo "${UPGRADE_SHA}  ${UPGRADE_TAR}" >check-shasum
shasum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap-upgrade/${UPGRADE_TAR}.asc
gpg --recv-keys 0x1F32A9AD
gpg --verify ${UPGRADE_TAR}{.asc,}

# Unpack bootstrap upgrade kit over {{ page.prefix }}
sudo tar -zxpf ${UPGRADE_TAR} -C /

#
# Use pkgin to download the latest pkg_install package without installing it.
# There are incompatible PGP changes so verification would fail.
#
sudo pkgin -d install pkg_install

# Unpack the unsigned pkg_install package from the archive.
ar xv /var/db/pkgin/cache/pkg_install-2*.tgz

# Install the unsigned package, bypassing the verification process.
sudo pkg_add -C /dev/null -U pkg_install-2*.tmp.tgz

# Remove the unpacked package contents
rm -f +PKG_* pkg_install-2*.tmp.tgz

# Now we are running an updated pkg_install so we can re-install both
# pkg_install and pkgin with signature verification re-enabled.
sudo pkg_add -U pkg_install pkgin

# Upgrade all packages.
sudo pkgin full-upgrade

#
# When upgrading from an older pkgsrc-2015Q[23] install there is a small
# chance that there may be some packages which still have references to
# Xquartz from /opt/X11.  The trunk packages use Xquartz from pkgsrc, so
# to ensure the newer versions are installed use this command.
#
for pkg in $(pkg_info | awk '{print $1}'); do
  pkg_info -Q REQUIRES ${pkg} | grep '^/opt/X11' >/dev/null 2>&1 && echo ${pkg}
done | xargs pkgin -Fy install
{% endhighlight %}
					<p class="lead1">
						To upgrade to an HTTPS trunk install follow the instructions below.
					</p>
{% highlight bash %}
#
# Use this kit to change the repositories to fetch via HTTPS by default.  If
# your /opt/pkg/etc/pkg_install.conf file already uses "https://" you do not
# need to perform these steps.
#
UPGRADE_TAR="bootstrap-trunk-x86_64-20170205-upgrade.tar.gz"
UPGRADE_SHA="734c58387d740fab870f360c0ff84fa4b13de70f"

# Download the upgrade kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
echo "${UPGRADE_SHA}  ${UPGRADE_TAR}" >check-shasum
shasum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap-upgrade/${UPGRADE_TAR}.asc
gpg --recv-keys 0x1F32A9AD
gpg --verify ${UPGRADE_TAR}{.asc,}

# Ensure you are running the latest package tools.
sudo pkg_add -U pkg_install pkgin

# Unpack bootstrap upgrade kit over {{ page.prefix }}
sudo tar -zxpf ${UPGRADE_TAR} -C /

# Re-install the package tools again in case the repository changed.
sudo pkg_add -U pkg_install pkgin

# Upgrade all packages.
sudo pkgin full-upgrade
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="32bit-upgrade">
					<p></p>
					<p class="lead1">
						Use these sets to upgrade from a previous pkgsrc-2015Q[23] or trunk 32-bit
						install.  If you are currently running a pkgsrc-2015Q1 or earlier release
						you will need to follow the full install instructions.
					</p>
{% highlight bash %}
#
# Copy and paste the lines below to upgrade to the latest 32-bit set.
#
UPGRADE_TAR="bootstrap-trunk-i386-20160509-upgrade.tar.gz"
UPGRADE_SHA="264ccde9985698defcf8db808c543d68eb10217d"

# Download the upgrade kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
echo "${UPGRADE_SHA}  ${UPGRADE_TAR}" >check-shasum
shasum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap-upgrade/${UPGRADE_TAR}.asc
gpg --recv-keys 0x1F32A9AD
gpg --verify ${UPGRADE_TAR}{.asc,}

# Ensure you are running the latest package tools.
sudo pkg_add -U pkg_install pkgin

# Unpack bootstrap upgrade kit over {{ page.prefix }}
sudo tar -zxpf ${UPGRADE_TAR} -C /

# Re-install the package tools again in case the repository changed.
sudo pkg_add -U pkg_install pkgin

# Upgrade all packages.
sudo pkgin full-upgrade

#
# When upgrading from an older pkgsrc-2015Q[23] install there is a small
# chance that there may be some packages which still have references to
# Xquartz from /opt/X11.  The trunk packages use Xquartz from pkgsrc, so
# to ensure the newer versions are installed use this command.
#
for pkg in $(pkg_info | awk '{print $1}'); do
  pkg_info -Q REQUIRES ${pkg} | grep '^/opt/X11' >/dev/null 2>&1 && echo ${pkg}
done | xargs pkgin -Fy install
{% endhighlight %}
				</div>
			</div>
		</div>
	</div>
</div>
