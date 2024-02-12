---
layout:      install
title:       Install on macOS
metacontent: Binary pkgsrc package sets for macOS
prefix:      /opt/pkg
---

<div class="container">
	<div class="row">
		<div class="col-md-3">
			<a href="/img/osx-desktop-xfce.png">
				<img alt="pkgsrc XFCE 4.12 on macOS" src="/img/osx-desktop-xfce-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				XFCE 4.12 / Gnumeric / Inkscape
			</p>
		</div>
		<div class="col-md-3">
			<a href="/img/osx-desktop-apps.png">
				<img alt="pkgsrc apps on macOS" src="/img/osx-desktop-apps-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				GIMP / XChat
			</p>
		</div>
		<div class="col-md-3">
			<a href="/img/osx-install-nodejs.png">
				<img alt="Installing pkgsrc nodejs on macOS" src="/img/osx-install-nodejs-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				Installing Node.js
			</p>
		</div>
		<div class="col-md-3">
			<a href="/img/osx-install-jekyll.png">
				<img alt="Running pkgsrc jekyll on macOS" src="/img/osx-install-jekyll-small.png" class="img-responsive">
			</a>
			<p class="small text-center">
				Installing and running Jekyll (Ruby 2.3 version)
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<h2 class="text-center">Choose Your macOS Package Set</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<p class="lead">
				Our primary packages for macOS are available for both Apple Silicon (ARM M1/M2)
				and Intel x86, running Big Sur or newer.  They are built from pkgsrc trunk and
				are updated every week.
			</p>
			<p class="lead">
				Select the upgrade kits to migrate from an existing pkgsrc.joyent.com install
				to the new pkgsrc.smartos.org repository.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#arm64-install" aria-controls="arm64-install" role="tab" data-toggle="tab">ARM 11.3+</a></li>
				<li role="presentation"><a href="#intel-install" aria-controls="intel-install" role="tab" data-toggle="tab">Intel 11.3+</a></li>
				<li role="presentation"><a href="#arm64-upgrade" aria-controls="arm64-upgrade" role="tab" data-toggle="tab">ARM 11.3+ (upgrade)</a></li>
				<li role="presentation"><a href="#intel-upgrade" aria-controls="intel-upgrade" role="tab" data-toggle="tab">Intel 11.3+ (upgrade)</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="active tab-pane" id="arm64-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the Apple Silicon (M1/M2) set.
#
# These packages are suitable for anyone running Big Sur (11.3) or newer on
# Apple Silicon (M1/M2) CPUs, and are updated from pkgsrc trunk every week.
#
# This should only ever be performed once.  Unpacking the bootstrap kit over
# the top of an existing install will probably break things.
#
BOOTSTRAP_TAR="bootstrap-macos11-trunk-arm64-20240212.tar.gz"
BOOTSTRAP_SHA="3d2a31e1f3eb026bb9ed0b3a63787355ad73a958"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.smartos.org/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" | shasum -c-

# Verify PGP signature.  This step is optional, and requires gpg.
# curl -O https://pkgsrc.smartos.org/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}.asc
# curl -sS https://pkgsrc.smartos.org/pgp/ED09C4B0.asc | gpg2 --import
# gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Reload PATH/MANPATH (pkgsrc installs /etc/paths.d/10-pkgsrc for new sessions)
eval $(/usr/libexec/path_helper)
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="arm64-upgrade">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to upgrade to the latest bootstrap.  This
# will overwrite the following files:
#
#       {{ page.prefix }}/etc/mk.conf
#       {{ page.prefix }}/etc/pkg_install.conf
#       {{ page.prefix }}/etc/pkgin/repositories.conf
#       {{ page.prefix }}/etc/gnupg/pkgsrc.gpg
#
# This only ever needs to be done once when any of the above files change, for
# example if switching from pkgsrc.joyent.com to pkgsrc.smartos.org.  Under
# normal operation "pkgin upgrade" is all you need to be up-to-date.
#
UPGRADE_TAR="bootstrap-macos11-trunk-arm64-20240212-upgrade.tar.gz"
UPGRADE_SHA="e7040b560020e81976ddb6993e16ca61774cde1d"

# Download the upgrade kit to the current directory.
curl -O https://pkgsrc.smartos.org/packages/Darwin/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
echo "${UPGRADE_SHA}  ${UPGRADE_TAR}" | shasum -c-

# Verify PGP signature.  This step is optional, and requires gpg.
# curl -O https://pkgsrc.smartos.org/packages/Darwin/bootstrap-upgrade/${UPGRADE_TAR}.asc
# curl -sS https://pkgsrc.smartos.org/pgp/ED09C4B0.asc | gpg2 --import
# gpg2 --verify ${UPGRADE_TAR}{.asc,}

