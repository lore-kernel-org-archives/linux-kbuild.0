Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:34569 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751191AbaFOPTp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Jun 2014 11:19:45 -0400
Message-ID: <1402845573.7797.20.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH v2] builddeb: fix missing headers in linux-headers
 package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 15 Jun 2014 16:19:33 +0100
In-Reply-To: <539AE2F5.30301@suse.cz>
References: <1397562708-7531-1-git-send-email-fathi.boudra@linaro.org>
	 <539AE2F5.30301@suse.cz>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4BuvwbGmsSMUikrOtYDT"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Fathi Boudra <fathi.boudra@linaro.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Maximilian Attems <maks@debian.org>


--=-4BuvwbGmsSMUikrOtYDT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2014-06-13 at 13:39 +0200, Michal Marek wrote:
> Dne 15.4.2014 13:51, Fathi Boudra napsal(a):
> > The kernel headers package (linux-headers) doesn't include several
> > header files required to build out-of-tree modules.
> >=20
> > It makes the package unusable on e.g. ARM architecture:
> >  /usr/src/linux-headers-3.14.0/arch/arm/include/asm/memory.h:24:25:
> >  fatal error: mach/memory.h: No such file or directory
> >  #include <mach/memory.h>
> >  ^
> >  compilation terminated.
> >=20
> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> > ---
> >  Changes from v1:
> >  - add missing module.lds, mips/Kbuild.platforms and Platform files
> >  - generically look for all include directories in arch/$SRCARCH
>=20
> Ben, is this version OK to merge? Does the package now match the
> official Debian ones?

This is not exactly the same, but I think it's good.

Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

Ben.

> Thanks,
> Michal
>=20
>=20
> >  scripts/package/builddeb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > index f46e4dd..42b1e20 100644
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -287,9 +287,11 @@ EOF
> > =20
> >  fi
> > =20
> > -# Build header package
> > +# Build kernel header package
> >  (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.p=
l > "$objtree/debian/hdrsrcfiles")
> >  (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$=
objtree/debian/hdrsrcfiles")
> > +(cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.plat=
forms -o -name Platform >> "$objtree/debian/hdrsrcfiles")
> > +(cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts=
 -type d) -type f >> "$objtree/debian/hdrsrcfiles")
> >  (cd $objtree; find arch/$SRCARCH/include Module.symvers include script=
s -type f >> "$objtree/debian/hdrobjfiles")
> >  destdir=3D$kernel_headers_dir/usr/src/linux-headers-$version
> >  mkdir -p "$destdir"
>=20
>=20
>=20

--=20
Ben Hutchings
Tomorrow will be cancelled due to lack of interest.

--=-4BuvwbGmsSMUikrOtYDT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAU525iue/yOyVhhEJAQorSA/8C/ahl4u2X9jV0trSS/7HnVLPyKGQf/wR
xnrOcHHOZP26BII7WxWg8P8qwhYLonzoiZ2H5axG7sYyYyrADi4Mrntqqp4MJEiY
DuSmcxofCmCqRZDZYtKNcYhvnsECWKwOSFwbf2oIxuxRmdvjPaul2XySM8LUdCso
OLSRjDW1bOCPQ1Ln1eCtppHgNdrWS2X0RnkggOVO/Fjbo9LxoWf7zZzk99J9A8z5
hM/LJSGW2TDiOooGah+2u2Lmcp8sX1xFsTcxTXRapkg/580RjKeg54nxRZbNLFaa
j6cJ+o4OnWXbUlUjjEfwF99iJPVeKVJ7ykaUc78t++ZCllzkIT7hUnJkKB4a4aIC
+jRq76soAzT/jsMN3RYl0vot0avYEdlRFQKKp4o+WSH4iBze+WNq9yfB12d+Z8m0
eMIP5RJ82/iuu3qYZNNkENHvt3v8Qah8NERYOz8EYUmqIys/4OC2f87o9T1ptIzp
sUNESuUUtpqHO3Xyfn9nEP225BWMRfe/yE7F8zOCTNK005JatJSoA2a4ny79TWlt
TGrYOnQRAQ8TGLbxsBAOLOYsvHRVIXpSIcgXD4HKnrtFlUKXW5vFtL3g2wO1Um8+
L1BnRZu2zU7md+osBp4sPWP74KLu7o2M9HrTZ89nIb8mAKZ9EV8uiRW3T8Jj7zZU
iGl/nTfMUaw=
=kLe8
-----END PGP SIGNATURE-----

--=-4BuvwbGmsSMUikrOtYDT--
