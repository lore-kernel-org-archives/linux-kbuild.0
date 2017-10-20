Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:39524 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751154AbdJTNUX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Oct 2017 09:20:23 -0400
Message-ID: <1508505607.2721.26.camel@decadent.org.uk>
Subject: Re: getconf options
From: Ben Hutchings <ben@decadent.org.uk>
Date: Fri, 20 Oct 2017 14:20:07 +0100
In-Reply-To: <20171020054710.vfkkfnl3hjqqmlsb@pengutronix.de>
References: <dbf8b816-e1f7-f835-dd32-6b517e87cbc4@foxmail.com>
         <1a4f82d9999041c6a3c5ce9f37805e7f@SOC-EX01V.e01.socionext.com>
         <20171020054710.vfkkfnl3hjqqmlsb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-SPbOwnA5ryrCu7KZXFQf"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, yamada.masahiro@socionext.com
Cc: puck.chen@foxmail.com, linux-kbuild@vger.kernel.org


--=-SPbOwnA5ryrCu7KZXFQf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-20 at 07:47 +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Fri, Oct 20, 2017 at 04:14:44AM +0000, yamada.masahiro@socionext.com w=
rote:
> > > With commit d7f14c66c273b00aaa626f419d3155773a88d460, I got the follo=
w
> > > warning on macos.
> > >=20
> > > getconf: no such configuration parameter `LFS_CFLAGS'
> > > getconf: no such configuration parameter `LFS_LDFLAGS'
> > > getconf: no such configuration parameter `LFS_LIBS'
> > > scripts/kconfig/mconf  Kconfig
> > >=20
> > > $ getconf LFS_CFLAGS
> > > getconf: no such configuration parameter `LFS_CFLAGS'
> > >=20
> > >=20
> > > Do you have some idea about this? Are these paremeters default to get=
conf?
> > >=20
> > > -Feng
> > >=20
> >=20
> >=20
> > Do you have a clue?
> >=20
> >=20
> > Does it make sense to suppress warnings like this?
> >=20
> > HOST_LFS_CFLAGS :=3D $(shell getconf LFS_CFLAGS 2>/dev/null)
> > HOST_LFS_LDFLAGS :=3D $(shell getconf LFS_LDFLAGS 2>/dev/null)
> > HOST_LFS_LIBS :=3D $(shell getconf LFS_LIBS 2>/dev/null)
> >=20
> >=20
> > Or, hard-code
> > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
> > as Ben originally suggested?
>=20
> I'm not a fan of hardcoding these. On 64 bit arch (and I think also a
> few 32 bit archs (x32?)) they are not needed and so IMHO shouldn't be
> added.

What harm would they do?

Ben.

> I think 2>/dev/null is fine.
>=20
> Having said that, I wonder if/how LFS works on MacOS.

--=20
Ben Hutchings
Make three consecutive correct guesses and you will be considered an
expert.


--=-SPbOwnA5ryrCu7KZXFQf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlnp+AcACgkQ57/I7JWG
EQnUFw/+IBYNc78EOFI/lVkv/COyPpXNkqbbeEL8X/LHEWCvKDUR6ewaXSC+Nf3d
Lwf+inLD3pvZ9Fmbp9f+UOL4V9fWSnjW4WP50o/iYJdEAy2ls5KOzOThjp4DYhA/
PtPq6x9ALBsg4GbynMdVtcNK9+EQ8/3NGmuPmxF+Yp/EQumMYkUQ+9iSmJkZw8rq
SZO33ctNnu41nMClgqpGna7nWPrKcnAGuzH8IhL82BwmGfco/lOkPbYqhcPi6D2A
vzWPmAT/2UHv23eJQd3JEXqgcodUPSI/ldddPl5GtLUv1KjVaXckXCMrZn2mZACL
ncDI8Qad+WjK2+EJ2TAq21/lgdQz6SGlFNg78OTm0SopEcGCgMizpZ7/5EbIqf1s
niq9uc243psbmzSYZ7S7Th7eMuVhWQxKxA0Ga9oF1tTLJd7XFY9ev2RPYuljBh2r
6RqLAHEWdHEtX4ls7H99+Q1ksd5Ew1w8Umo6qQP0XIhlH/SQ0LvEIx1R8u3BQT2b
hIyJYAasGoekpxnGzkLjAF1PUkuGUnnHEOZrjR3iay8Upffa6f432LU3UW6U+Hee
SO5UXYKZEPFlmLh3wGCaDCkjV/uzjHOzfK1cPh3hKof4Am8svu+5byJMOp6rtJP1
7Z2Ny4ReXPk54Js6sj5FJ/1chP58aFbCI1FELSFUpNNKe75nbn8=
=rCvn
-----END PGP SIGNATURE-----

--=-SPbOwnA5ryrCu7KZXFQf--