# Unpack upgrade kit to {{ page.prefix }}
sudo tar -zxpf ${UPGRADE_TAR} -C /

# Ensure you are running the latest package tools.
sudo pkg_add -U pkg_install pkgin libarchive

# Clean out any old packages signed with the previous key.
sudo pkgin clean

# Upgrade all packages.
sudo pkgin -y upgrade
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="intel-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the Intel set.
#
# These packages are suitable for anyone running Big Sur (11.3) or newer on
# Intel x86 CPUs, and are updated from pkgsrc trunk every week.
#
# This should only ever be performed once.  Unpacking the bootstrap kit over
# the top of an existing install will probably break things.
#
BOOTSTRAP_TAR="bootstrap-macos11-trunk-x86_64-20240212.tar.gz"
BOOTSTRAP_SHA="c4b71fe9bf0ef89cc8d38909496a75693050cd96"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.smartos.org/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" | shasum -c-

# Verify PGP signature.  This step is optional, and requires gpg.
# curl -O https://pkgsrc.smartos.org/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}.asc
# curl -sS https://pkgsrc.smartos.org/pgp/ED09C4B0.asc | gpg2 --import
# gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Reload PATH/MANPATH (pkgsrc installs /etc/paths.d/10-pkgsrc for new sessions)
eval $(/usr/libexec/path_helper)
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="intel-upgrade">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to upgrade to the latest bootstrap.  This
# will overwrite the following files:
#
#       {{ page.prefix }}/etc/mk.conf
#       {{ page.prefix }}/etc/pkg_install.conf
#       {{ page.prefix }}/etc/pkgin/repositories.conf
#       {{ page.prefix }}/etc/gnupg/pkgsrc.gpg
#
# This only ever needs to be done once when any of the above files change, for
# example if switching from pkgsrc.joyent.com to pkgsrc.smartos.org.  Under
# normal operation "pkgin upgrade" is all you need to be up-to-date.
#
UPGRADE_TAR="bootstrap-macos11-trunk-x86_64-20240212-upgrade.tar.gz"
UPGRADE_SHA="8adff442e8e0ec9de6da87543bc2a3b7eb432bd3"

# Download the upgrade kit to the current directory.
curl -O https://pkgsrc.smartos.org/packages/Darwin/bootstrap-upgrade/${UPGRADE_TAR}

# Verify the SHA1 checksum.
echo "${UPGRADE_SHA}  ${UPGRADE_TAR}" | shasum -c-

# Verify PGP signature.  This step is optional, and requires gpg.
# curl -O https://pkgsrc.smartos.org/packages/Darwin/bootstrap-upgrade/${UPGRADE_TAR}.asc
# curl -sS https://pkgsrc.smartos.org/pgp/ED09C4B0.asc | gpg2 --import
# gpg2 --verify ${UPGRADE_TAR}{.asc,}

# Unpack upgrade kit to {{ page.prefix }}
sudo tar -zxpf ${UPGRADE_TAR} -C /

# Ensure you are running the latest package tools.
sudo pkg_add -U pkg_install pkgin libarchive

# Clean out any old packages signed with the previous key.
sudo pkgin clean

# Upgrade all packages.
sudo pkgin -y upgrade
{% endhighlight %}
				</div>
			</div>
		</div>
	</div>
	<p></p>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<p class="lead">
				We also provide archives of our previous package sets built on Mojave, Sierra,
				Mavericks, and 32-bit Snow Leopard, for users who wish to quickly install
				software on older releases.  These archived sets are no longer updated.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#mojave-install" aria-controls="mojave-install" role="tab" data-toggle="tab">Mojave</a></li>
				<li role="presentation"><a href="#sierra-install" aria-controls="sierra-install" role="tab" data-toggle="tab">Sierra</a></li>
				<li role="presentation"><a href="#mavericks-install" aria-controls="mavericks-install" role="tab" data-toggle="tab">Mavericks</a></li>
				<li role="presentation"><a href="#snow-leopard-install" aria-controls="snow-leopard-install" role="tab" data-toggle="tab">Snow Leopard</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="active tab-pane" id="mojave-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the 64-bit Mojave set.
#
# These packages are suitable for anyone running Mojave (10.14.6) or Catalina
# (10.15.x), however they are no longer updated.
#
BOOTSTRAP_TAR="bootstrap-macos14-trunk-x86_64-20210717.tar.gz"
BOOTSTRAP_SHA="a23fed860e7f515e7405fcfea9595049b9ea6634"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.smartos.org/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" | shasum -c-

