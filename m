Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:57335 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752149AbdGIQco (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 9 Jul 2017 12:32:44 -0400
Message-ID: <1499617946.2707.99.camel@decadent.org.uk>
Subject: Re: [PATCH] kbuild: Enable Large File Support for hostprogs
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 09 Jul 2017 17:32:26 +0100
In-Reply-To: <CAK7LNATL1CkGMtyLVsR3791dgYHR6PQ7OBmaGSa0WPAkxk8PLw@mail.gmail.com>
References: <20170629121136.16860-1-u.kleine-koenig@pengutronix.de>
         <20170629121724.cnv5eymfnlctdifk@pengutronix.de>
         <CAK7LNATL1CkGMtyLVsR3791dgYHR6PQ7OBmaGSa0WPAkxk8PLw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-BOEZceBunMFmm87fTq7A"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>


--=-BOEZceBunMFmm87fTq7A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2017-07-08 at 22:42 +0900, Masahiro Yamada wrote:
> 2017-06-29 21:17 GMT+09:00 Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutr=
onix.de>:
> > Hello,
> >=20
> > On Thu, Jun 29, 2017 at 02:11:36PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > diff --git a/Makefile b/Makefile
> > > index e40c471abe29..2c72207ce298 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -301,9 +301,15 @@ CONFIG_SHELL :=3D $(shell if [ -x "$$BASH" ]; th=
en echo $$BASH; \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else if [ -x /bin/bas=
h ]; then echo /bin/bash; \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else echo sh; fi ; fi=
)
> > >=20
> > > +HOST_LFS_CFLAGS :=3D $(shell getconf LFS_CFLAGS)
> > > +HOST_LFS_LDFLAGS :=3D $(shell getconf LFS_LDFLAGS)
> > > +HOST_LFS_LIBS :=3D $(shell getconf LFS_LIBS)
> > > +
> > > =C2=A0HOSTCC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D gcc
> > > =C2=A0HOSTCXX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D g++
> > > -HOSTCFLAGS=C2=A0=C2=A0=C2=A0=3D -Wall -Wmissing-prototypes -Wstrict-=
prototypes -O2 -fomit-frame-pointer -std=3Dgnu89
> > > +HOSTCFLAGS=C2=A0=C2=A0=C2=A0=3D -Wall -Wmissing-prototypes -Wstrict-=
prototypes -O2 -fomit-frame-pointer -std=3Dgnu89 $(HOST_LFS_CFLAGS)
> > > +HOSTLDFLAGS=C2=A0=C2=A0=3D $(HOST_LFS_LDFLAGS)
> > > +HOST_LOADLIBES =3D $(HOST_LFS_LIBS)
> > > =C2=A0HOSTCXXFLAGS =3D -O2
> >=20
> > I forgot to add $(HOST_LFS_CFLAGS) to HOSTCXXFLAGS. I can resend if the
> > patch is considered ok otherwise.
> >=20
>=20
> Ben,
> Is this patch OK with you?

Acked-by: Ben Hutchings <ben@decadent.org.uk>

Ben.

--=20
Ben Hutchings
All extremists should be taken out and shot.


--=-BOEZceBunMFmm87fTq7A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlliWpoACgkQ57/I7JWG
EQnSsxAAq0He3GvARgkU1RB2FWUatH1Q/gHD7/racmZqYEW7aqATzWnVYrK5jKrj
vtwcf84Tr3ywma7VyWZf1Hsq0nWoVONs1nPhmG2BMSszvodjuauLY6B/r4lLyzyB
IYKHjIyqqmuNOuMsro0oJp7GpQtWByb7eh2z7GB0ljmHLJZAIO8W1qVW/GfFAYnN
KvV8IbiJALlkDxcGq3tju1gw97s3XCynIJVgrlDpev5R/h2Wopyws0VomB2wPzPI
inLf1VhLbVjzmnvfG7wuVYrAN0iF5fl/ELB2ybCPc2IfuXEr+DH4+8/syJ5hZ0MD
lam0yk5AuOJmETqMAbGBppt6FDteanQsx/twPukvFVV5F8Yuqh3Z0ZkMYe4NuO0R
4P71BN3IzQ1iS2TpEO3AD4w8SJu41SPWPM61uCTBJCB/D+8n3zFriR0sahDfEzgc
xXrIyEbvr8XQL1aQLwplrs5uCFuoOyoePpU8IxkjeGI7koQSss9s9RZ/s/Hj5fwH
U/sUfBGz/Jij0a2RGFX5b/FUmv5WPYJhglMbtvH7FjX2Y93vFU/nGM10Jgopcid8
sJ8jrRzoVM+NaSpF/oAlh4YvR+oh19DoE40vW+Okpn0DV+ae60hvpGoQRhDBd6Sg
x6cUjIPvu7cRL6hion2ybYaLNa5WiRabPNAC1weqfIcXzdE9VqU=
=cIG6
-----END PGP SIGNATURE-----

--=-BOEZceBunMFmm87fTq7A--
