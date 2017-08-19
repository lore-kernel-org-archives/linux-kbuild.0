Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59828 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751243AbdHSBOD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Aug 2017 21:14:03 -0400
Message-ID: <1503105231.3688.33.camel@decadent.org.uk>
Subject: Re: [PATCH] kbuild: Do not use hyphen in exported variable name
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sat, 19 Aug 2017 02:13:51 +0100
In-Reply-To: <1493563778.2564.11.camel@decadent.org.uk>
References: <20170418010011.GC4152@decadent.org.uk>
         <CAK7LNASG59wc7Ed24HFiGn0CFUxjDtMgKwy8dhz2PfvRDw1Y1w@mail.gmail.com>
         <1492932183.31767.64.camel@decadent.org.uk>
         <CAK7LNATV4vsczwkntLJPhvPew4NEL1JeckaBxeFk-6Q-Y_VfoQ@mail.gmail.com>
         <1493563778.2564.11.camel@decadent.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-c2dsHJspXz3WoFWEadVF"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>


--=-c2dsHJspXz3WoFWEadVF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-04-30 at 15:49 +0100, Ben Hutchings wrote:
> On Sun, 2017-04-30 at 23:14 +0900, Masahiro Yamada wrote:
> > Hi Ben,
> >=20
> >=20
> > > 2017-04-23 16:23 GMT+09:00 Ben Hutchings <ben@decadent.org.uk>:
> > > On Sun, 2017-04-23 at 15:47 +0900, Masahiro Yamada wrote:
> > > [...]
> > > > I tested dtbs_install once again by myself, but
> > > > dtbinst-root is exported to the sub make
> > > > and the vendor directories are created correctly.
> > > >=20
> > > >=20
> > > > I checked the debian's forum you gave
> > > > > References: https://bugs.debian.org/833561
> > > >=20
> > > > In there, you mentioned:
> > > > "This looks like a bug in make, but we can at least work around it =
by
> > > > using a non-hyphenated variable name."
> > > >=20
> > > >=20
> > > > Does this issue happen on a specific Make version?
> > > >=20
> > > > I tested GNU make 3.81, 3.82, 4.0, 4.1, 4.2,
> > > > but I was not hit by the problem.
> > >=20
> > > I don't think this is make version dependent.=C2=A0=C2=A0I can't repr=
oduce the
> > > issue today with make 4.1.=C2=A0=C2=A0But I would have been using the=
 same
> > > version in August when I wrote that.
> > >=20
> > > What more can I say?=C2=A0=C2=A0Clearly the hyphenated variable gets =
passed to
> > > the sub-make in most cases.=C2=A0=C2=A0But it's not totally reliable =
because last
> > > year it wasn't working for us.
> > >=20
> > > > In the last post in the thread, you concluded:
> > > > "We believe that the bug you reported is fixed in the latest versio=
n of
> > > > linux, which is due to be installed in the Debian FTP archive."
> > >=20
> > > I didn't write that, it's a standard message generated for bugs marke=
d
> > > as closed in a package changelog. :-)
> > >=20
> > > > If so, why is this patch here?
> > > > How is the dtbs_install procedure different in the Debian package?
> > >=20
> > > This is the patch I applied to the package.
> > >=20
> >=20
> > Do you still need this patch for Debian?
> [...]
>=20
> I don't think so.=C2=A0=C2=A0I just don't know for sure.

I've now seen a similar problem with the suffix-y variable exported
from arch/sh/boot/Makefile to arch/sh/boot/compressed/Makefile:
https://buildd.debian.org/status/fetch.php?pkg=3Dlinux&arch=3Dsh4&ver=3D4.1=
3%7Erc5-1%7Eexp1&stamp=3D1502943967&raw=3D0

Those Makefiles haven't changed recently, so there must be some
difference in the build environment.  Here's a Makefile that
demonstrates the difference in behaviour between bash and dash:

--- BEGIN ---
ifdef WANTED_SHELL
SHELL :=3D $(WANTED_SHELL)
endif

test:
	@WANTED_SHELL=3D/bin/bash $(MAKE) test2
	@WANTED_SHELL=3D/bin/dash $(MAKE) test2
	@WANTED_SHELL=3D $(MAKE) test2

test2: export foo_bar :=3D foo_bar
test2: export foo-bar :=3D foo-bar
test2:
	@echo SHELL=3D$(SHELL)
	@$(MAKE) test3

test3:
	@echo foo_bar=3D$(foo_bar)
	@echo foo-bar=3D$(foo-bar)

.PHONY: test test2 test3
--- END ---

For me, this produces:

$ make -s
SHELL=3D/bin/bash
foo_bar=3Dfoo_bar
foo-bar=3Dfoo-bar
SHELL=3D/bin/dash
foo_bar=3Dfoo_bar
foo-bar=3D
SHELL=3D/bin/sh
foo_bar=3Dfoo_bar
foo-bar=3Dfoo-bar

Note that the last two cases are different even though /bin/sh is dash
here.  It turns out that make avoids using the shell for simple
commands, unless it has been changed from the default:
https://sources.debian.net/src/make-dfsg/4.1-9.1/job.c/#L2575

Ben.

--=20
Ben Hutchings
The generation of random numbers is too important to be left to chance.
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Robert Coveyou

--=-c2dsHJspXz3WoFWEadVF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlmXkNAACgkQ57/I7JWG
EQkV7Q/+MZrOxvIxyjxeLvRWDZN51z7jkBdYBTK71nRnepcd40CnvQKf4w6egfkL
K45m1B+lcBTm85yuk3acaH9vzIqnI497yNHmj4brznQeqFxEUjwjew6DSNY/aa9t
cF49EIRo6q2dLkjupMABWWYOxht6OECRQBJaBdguMzNGuM6dWUof5vg5cT2fD7Qv
55x7Or3rX10pOUda1ggFpXc3VZ/AW4TUy0pq3obBraBbLfVIZbyqaHr8IPlD0yjs
5WnIwLxn6gII4moMJmOmfs7FKq5pc80CABQMOqOb762k7Mic4MxO15feeFVh0vWA
mk8GYDdvtEP8LHDm/8S40mlusm1KwYmKGozj1SSC4JD7yIc1VlGvPZ6FWdLbogCg
7JnZmJQTkcoZj115CmRBwkNUeBzRXMmUmEGcY8JwFf/EEou/WVQYofPvTsUZWgnL
v+bJvj3xVB6qcOJ/Gh6SK8I8H/VEBJQ/luEv2B3VNLx//yj2uMgiS3nzLoVuU5Ty
lfam9tFdnLkPQjeW97RVjm0JYCFGx+vgqDAqJg0+NpbEYL/PkjSETKoxl2x7IwTQ
UlDG7dKq+rLk3jwKaxgmH/vgZ6x7h6Bxm4GDUdzAV1iWldE7bJrGa+poFppG5emr
mRzAFQczc307nkUkM+nBhJvnhTj1UD1i0qfkNLMB33eSO57Nmoo=
=k6ZB
-----END PGP SIGNATURE-----

--=-c2dsHJspXz3WoFWEadVF--
