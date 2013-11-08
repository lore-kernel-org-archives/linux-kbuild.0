Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:37223 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753977Ab3KHOgk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Nov 2013 09:36:40 -0500
Message-ID: <1383921387.8136.30.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [patch 1/1] deb-pkg: Add device tree blobs to the package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Fri, 08 Nov 2013 14:36:27 +0000
In-Reply-To: <20131107151746.950612598@rtp-net.org>
References: <20131107151746.950612598@rtp-net.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-xhNYWKCWhx7FWFs4UFYS"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>


--=-xhNYWKCWhx7FWFs4UFYS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-11-07 at 16:17 +0100, Arnaud Patard wrote:
> When building a package with make deb-pkg (say, for arm), the dtb files a=
re
> not added to the package. Given that things are still evolving on arm, it
> make sense to have them along with the kernel and modules.
>=20
> Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
> ---
>=20
> Index: linux-next/scripts/package/builddeb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-next.orig/scripts/package/builddeb	2013-11-06 12:51:49.54829957=
8 +0100
> +++ linux-next/scripts/package/builddeb	2013-11-06 12:52:24.152298055 +01=
00
> @@ -140,6 +140,10 @@ if [ -e $KBUILD_IMAGE ]; then
>  else
>  	cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
>  fi
> +if grep -q "^CONFIG_OF=3Dy" .config ; then
> +	mkdir -p "$tmpdir/usr/lib/$packagename"
> +	find arch/$ARCH -name *.dtb -exec cp {} "$tmpdir/usr/lib/$packagename" =
\;
> +fi

I would quote the '*.dtb'.  Otherwise I think this is reasonable.

Ben.

>  if grep -q '^CONFIG_MODULES=3Dy' $KCONFIG_CONFIG ; then
>  	INSTALL_MOD_PATH=3D"$tmpdir" $MAKE KBUILD_SRC=3D modules_install
>=20
>=20

--=20
Ben Hutchings
Horngren's Observation:
                   Among economists, the real world is often a special case=
.

--=-xhNYWKCWhx7FWFs4UFYS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIVAwUAUnz26+e/yOyVhhEJAQo3DRAAvy8G6iwCsJfUspP5dEox23mcdpBpy2HL
+jO2ZmRCsXWUNv/6C8Kh6gJBMPwrHDPTP4ut1tMhnStF+fwcx5RrXTrnZ/QMuqPF
8jp+I7izIAGU9bylZvIqDmn0irLtmK95h7ei+OIpcuTGdFM98GJR34E7cXKECSPA
QQZGdJYofly199Y99WXcUGRJYOMHEgmjKm/gTVtFjDLZm23lBP5vVu08GktRkltB
5PkMhn2/olXDF7f9WhLgt8XvBDs4pkbupopxRLIZicSU+VbQTvb9oX9UVydtBs/D
ZqtkbSDtrpAOFH6xLUms6L+WNT9tweBTQOZLD7AT7WzcU7Kzwmh0jmsu89js/cm6
qWDYJHv3y9fccm66EwQhaIQ0Ed5tWWYPQTh3GTsAIHNbkM2v3FiY5yhv01p1Nl/w
We2jbYvqPU5nlL+TB0STixljsOUbss4MkvawoOII7NoB5Usnv8XWMDUQj2tFZBgP
TpUkh70uhiMtBTuBAE6aJ5LmNt7oMn3pm0bzgZYNyQB2qJUm1fYcJyJPdITvomn9
cq3CRjI5Hdcr24uE0ps1uC23Ws/c10sDL35pX2yKlpCV7q9759GTNmaLNpx7cLsw
eju+hd3gm87lurnb6f8uQp4NM/1L1A3weiBaYx3tI+FxABWybnyXrDAnNUX/P0gA
JGWGlzAjdjo=
=DuVB
-----END PGP SIGNATURE-----

--=-xhNYWKCWhx7FWFs4UFYS--
