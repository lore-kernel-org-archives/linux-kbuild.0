Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:37204 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759342AbbA1AWX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Jan 2015 19:22:23 -0500
Message-ID: <1422404529.2709.5.camel@decadent.org.uk>
Subject: Re: [PATCHv3 1/1] deb-pkg: Add device tree blobs to the package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 28 Jan 2015 00:22:09 +0000
In-Reply-To: <20150126194149.088416391@rtp-net.org>
References: <20150126194058.881319393@rtp-net.org>
	 <20150126194149.088416391@rtp-net.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-iDwTjj9Zwc3YqtNmC8LE"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>


--=-iDwTjj9Zwc3YqtNmC8LE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2015-01-26 at 20:40 +0100, Arnaud Patard wrote:
> When building a package with make deb-pkg (say, for arm), the dtb files a=
re
> not added to the package. Given that things are still evolving on arm, it
> make sense to have them along with the kernel and modules.
>=20
> v3: handle with OF but without dtbs_install.
>     Use $MAKE ... as done everywhere else in the script
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
> +++ linux-next/scripts/package/builddeb 2015-01-24 21:39:40.047431257 +01=
00
> @@ -143,6 +143,13 @@ else
>         cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
>  fi
> =20
> +if grep -q "^CONFIG_OF=3Dy" .config ; then

Use $KCONFIG_CONFIG not .config.

Ben.

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
Teamwork is essential - it allows you to blame someone else.

--=-iDwTjj9Zwc3YqtNmC8LE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVMgrtue/yOyVhhEJAQq0Ew/6AsC9Z6nHWLBHrRO6tAXaAv2EZghYzHJ9
DoTz6Q2LHvOek/5dZVrN8ZN5vNOy2YAVnKKQyhL8v42hOUtZYRPJTE79gtTL02VJ
sohI3Sx3yZ3JpdB54ezHzyUvay3tFF7+8cyzWnyNhqGrx7kKvKkZarkW9lwM59zH
uNS33u8Yzk+oYl3/kEigww7yqlrKOzU4a99C2xeUPgSQklPlTcA+nKsmPvDviwtm
Mo+zzYThJCIk7x0yo0Tf8A807rYCc9KZNprhgVTBYdSScDtMHOxfJk1OAKaakeO/
NVhaQMjnU75AUUHQbst3vU0145b3rS1EP/T/JEQrDjz9mXBrQ5YzO7uAaiKuXvT0
FePLYnaf6/onz3D+/VhRoWc3I01qh8LLlie0jYlO/jCti6/qpW5YpMryZRhmfd0c
p931xtADHKOliMXYax47PJ7NjztCCwbCM2jtR4pP3Ffg+lJ5oeMXQMPA2yvOsKpg
MzYIT6n63mboJBMNpLF2owUNgr3kzuvuRCBRjFt+mJOSWaYnrS3fFkaspp7YmEiL
CVcc5vVw2pTGCHHmrorSYe0q3oUKia6xq4QrI2E0b+ZMjfKLez6q5HmX2YCN9mCW
B8m6eo+Kbp7AXwgUW9XmTsDcrH8dO2BNEWH79vfYjgGMngCytUvQ5DApt0LdKiWb
qFsdUEw1H+w=
=xKf7
-----END PGP SIGNATURE-----

--=-iDwTjj9Zwc3YqtNmC8LE--
