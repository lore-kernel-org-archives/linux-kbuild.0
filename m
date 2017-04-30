Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:56268 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1031940AbdD3Oto (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Apr 2017 10:49:44 -0400
Message-ID: <1493563778.2564.11.camel@decadent.org.uk>
Subject: Re: [PATCH] kbuild: Do not use hyphen in exported variable name
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 30 Apr 2017 15:49:38 +0100
In-Reply-To: <CAK7LNATV4vsczwkntLJPhvPew4NEL1JeckaBxeFk-6Q-Y_VfoQ@mail.gmail.com>
References: <20170418010011.GC4152@decadent.org.uk>
         <CAK7LNASG59wc7Ed24HFiGn0CFUxjDtMgKwy8dhz2PfvRDw1Y1w@mail.gmail.com>
         <1492932183.31767.64.camel@decadent.org.uk>
         <CAK7LNATV4vsczwkntLJPhvPew4NEL1JeckaBxeFk-6Q-Y_VfoQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-eRLQDZQ2WVcL952Os5IG"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>


--=-eRLQDZQ2WVcL952Os5IG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-04-30 at 23:14 +0900, Masahiro Yamada wrote:
> Hi Ben,
>=20
>=20
> > 2017-04-23 16:23 GMT+09:00 Ben Hutchings <ben@decadent.org.uk>:
> > On Sun, 2017-04-23 at 15:47 +0900, Masahiro Yamada wrote:
> > [...]
> > > I tested dtbs_install once again by myself, but
> > > dtbinst-root is exported to the sub make
> > > and the vendor directories are created correctly.
> > >=20
> > >=20
> > > I checked the debian's forum you gave
> > > > References: https://bugs.debian.org/833561
> > >=20
> > > In there, you mentioned:
> > > "This looks like a bug in make, but we can at least work around it by
> > > using a non-hyphenated variable name."
> > >=20
> > >=20
> > > Does this issue happen on a specific Make version?
> > >=20
> > > I tested GNU make 3.81, 3.82, 4.0, 4.1, 4.2,
> > > but I was not hit by the problem.
> >=20
> > I don't think this is make version dependent.=C2=A0=C2=A0I can't reprod=
uce the
> > issue today with make 4.1.=C2=A0=C2=A0But I would have been using the s=
ame
> > version in August when I wrote that.
> >=20
> > What more can I say?=C2=A0=C2=A0Clearly the hyphenated variable gets pa=
ssed to
> > the sub-make in most cases.=C2=A0=C2=A0But it's not totally reliable be=
cause last
> > year it wasn't working for us.
> >=20
> > > In the last post in the thread, you concluded:
> > > "We believe that the bug you reported is fixed in the latest version =
of
> > > linux, which is due to be installed in the Debian FTP archive."
> >=20
> > I didn't write that, it's a standard message generated for bugs marked
> > as closed in a package changelog. :-)
> >=20
> > > If so, why is this patch here?
> > > How is the dtbs_install procedure different in the Debian package?
> >=20
> > This is the patch I applied to the package.
> >=20
>=20
> Do you still need this patch for Debian?
[...]

I don't think so.  I just don't know for sure.

Ben.

--=20
Ben Hutchings
This sentence contradicts itself - no actually it doesn't.


--=-eRLQDZQ2WVcL952Os5IG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlkF+YIACgkQ57/I7JWG
EQmRfg/6A2A17wUX8NevTiPkz0q8kK3dFtHzrBa2cUsDoG0K7fdroECXIMxEHjp7
mOTku8na04OaosVrLvdhilAwHmTeEhyV1yKs1O6A+09Q4HUKCWa0IeAmz2DB9nqA
85Wnxf8i85m8x0XPRA7GkCQXmstxXD94PT6wx1EQaR7HcFbF0LprfFpGQ9Q8+x0H
+hOHWB5jNg0ENHyXWJKyNS0iWB5Ckn8pMI1cumi7RtrKO6zunilJYAmzQsu2qERq
Dh4Ab20nd6Vpt7M6TBf4DlFDWw2Mur7sSB3tWg1tBog5nQJfvsVV8wBLpo0EF4Vg
ovE8RaAsJfJn1MWmiYZXA9GxG2TFx4IyHJ0Xuu6MgDH+6ta0SHhLsvW7xyCq3g04
e+nKaRRZoXHNNwDh/+pYmLXV94UW2wDyPA13YoUjJXV7OBOXxsgGFudiCoKsnX8n
EOhall0+r63tKI1sd3JNuCAMh0AGRGxX8d7nHd0cr+qV1vB/o6A/xQXboQfcZx24
sKw3gmBqEBsG8c9uFHldoYPtSWS9NXf57WUA7k4G58RFibawStvoCY9xM3xsrDkV
zLaxtQRAqqTl2W6JlFKzuq8LvMze3Gwnl0kKrfs7f4aFlrdX3SULJR+526DoJfk6
pPvEof4luaXzfj5Qm2BF2BidBDmKVcTboRcYrnWv3Xjj4TIjIm0=
=XYkV
-----END PGP SIGNATURE-----

--=-eRLQDZQ2WVcL952Os5IG--
