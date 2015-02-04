Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:40895 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934021AbbBDSHG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Feb 2015 13:07:06 -0500
Message-ID: <1423073211.2349.12.camel@decadent.org.uk>
Subject: Re: [PATCHv4 1/1] deb-pkg: Add device tree blobs to the package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 04 Feb 2015 18:06:51 +0000
In-Reply-To: <20150203121648.046396044@rtp-net.org>
References: <20150203121648.046396044@rtp-net.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9ZxzrIerDgFhgGIjUqdc"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>


--=-9ZxzrIerDgFhgGIjUqdc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2015-02-03 at 13:16 +0100, Arnaud Patard wrote:
> When building a package with make deb-pkg (say, for arm), the dtb files a=
re
> not added to the package. Given that things are still evolving on arm, it
> make sense to have them along with the kernel and modules.
>=20
> v4: Use $KCONFIG_CONFIG
> v3: handle with OF but without dtbs_install.
>     Use $MAKE ... as done everywhere else in the script
> v2: make use of dtbs_install
>=20
> Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>

Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

> ---
>=20
> Index: linux-next/scripts/package/builddeb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-next.orig/scripts/package/builddeb    2015-01-14 13:04:45.84592=
2441 +0100
> +++ linux-next/scripts/package/builddeb 2015-01-28 09:25:15.298796403 +01=
00
> @@ -143,6 +143,13 @@ else
>         cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
>  fi
> =20
> +if grep -q "^CONFIG_OF=3Dy" $KCONFIG_CONFIG ; then
> +       # Only some architectures with OF support have this target
> +       if grep -q dtbs_install "${srctree}/arch/$SRCARCH/Makefile"; then
> +               $MAKE KBUILD_SRC=3D INSTALL_DTBS_PATH=3D"$tmpdir/usr/lib/=
$packagename" dtbs_install
> +       fi
> +fi
> +
>  if grep -q '^CONFIG_MODULES=3Dy' $KCONFIG_CONFIG ; then
>         INSTALL_MOD_PATH=3D"$tmpdir" $MAKE KBUILD_SRC=3D modules_install
>         rm -f "$tmpdir/lib/modules/$version/build"
>=20

--=20
Ben Hutchings
Hoare's Law of Large Problems:
        Inside every large problem is a small problem struggling to get out=
.

--=-9ZxzrIerDgFhgGIjUqdc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVNJfwue/yOyVhhEJAQrA/Q//bGctHGnDODnmYd5iLSmlupTESmVqDx/W
lCMgy2kiGHQ5FR+drsLRcThlyaSGHXF/uOr5cW5zvHq7YYCG3b61YDRJHe8R/Rje
ckcthznUEJeI41ie58/Z4dz707IN4Phi4Lj9fv4HGA5xl+fRwYLceWKt3mJznyOg
Ht2la/0cuKWKue91wQoUYRID7fsRJpxjxzY+AuWQjHg7ZdHcf8vOCXUBtaFGzV1/
frL4uokEHpcjVT526g4XLgaeHkcaoJVR2ELNvtcDwEWn0G+XqYXBFZhgnCDkwcI4
pxf7Dg831mRtNN9oi2FpIRXU8L0yyJMHzG3S9p4AJM5n0iiI7N1KaQ9aV3xrdS0R
Pf+0AwVB8XpMP5OAbnwsSqB58xLxfY/baRATgUu4kue5T+0BvPZ1l5R+TEVVknKJ
i0teBIPU1G1hiT6Qwezlt8lU9JgYiJvuGLC6pYF45l7cEAv6M3nSsqhuCJM2E7Cq
9MpD7tLWOckuh0xrHhAYASw+PzHPrQVEzC6UqeYFRxae/6JCqjCrhglbGV3Hll/N
i1Ww0pmp305A1xN4Uurogc8rC8bx2n3ld9rCE0MbfLDGIYYQpb2TPfmnXCAdUZG7
msrdjFJE73wc4oKFZNUtgjD2ol0PbOblOOoEvXmwjz5WVs/qYZd4yfHUgCCkr2mE
cSeJk5RA648=
=i02p
-----END PGP SIGNATURE-----

--=-9ZxzrIerDgFhgGIjUqdc--
