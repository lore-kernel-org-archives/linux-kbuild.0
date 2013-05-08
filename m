Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:55784 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753199Ab3EHCtV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 May 2013 22:49:21 -0400
Message-ID: <1367981350.4131.146.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH v4 1/4] deb-pkg: use KCONFIG_CONFIG instead of .config
 file directly
From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 08 May 2013 03:49:10 +0100
In-Reply-To: <1367941611-12223-2-git-send-email-anisse@astier.eu>
References: <1367941611-12223-1-git-send-email-anisse@astier.eu>
	 <1367941611-12223-2-git-send-email-anisse@astier.eu>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6VgSDuS/Eb6Nq5axMTrA"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com


--=-6VgSDuS/Eb6Nq5axMTrA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-05-07 at 17:46 +0200, Anisse Astier wrote:
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
>  scripts/package/builddeb | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index acb8650..2d84671 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -41,9 +41,9 @@ create_package() {
>  	parisc*)
>  		debarch=3Dhppa ;;
>  	mips*)
> -		debarch=3Dmips$(grep -q CPU_LITTLE_ENDIAN=3Dy .config && echo el) ;;
> +		debarch=3Dmips$(grep -q CPU_LITTLE_ENDIAN=3Dy $objtree/$KCONFIG_CONFIG=
 && echo el) ;;
>  	arm*)
> -		debarch=3Darm$(grep -q CONFIG_AEABI=3Dy .config && echo el) ;;
> +		debarch=3Darm$(grep -q CONFIG_AEABI=3Dy $objtree/$KCONFIG_CONFIG && ec=
ho el) ;;

You use $objtree here (and I think I may have suggested to you that it
was necessary)...

>  	*)
>  		echo "" >&2
>  		echo "** ** **  WARNING  ** ** **" >&2
> @@ -106,12 +106,12 @@ fi
>  if [ "$ARCH" =3D "um" ] ; then
>  	$MAKE linux
>  	cp System.map "$tmpdir/usr/lib/uml/modules/$version/System.map"
> -	cp .config "$tmpdir/usr/share/doc/$packagename/config"
> +	cp $KCONFIG_CONFIG "$tmpdir/usr/share/doc/$packagename/config"
[...]

but you don't use it here.  This still works because we are running with
current directory set to $objtree.  So be consistent and just use
$KCONFIG_CONFIG in all cases.

Ben.

--=20
Ben Hutchings
For every action, there is an equal and opposite criticism. - Harrison

--=-6VgSDuS/Eb6Nq5axMTrA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUYm9Jue/yOyVhhEJAQqqYw//YmDv1FTpPuilgFWKZ8u0JKTuz4lI6P1L
Kuzs9hY8bAbck6nFVwlUR8HiQwQHv4VwNLuq0BBKC6nk/sI+zDptMGUaHLxRoHii
dmINkdRjLtb50mVlGkuUF7uroozBqOEX1fkdWtAmdnqHoAFRjUprUYkf8pRSxxcZ
Lg5dXHYefZXFCnXiLl6WKzRkfdd8RDt/P0PqwY684enDtRnCDdRaQGayu59L82J1
MEt2DZ0EQpoEly78NIL9NXxlR+MlRt2E3avSmSWU42Ofh3xuYxj0MlPaR4id2aff
F1zKnhP40kCBtzyArhcpnZfdkG6vQN4Je06cQp7KOAQ420iEEgQO+AnOTNsvZFbA
u62hP29Xgv5bcs8N/NSqd6hzuWEZIIgfF5jzvrIFzvHtvIn1+cvwqYqcEDfAHGjg
WfhIYSil+GjxSlUMPLHNDRERKVTDBeiVDyFr08GA+0Yc/4nh/WwEjjSP0bUZBWzB
eHJMevCW3DJSzKfJFYnb7KM8lak6Pxau9gG+WFJqQXyCL0gKdGs/zJC/a5HrikmT
MeMJMiSFGpgghYT+c1WE6IV/woEz1FizshQX89nphg2FwanUOM14m8A4j26p/5hj
JOrAyzuHqOsvNCG3J+nEgP7B1qOCIfxsVXuS3wiNetyKsGhAz0F+e8fdLX9w1MXM
Q0e7OaXvTtA=
=2jYL
-----END PGP SIGNATURE-----

--=-6VgSDuS/Eb6Nq5axMTrA--
