Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:55832 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751642Ab3EHDOu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 May 2013 23:14:50 -0400
Message-ID: <1367982881.4131.163.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH v4 2/4] deb-pkg: split debug symbols in their own package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 08 May 2013 04:14:41 +0100
In-Reply-To: <1367941611-12223-3-git-send-email-anisse@astier.eu>
References: <1367941611-12223-1-git-send-email-anisse@astier.eu>
	 <1367941611-12223-3-git-send-email-anisse@astier.eu>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-kkb/WWtQKXrXmhATylLv"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com


--=-kkb/WWtQKXrXmhATylLv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-05-07 at 17:46 +0200, Anisse Astier wrote:
> This can reduce almost 3 times the size of the linux-image package,
> while keeping the debug symbols available for this particular build, in
> their own package.
>=20
> This mimics the way kernels are built in debian, ubuntu, or with
> make-kpkg, and comes at the price of a small slowdown in the building of
> packages.
>=20
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
>  scripts/package/builddeb | 43 ++++++++++++++++++++++++++++++++++++++++++=
-
>  1 file changed, 42 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 2d84671..797484b 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -78,17 +78,21 @@ tmpdir=3D"$objtree/debian/tmp"
>  fwdir=3D"$objtree/debian/fwtmp"
>  kernel_headers_dir=3D"$objtree/debian/hdrtmp"
>  libc_headers_dir=3D"$objtree/debian/headertmp"
> +dbg_dir=3D"$objtree/debian/dbgtmp"
>  packagename=3Dlinux-image-$version
>  fwpackagename=3Dlinux-firmware-image
>  kernel_headers_packagename=3Dlinux-headers-$version
>  libc_headers_packagename=3Dlinux-libc-dev
> +dbg_packagename=3D$packagename-dbg
> =20
>  if [ "$ARCH" =3D "um" ] ; then
>  	packagename=3Duser-mode-linux-$version
>  fi
> =20
> +BUILD_DEBUG=3D"$(grep -s '^CONFIG_DEBUG_INFO=3Dy' $objtree/$KCONFIG_CONF=
IG || true)"

As in the previous patch, you can omit $objtree/ here.

[...]
> @@ -128,6 +136,20 @@ if grep -q '^CONFIG_MODULES=3Dy' $objtree/$KCONFIG_C=
ONFIG ; then
>  		mv "$tmpdir/lib/modules/$version"/* "$tmpdir/usr/lib/uml/modules/$vers=
ion/"
>  		rmdir "$tmpdir/lib/modules/$version"
>  	fi
> +	if [ -n "$BUILD_DEBUG" ] ; then
> +		(
> +			cd $tmpdir
> +			for module in $(find lib/modules/ -name *.ko); do

What if this is a non-modular kernel?

[...]=20
> +if [ -n "$BUILD_DEBUG" ] ; then
> +	# Build debug package
> +	mkdir -p $dbg_dir/usr/lib/debug/lib/modules/$version/
> +	cp vmlinux $dbg_dir/usr/lib/debug/lib/modules/$version/
[...]

Different tools have different ideas about where vmlinux debuginfo
should be.  What I ended up doing in Debian's own kernel debug packages
in wheezy was installing/symlinking to all of:

/usr/lib/debug/boot/vmlinux-$version        [systemtap]
/usr/lib/debug/lib/modules/$version/vmlinux [perf]
/usr/lib/debug/vmlinux-$version             [kdump-tools]

So unless anyone has a better suggestion I think you'd better do the
same here.

(But really, the Linux development community ought to agree on a single
canonical path format that all such tools will support.)

Ben.

--=20
Ben Hutchings
For every action, there is an equal and opposite criticism. - Harrison


--=-kkb/WWtQKXrXmhATylLv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUYnDIee/yOyVhhEJAQoT8Q/9HkbzkCynMrMOPH+8691S2XiFgvVZ9OPJ
B/OTjZGaFACGn94bm00qyD2wXgn8Un312tznea9Zyt0/84nYI9ICAsGDKpCyGAn/
VVPfBbJexQQXCQNCx9QHiEHMnLP0qIGu7SzHPFRCkyNAmndoTWJKOi0ueTg5v7Ae
VThzl9CLtGN8GvCUVsYNjYui3MCcUw+GXtkcTZ3pSVlXxufhIAt56LOma5FaTfDI
/qTGHg8au/xrATbbZflNFHCFSsLfpq7NsBVmlfawuTfzWHlnp5kDkjNOHTPpynuA
oXTINt8cHUPkYyJRpoIK3ullDg9ef5HzLIew81/oQD8j0Ltbz1UtSeM0fwi/Aoey
jFwxBN6SNJWXLEzPkAeSNeOZzQaJQ4wjYCKhACbhVMK9pl65DZnBefWSlJawSd8P
rL8mZNu+qb0V4CY/51obQx67MdVpwiYhLdqnTfYNX5oFigAP3A2vp271UHbrOvWR
eWjOrV7URFWaKMA0M2ocl5btwb9f8J6sRP37G1bG5Z9V9yiwcoS2ciZBse9Tyjct
fGt5+WQMkUQFKh1TN+B31VUtCc5YAhW5b4Jd+jC7hSq4OOX6/VmN60Ujs2ML5Tm5
bAA3mpmQO7azG9w7AhBzuXG59Q6cCnEOzXDYRjFtmJMf9UVA9z8dTivjlUF8OO4O
fqLZR/mwgOw=
=Moan
-----END PGP SIGNATURE-----

--=-kkb/WWtQKXrXmhATylLv--
