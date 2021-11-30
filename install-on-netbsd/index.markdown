---
layout:      install
title:       Joyent Packages Documentation - Install On NetBSD
metacontent: Binary pkgsrc package sets for NetBSD/amd64
prefix:      /usr/pkg
---

<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<h2 class="text-center">Install on NetBSD</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<p class="lead">
				Packages are built on the latest development
				version of NetBSD/amd64 (currently 9.99.92)
				from pkgsrc trunk and updated every day.
				Note some important differences to other NetBSD
				package repositories:
			</p>
			<ul class="lead">
				<li class="lead">
					All packages are signed, and <code>/usr/pkg/sbin/pkg_add</code> will refuse to install
					any unsigned packages (configured with <code>VERIFIED_INSTALLATION=always</code> set in
					<code>/usr/pkg/etc/pkg_install.conf</code>).
				</li>
				<li class="lead">
					The bootstrap kit bundles <code>/etc/openssl/certs/</code> containing certificates installed
					from the security/mozilla-rootcerts package, ensuring HTTPS will work without requiring any
					manual configuration.
				</li>
				<li class="lead">
					Both <code>CHECK_OSABI</code> and <code>CHECK_OS_VERSION</code> are set to <code>no</code>,
					improving compatibility of the packages across minor releases of NetBSD-current.
				</li>
				<li class="lead">
					A number of <code>PKG_OPTIONS</code> have been
					<a href="https://github.com/joyent/pkgbuild/blob/master/include/pkgoptions/netbsd.mk">
					enabled by default</a> to make packages as useful as possible.
				</li>
			</ul>
			<p class="lead">
				The aim is to provide a repository that, for most users, will <em>just work</em> out of the box.
				If you have any requests for changes, please raise an issue
				<a href="https://github.com/joyent/pkgbuild/issues">here</a>.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="netbsd-install">
					<p></p>
{% highlight bash %}
#
# Copy and paste the lines below to install the NetBSD/amd64 9.99.x set.
#
BOOTSTRAP_TAR="bootstrap-netbsd-trunk-x86_64-20201216.tar.gz"
BOOTSTRAP_SHA="1475d51ab87905e279ac5aa435c09c8ad11ad9c9"

# Download the bootstrap kit to the current directory.
ftp https://pkgsrc.joyent.com/packages/NetBSD/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA} ${BOOTSTRAP_TAR}" | sha1 -c

# Verify PGP signature.  This step is optional, and requires gpg.
ftp https://pkgsrc.joyent.com/packages/NetBSD/bootstrap/${BOOTSTRAP_TAR}.asc
ftp -Vo - https://pkgsrc.joyent.com/pgp/5D402CC3.asc | gpg2 --import
gpg2 --verify ${BOOTSTRAP_TAR}.asc ${BOOTSTRAP_TAR}

#
# Remove any existing packages.  Note also that the bootstrap kit will
# install its own copies of the security/mozilla-rootcerts certificates
# into the /etc/openssl/certs/ directory.
#
rm -rf /usr/pkg /var/db/pkg /var/db/pkgin

# Install bootstrap kit to {{ page.prefix }}
tar -zxpf ${BOOTSTRAP_TAR} -C /

# Add to PATH if necessary.
PATH={{ page.prefix }}/sbin:{{ page.prefix }}/bin:$PATH
{% endhighlight %}
				</div>
			</div>
		</div>
	</div>
</div>