# Verify PGP signature.  This step is optional, and requires gpg.
# curl -O https://pkgsrc.smartos.org/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}.asc
# curl -sS https://pkgsrc.smartos.org/pgp/1F32A9AD.asc | gpg2 --import
# gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Reload PATH/MANPATH (pkgsrc installs /etc/paths.d/10-pkgsrc for new sessions)
eval $(/usr/libexec/path_helper)
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="sierra-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the 64-bit Sierra set.
#
# These packages are suitable for anyone running Sierra (10.12.6) or newer,
# however they are no longer updated.  Note that the repository URL has
# changed since publishing, so a couple of config files need updating.
#
BOOTSTRAP_TAR="bootstrap-trunk-x86_64-20190524.tar.gz"
BOOTSTRAP_SHA="1c554a806fb41dcc382ef33e64841ace13988479"
REPO_URL="https://us-central.manta.mnx.io/pkgsrc/public/packages/Darwin/10.12"

# Download the bootstrap kit to the current directory.
curl -O ${REPO_URL}/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" | shasum -c-

# Verify PGP signature.  This step is optional, and requires gpg.
# curl -O ${REPO_URL}/bootstrap/${BOOTSTRAP_TAR}.asc
# curl -sS https://pkgsrc.smartos.org/pgp/1F32A9AD.asc | gpg2 --import
# gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Rewrite config file paths for updated repository URL.
sed -i \
    -e "s,https://pkgsrc.joyent.*All,${REPO_URL}/trunk/x86_64/All," \
    {{ page.prefix }}/etc/pkg_install.conf \
    {{ page.prefix }}/etc/pkgin/repositories.conf

# Reload PATH/MANPATH (pkgsrc installs /etc/paths.d/10-pkgsrc for new sessions)
eval $(/usr/libexec/path_helper)
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="mavericks-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the 64-bit Mavericks set.
#
# These packages are suitable for anyone running Mavericks (10.9.5) or newer,
# however they are no longer updated.  Note that the repository URL has
# changed since publishing, so a couple of config files need updating.
#
BOOTSTRAP_TAR="bootstrap-trunk-x86_64-20181001.tar.gz"
BOOTSTRAP_SHA="7209132a657582cf87897a2ad280c587e3d6bff0"
REPO_URL="https://us-central.manta.mnx.io/pkgsrc/public/packages/Darwin/10.9"

# Download the bootstrap kit to the current directory.
curl -O ${REPO_URL}/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" | shasum -c-

# Verify PGP signature.  This step is optional, and requires gpg.
# curl -O ${REPO_URL}/bootstrap/${BOOTSTRAP_TAR}.asc
# curl -sS https://pkgsrc.smartos.org/pgp/1F32A9AD.asc | gpg2 --import
# gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Rewrite config file paths for updated repository URL.
sed -i \
    -e "s,https://pkgsrc.joyent.*All,${REPO_URL}/trunk/x86_64/All," \
    {{ page.prefix }}/etc/pkg_install.conf \
    {{ page.prefix }}/etc/pkgin/repositories.conf

# Reload PATH/MANPATH (pkgsrc installs /etc/paths.d/10-pkgsrc for new sessions)
eval $(/usr/libexec/path_helper)
{% endhighlight %}
				</div>
				<div role="tabpanel" class="tab-pane" id="snow-leopard-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the 32-bit 10.6+ set.
#
# These packages are suitable for anyone running Snow Leopard (10.6.8) or
# newer, however they are no longer updated.  Note that the repository URL
# has changed since publishing, so a couple of config files need updating.
#
BOOTSTRAP_TAR="bootstrap-trunk-i386-20180812.tar.gz"
BOOTSTRAP_SHA="283b88b13c75e8f92de8376532ccf4f4b9443f9d"
REPO_URL="https://us-central.manta.mnx.io/pkgsrc/public/packages/Darwin/10.6"

# Download the bootstrap kit to the current directory.
curl -O ${REPO_URL}/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" | shasum -c-

# Verify PGP signature.  This step is optional, and requires gpg.
# curl -O ${REPO_URL}/bootstrap/${BOOTSTRAP_TAR}.asc
# curl -sS https://pkgsrc.smartos.org/pgp/1F32A9AD.asc | gpg2 --import
# gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Rewrite config file paths for updated repository URL.
sed -i \
    -e "s,https://pkgsrc.joyent.*All,${REPO_URL}/trunk/i386/All," \
    {{ page.prefix }}/etc/pkg_install.conf \
    {{ page.prefix }}/etc/pkgin/repositories.conf

# Reload PATH/MANPATH (pkgsrc installs /etc/paths.d/10-pkgsrc for new sessions)
eval $(/usr/libexec/path_helper)
{% endhighlight %}
				</div>
			</div>
		</div>
	</div>
</div>
