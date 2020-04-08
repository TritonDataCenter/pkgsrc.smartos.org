---
layout:      install
title:       Joyent Packages Documentation - Install On macOS
metacontent: Binary pkgsrc package sets for macOS
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
				These example screenshots show just a small number of the 18,000+ binary
				packages available in our 64-bit pkgsrc set.  All examples were produced
				on a clean install of macOS El Capitan (10.11.4) inside VMware Fusion.
			</p>
		</div>
	</div>
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
				Our primary packages for macOS are built on Mojave (10.14.6) and are suitable
				for users running the latest macOS releases.  They are built from pkgsrc trunk
				and updated every few days.
			</p>
			<p class="lead">
				We also provide archives of our previous package sets built on 64-bit Sierra
				(10.12.6), Mavericks (10.9.5), and 32-bit Snow Leopard (10.6.8) for users who
				wish to quickly install software on older releases.  These archived sets are
				no longer updated.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#mojave-install" aria-controls="mojave-install" role="tab" data-toggle="tab">Mojave</a></li>
				<li role="presentation"><a href="#sierra-install" aria-controls="sierra-install" role="tab" data-toggle="tab">Sierra (archived)</a></li>
				<li role="presentation"><a href="#mavericks-install" aria-controls="mavericks-install" role="tab" data-toggle="tab">Mavericks (archived)</a></li>
				<li role="presentation"><a href="#snow-leopard-install" aria-controls="snow-leopard-install" role="tab" data-toggle="tab">Snow Leopard (archived)</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="mojave-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the 64-bit Mojave set.
#
# These packages are suitable for anyone running Mojave (10.14.6) or newer,
# and are updated from pkgsrc trunk every few days.
#
BOOTSTRAP_TAR="bootstrap-trunk-x86_64-20200219.tar.gz"
BOOTSTRAP_SHA="92992f79188a677f09cfa543499beef3f902017a"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" >check-shasum
shasum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/1F32A9AD.asc | gpg2 --import
gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

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
# however they are no longer updated.
#
BOOTSTRAP_TAR="bootstrap-trunk-x86_64-20190524.tar.gz"
BOOTSTRAP_SHA="1c554a806fb41dcc382ef33e64841ace13988479"

# Download the bootstrap kit to the current directory.
curl -O https://us-east.manta.joyent.com/pkgsrc/public/packages/Darwin/10.12/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" >check-shasum
shasum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/1F32A9AD.asc | gpg2 --import
gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

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
# however they are no longer updated.
#
BOOTSTRAP_TAR="bootstrap-trunk-x86_64-20181001.tar.gz"
BOOTSTRAP_SHA="7209132a657582cf87897a2ad280c587e3d6bff0"

# Download the bootstrap kit to the current directory.
curl -O https://us-east.manta.joyent.com/pkgsrc/public/packages/Darwin/10.9/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" >check-shasum
shasum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://us-east.manta.joyent.com/pkgsrc/public/packages/Darwin/10.9/bootstrap/${BOOTSTRAP_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/1F32A9AD.asc | gpg2 --import
gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

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
# newer, however they are no longer updated.
#
BOOTSTRAP_TAR="bootstrap-trunk-i386-20180812.tar.gz"
BOOTSTRAP_SHA="283b88b13c75e8f92de8376532ccf4f4b9443f9d"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" >check-shasum
shasum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}.asc
curl -sS https://pkgsrc.joyent.com/pgp/1F32A9AD.asc | gpg2 --import
gpg2 --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to {{ page.prefix }}
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Reload PATH/MANPATH (pkgsrc installs /etc/paths.d/10-pkgsrc for new sessions)
eval $(/usr/libexec/path_helper)
{% endhighlight %}
				</div>
			</div>
		</div>
	</div>
</div>
