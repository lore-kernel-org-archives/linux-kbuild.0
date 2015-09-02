Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59242 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751268AbbIBNuY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Sep 2015 09:50:24 -0400
Message-ID: <1441201810.9215.61.camel@decadent.org.uk>
Subject: Re: [PATCH v5] deb-pkg: add source package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 02 Sep 2015 14:50:10 +0100
In-Reply-To: <1441187844-10660-1-git-send-email-riku.voipio@linaro.org>
References: <1441187844-10660-1-git-send-email-riku.voipio@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oFjejTXv3J2RuaBI8Oen"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: Chris J Arges <chris.j.arges@canonical.com>, maximilian attems <maks@stro.at>


--=-oFjejTXv3J2RuaBI8Oen
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2015-09-02 at 12:57 +0300, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
>=20
> Make deb-pkg build both source and binary package like make rpm-pkg does.
> For people who only need binary kernel package, there is now bindeb-pkg
> target, same target also used to build the .deb files if built from the
> source package using dpkg-buildpackage.
>=20
> Generated source package will build the same kernel .config than what
> was available for make deb-pkg. The name of the source package can
> be set with KDEB_SOURCENAME enviroment variable.
>=20
> The source package is useful for GPL compliance, or for feeding to a
> automated debian package builder.
>=20
> Cc: Chris J Arges <chris.j.arges@canonical.com>
> Cc: maximilian attems <maks@stro.at>
> Cc: Ben Hutchings <ben@decadent.org.uk>

Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
> v5:
> - fix variable typo
> - clean tmp dirs in clean: target
>=20
> v4 address Bens commends,
> - use src_tar function instead of git archive for kernel sources
> - move KDEB_SOURCENAME setting to Makefile so it can be passed to
>   src_tar
> - use a toplevel .config file instead of a copy in debian/control
> - defend against delete of debian/ in clean target
>=20
> v3,
> - Allow setting source package name with KDEB_SOURCENAME
> - Fix issues noted by Ben: drop python and fix target in debian/rules
> - Merge "ensure $MAKE can use jobserver" oneliner from Chris J Arges
>=20
> v2, address Maximilians comments
> - Isolate from my other patches, so it can be merged easier
> - Separate bindeb-pkg target for building just binary debs
> - Build source package in deb-pkg target to match rpm-pkg target
>  scripts/package/Makefile | 17 +++++++++++++----
>  scripts/package/builddeb | 38 ++++++++++++++++++++++++++++++++++++--
>  2 files changed, 49 insertions(+), 6 deletions(-)
>=20
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 297e756..1aca224 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -23,6 +23,8 @@
> =20
>  # Remove hyphens since they have special meaning in RPM filenames
>  KERNELPATH :=3D kernel-$(subst -,_,$(KERNELRELEASE))
> +KDEB_SOURCENAME ?=3D linux-$(KERNELRELEASE)
> +export KDEB_SOURCENAME
>  # Include only those top-level files that are needed by make, plus the G=
PL copy
>  TAR_CONTENT :=3D $(KBUILD_ALLDIRS) .config .scmversion Makefile \
>                 Kbuild Kconfig COPYING $(wildcard localversion*)
> @@ -83,11 +85,17 @@ quiet_cmd_builddeb =3D BUILDDEB
>  > 	> } && \
>  > 	> \
>  > 	> $$KBUILD_PKG_ROOTCMD $(CONFIG_SHELL) \
> -> 	> 	> $(srctree)/scripts/package/builddeb
> +> 	> 	> $(srctree)/scripts/package/builddeb $@
> =20
>  deb-pkg: FORCE
> +> 	> $(MAKE) clean
> +> 	> $(call cmd,src_tar,$(KDEB_SOURCENAME))
> +> 	> $(MAKE) KBUILD_SRC=3D
> +> 	> +$(call cmd,builddeb)
> +
> +bindeb-pkg: FORCE
>  > 	> $(MAKE) KBUILD_SRC=3D
> -> 	> $(call cmd,builddeb)
> +> 	> +$(call cmd,builddeb)
> =20
>  clean-dirs +=3D $(objtree)/debian/
> =20
> @@ -132,8 +140,9 @@ perf-%pkg: FORCE
>  # ----------------------------------------------------------------------=
-----
>  help: FORCE
>  > 	> @echo '  rpm-pkg             - Build both source and binary RPM ker=
nel packages'
> -> 	> @echo '  binrpm-pkg          - Build only the binary kernel package=
'
> -> 	> @echo '  deb-pkg             - Build the kernel as a deb package'
> +> 	> @echo '  binrpm-pkg          - Build only the binary kernel RPM pac=
kage'
> +> 	> @echo '  deb-pkg             - Build both source and binary deb ker=
nel packages'
> +> 	> @echo '  bindeb-pkg          - Build only the binary kernel deb pac=
kage'
>  > 	> @echo '  tar-pkg             - Build the kernel as an uncompressed =
tarball'
>  > 	> @echo '  targz-pkg           - Build the kernel as a gzip compresse=
d tarball'
>  > 	> @echo '  tarbz2-pkg          - Build the kernel as a bzip2 compress=
ed tarball'
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 0c18cfd..0cd46e1 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -79,6 +79,7 @@ if [ -n "$KDEB_PKGVERSION" ]; then
>  else
>  > 	> packageversion=3D$version-$revision
>  fi
> +sourcename=3D$KDEB_SOURCENAME
>  tmpdir=3D"$objtree/debian/tmp"
>  fwdir=3D"$objtree/debian/fwtmp"
>  kernel_headers_dir=3D"$objtree/debian/hdrtmp"
> @@ -238,7 +239,7 @@ fi
> =20
>  # Generate a simple changelog template
>  cat < debian/changelog
> -linux-upstream ($packageversion) $distribution; urgency=3Dlow
> +$sourcename ($packageversion) $distribution; urgency=3Dlow
> =20
>    * Custom built Linux kernel.
> =20
> @@ -265,12 +266,16 @@ On Debian GNU/Linux systems, the complete text of t=
he GNU General Public
>  License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
>  EOF
> =20
> +
> +build_depends=3D"bc, kmod, cpio "
> +
>  # Generate a control file
>  cat < debian/control
> -Source: linux-upstream
> +Source: $sourcename
>  Section: kernel
>  Priority: optional
>  Maintainer: $maintainer
> +Build-Depends: $build_depends
>  Standards-Version: 3.8.4
>  Homepage: http://www.kernel.org/
>  EOF
> @@ -391,4 +396,33 @@ EOF
>  > 	> create_package "$dbg_packagename" "$dbg_dir"
>  fi
> =20
> +if [ "x$1" =3D "xdeb-pkg" ]
> +then
> +    cat < debian/rules
> +#!/usr/bin/make -f
> +
> +build:
> +> 	> \$(MAKE)
> +
> +binary-arch:
> +> 	> \$(MAKE) KDEB_SOURCENAME=3D${sourcename} KDEB_PKGVERSION=3D${packag=
eversion} bindeb-pkg
> +
> +clean:
> +> 	> rm -rf debian/*tmp
> +> 	> mv debian/ debian.backup # debian/ might be cleaned away
> +> 	> \$(MAKE) clean
> +> 	> mv debian.backup debian
> +
> +binary: binary-arch
> +EOF
> +> 	> mv ${sourcename}.tar.gz ../${sourcename}_${version}.orig.tar.gz
> +> 	> tar caf ../${sourcename}_${packageversion}.debian.tar.gz debian/{co=
pyright,rules,changelog,control}
> +> 	> dpkg-source -cdebian/control -ldebian/changelog --format=3D"3.0 (cu=
stom)" --target-format=3D"3.0 (quilt)" \
> +> 	> 	> -b / ../${sourcename}_${version}.orig.tar.gz  ../${sourcename}_$=
{packageversion}.debian.tar.gz
> +> 	> mv ${sourcename}_${packageversion}*dsc ..
> +> 	> dpkg-genchanges > ../${sourcename}_${packageversion}_${debarch}.cha=
nges
> +else
> +> 	> dpkg-genchanges -b > ../${sourcename}_${packageversion}_${debarch}.=
changes
> +fi
> +
>  exit 0
--=20
Ben Hutchings
Horngren's Observation:
                   Among economists, the real world is often a special case=
.


--=-oFjejTXv3J2RuaBI8Oen
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVeb+kue/yOyVhhEJAQoWXA//YiqCkxbYoLGylwD8qnznCeF4y1OQb2L6
P3kg6+rL3y9evLVeQ+yxkZVgSawWXje41FrGs05nCPI4ndW6v6aqNCDszHa/QubH
b2SGR7cwiqdCwioamNESlNy28qvg+psoEAL6yU0Dn0OPbt2oww95NoXY372GcczG
fe7lEJk2RRuUSezyVyBAXI4dNDsq+DnFWYJkTtY2hy8r7ckbErzx5Qmesm9vZMKC
rgAFKOVMZVPBDRmmoWMYJrVNIuzU3oYpuGLs3qrrTNahEzFzhdno9ESbdAXXHey9
NgFQSP6CYBOvl9nWw2uUwuoyQlvTc2PSEQRDixVRn9MmaG5vFH8IM0bcRm4yezYf
MwpdK9Roj0PGVZizLy1vT5pKj4XrL6jBbeUIlZ1MR1sL90yZHstTqRVZZIz5HgdA
KWIQ1jnOyQ9E8jogVxYxne6ZqqTssFBxa+TNMYxgdg0AhPdSd7LZbXukpCBlpI2W
O4P6fM4JzNmMLZTNzwLg+A7+HYRT9Bf+em41KjcQVa86L+2xnS/oS5NfNvGfEc2y
6cqpENXh3BW6TIzdohQSwSyy18pDbBizz55zq+1PFCeP8KB6wnvQPYtsnU43Q+Ub
bBOb0KVsPWC3sB+bGQ9GAkLK7Hcd6udjrN/EUd+46ofQM7zqZbc5JxY5u86r4eF0
2T4oRrfY+Jg=
=NA9W
-----END PGP SIGNATURE-----

--=-oFjejTXv3J2RuaBI8Oen--
