Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:45663 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752101AbbANMvm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Jan 2015 07:51:42 -0500
Message-ID: <1421239885.19708.82.camel@decadent.org.uk>
Subject: Re: [PATCHv2 1/1] deb-pkg: Add device tree blobs to the package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 14 Jan 2015 12:51:25 +0000
In-Reply-To: <20150114123658.185884720@rtp-net.org>
References: <20150114123201.434698327@rtp-net.org>
	 <20150114123658.185884720@rtp-net.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-5TNBPrjjeI3+jvEq8+6+"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>


--=-5TNBPrjjeI3+jvEq8+6+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Please submit patches inline.]

On Wed, 2015-01-14 at 13:32 +0100, Arnaud Patard wrote:
> When building a package with make deb-pkg (say, for arm), the dtb files a=
re
> not added to the package. Given that things are still evolving on arm, it
> make sense to have them along with the kernel and modules.
>=20
> v2: make use of dtbs_install
>=20
> Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
> ---
>=20
> Index: linux-next/scripts/package/builddeb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-next.orig/scripts/package/builddeb    2015-01-14 13:04:45.84592=
2441 +0100
> +++ linux-next/scripts/package/builddeb 2015-01-14 13:19:26.121883720 +01=
00
> @@ -143,6 +143,10 @@ else
>         cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
>  fi
> =20
> +if grep -q "^CONFIG_OF=3Dy" .config ; then
> +       make INSTALL_DTBS_PATH=3D"$tmpdir/usr/lib/$packagename" dtbs_inst=
all
> +fi

Only arm and arm64 support that target.  You should maybe run something
like 'make -n dtbs_install >/dev/null 2>&1' first to check that the
target is defined.

Ben.

>  if grep -q '^CONFIG_MODULES=3Dy' $KCONFIG_CONFIG ; then
>         INSTALL_MOD_PATH=3D"$tmpdir" $MAKE KBUILD_SRC=3D modules_install
>         rm -f "$tmpdir/lib/modules/$version/build"
>=20

--=20
Ben Hutchings
The world is coming to an end.	Please log off.

--=-5TNBPrjjeI3+jvEq8+6+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVLZmVue/yOyVhhEJAQqBLRAAhEdg5EwtOP4lwgGIQdsrIzyCaquA5/X2
a4NHCXPdyWHlqwxh8J44+fyhm/iWQC4LIhNbN+o9g7OteO3R656SASuvWy3Y3OBd
TGKnqW12pyFYfWW75vtSzrn/3n+Yam0PiqoinWqwtG2xlea63fgGAZBXNTyhYA+V
CZaKFZQ4e/cxkzs22qPFxqWIn7+KOmBVEcGaBKbiFHkjTesMOjmn8YwMMtCltRTZ
rS9213jP1pgF1Xv6zpQ5D1jBbkHcGNImYF9LXewC6veDxxrIAM2nwfX6QApHhO7V
NxkadsTRUNG9oWzbbsuXcQ7X/MrqN5Jlbmyun8p9+HpOEAf3q2NFpcmK9AwKhzu9
8c1XPxNqfXxVVhDHKelP6HjS5h8mWOoFsjfrK/Vxz3GxWwgs7HNHuEs5+Cg3G0fU
RCUQqrB7EMzB/RTERLy38M0+NBlzRQOwNZNGsKhS4Wz+SgyHa/RJv7jOTq/2m920
clI8ctH7Aq3ZrhuYvItiElCVxxWm3N7GAYWxTVEw+4LQpSYq4rW77rqzgHOctLyn
Li08maRKqGnk78T3E3Q4KXO3xo55Rp6edU42P0WSaJf4VyAQOo9sNU+k/DFQ75+i
x0unBVKHV55XXVbdMuYWPst1NKwfD7nRLGg5wIlcmdE1T4ac8yXpPSIwH7W4IQtX
4hXZmHh98p4=
=T86Y
-----END PGP SIGNATURE-----

--=-5TNBPrjjeI3+jvEq8+6+--
