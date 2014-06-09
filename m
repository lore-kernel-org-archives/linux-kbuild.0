Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:41707 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753102AbaFIAPl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2014 20:15:41 -0400
Message-ID: <1402272928.23860.55.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH v2 1/1] builddeb: add arm64 in the supported
 architectures
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 09 Jun 2014 01:15:28 +0100
In-Reply-To: <1397395563.10849.79.camel@deadeye.wl.decadent.org.uk>
References: <1397307186-3977-1-git-send-email-fathi.boudra@linaro.org>
	 <1397307186-3977-2-git-send-email-fathi.boudra@linaro.org>
	 <1397395563.10849.79.camel@deadeye.wl.decadent.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-3SOr1kUGsFTCuG7z0XsY"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Maximilian Attems <maks@debian.org>


--=-3SOr1kUGsFTCuG7z0XsY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2014-04-13 at 14:26 +0100, Ben Hutchings wrote:
> On Sat, 2014-04-12 at 15:53 +0300, Fathi Boudra wrote:
> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>=20
> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
>=20
> > ---
> >  scripts/package/builddeb | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > index f46e4dd..0bf29a6 100644
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -42,6 +42,8 @@ create_package() {
> >  		debarch=3Dhppa ;;
> >  	mips*)
> >  		debarch=3Dmips$(grep -q CPU_LITTLE_ENDIAN=3Dy $KCONFIG_CONFIG && ech=
o el || true) ;;
> > +	arm64)

Now I'm not so sure.  As we are comparing with the 'machine' name
($UTS_MACHINE, not $ARCH or $SRCARCH), shouldn't this actually check for
aarch64?

Ben.

> > +		debarch=3Darm64 ;;
> >  	arm*)
> >  		debarch=3Darm$(grep -q CONFIG_AEABI=3Dy $KCONFIG_CONFIG && echo el |=
| true) ;;
> >  	*)
>=20

--=20
Ben Hutchings
One of the nice things about standards is that there are so many of them.

--=-3SOr1kUGsFTCuG7z0XsY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUAU5T8pee/yOyVhhEJAQooEA/+JEqYIhv//uGsx6rgmBzdcs/rwoDygHlR
c1xxFOWQHfgd/RCha3CNqecVIXYLAB7paPzo/cZs2Wzp7SsTlsZFYV02zrgUcu1z
uDy2Ex1i2pCCUxmZkJV5+Fr06zqAbiNHU4a6X+tw7aEKBXPdz96f1YtyxD/tu36Q
i4ohnLPAMIzkLDrazJ1wJMoPeiQDV4mj1V+a3a3XwoRp5GMGyHE9mtA/PNLtWKfA
MyRfn0wFwp0GJBi9MPA36o7ylQNPxRQIG/PKxL9x4vTYUogY8ygAyz1ZyRSTz4i3
86SM/CR7gZVc5xQVUYUGjIM++5rP+2V7h2TW68j9llh76Di8mM/pxdV1ZYKa9fcx
IeswYr0qvmGQyYenOl/ydvfatdAEKG+4ouo+UEPkLync63sleH20upkF55ST48wl
4lI2loJhcD8XkY95cUDPkf+sUGCAvsYUGtJhyRHteviNlUiR71lUqTDqGBaJkf1+
ZOyo4pjczyTgNbn7HWK/EZDkbVs/uIdmtlsY7PYW5ZccAK7aUUTeoSKSMsrL3rPO
6NT7b/mLE13ztrXCLgxhDTlbBauAYcTN75/eFxZYGLA7HLSCKigBIxKZdLOiWrB/
+2pbxUgiS5zi4VByOpxHYmp9hb3S2vUP3rSPEsQzXJKCDeKkqosYzmULhPOZvtuP
NqWbQevQJrQ=
=YcNd
-----END PGP SIGNATURE-----

--=-3SOr1kUGsFTCuG7z0XsY--
