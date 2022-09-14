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
				Our primary packages for macOS are available for both Apple Silicon and Intel,
				and thanks to being built against the 11.3 SDK run on all recent versions of
				macOS.  They are built from pkgsrc trunk and are updated every few days.
			</p>
			<p class="lead">
				We also provide archives of our previous package sets built on Mojave, Sierra,
				Mavericks, and 32-bit Snow Leopard for users who wish to quickly install
				software on older releases.  These archived sets are no longer updated.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#arm64-install" aria-controls="arm64-install" role="tab" data-toggle="tab">Apple Silicon 11.3+</a></li>
				<li role="presentation"><a href="#intel-install" aria-controls="intel-install" role="tab" data-toggle="tab">Intel 11.3+</a></li>
				<li role="presentation"><a href="#mojave-install" aria-controls="mojave-install" role="tab" data-toggle="tab">Mojave</a></li>
				<li role="presentation"><a href="#sierra-install" aria-controls="sierra-install" role="tab" data-toggle="tab">Sierra</a></li>
				<li role="presentation"><a href="#mavericks-install" aria-controls="mavericks-install" role="tab" data-toggle="tab">Mavericks</a></li>
				<li role="presentation"><a href="#snow-leopard-install" aria-controls="snow-leopard-install" role="tab" data-toggle="tab">Snow Leopard</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="arm64-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the Apple Silicon set.
#
# These packages are suitable for anyone running Big Sur (11.3) or newer on
# Apple Silicon (ARM) CPUs, and are updated from pkgsrc trunk every few days.
#
BOOTSTRAP_TAR="bootstrap-macos11-trunk-arm64-20220913.tar.gz"
BOOTSTRAP_SHA="97a1ee6b11b30529de6facf27e2042d602ca6af8"

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
				<div role="tabpanel" class="tab-pane" id="intel-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the Intel set.
#
# These packages are suitable for anyone running Big Sur (11.3) or newer on
# Intel x86 CPUs, and are updated from pkgsrc trunk every few days.
#
BOOTSTRAP_TAR="bootstrap-macos11-trunk-x86_64-20211207.tar.gz"
BOOTSTRAP_SHA="07e323065708223bbac225d556b6aa5921711e0a"

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
				<div role="tabpanel" class="tab-pane" id="mojave-install">
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
