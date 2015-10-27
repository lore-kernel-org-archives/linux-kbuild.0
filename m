Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:45387 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751572AbbJ0At6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Oct 2015 20:49:58 -0400
Message-ID: <1445906948.2395.82.camel@decadent.org.uk>
Subject: Re: [PATCH] kbuild: Add support for SOURCE_DATE_EPOCH environment
 variable
From: Ben Hutchings <ben@decadent.org.uk>
In-Reply-To: <562E950D.2030609@suse.com>
References: <1443741332.2730.75.camel@decadent.org.uk>
	 <562E950D.2030609@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="=-Cha6UU3z8l6RWJTg3Lxf"
Date: Tue, 27 Oct 2015 09:49:08 +0900
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, reproducible-builds@lists.alioth.debian.org


--=-Cha6UU3z8l6RWJTg3Lxf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2015-10-26 at 22:03 +0100, Michal Marek wrote:
> Dne 2.10.2015 v 01:15 Ben Hutchings napsal(a):
> > As part of the reproducible builds project, the SOURCE_DATE_EPOCH
> > environment variable has been specified as a project- and
> > distribution-independent means to specify a timestamp at build
> > time: https://reproducible-builds.org/specs/source-date-epoch/
> >=20
> > Add support for this by converting it to KBUILD_BUILD_TIMESTAMP
> > if they aren't both set.
>=20
> At which projects besides the kernel is this aimed? If there are
> multiple projects willing to support this, I'll happily apply it. But if
> it's just a synonym for KBUILD_BUILD_TIMESTAMP that nobody else is going
> to support, then it looks a bit redundant.

It's aimed at all build tools.  For examples, see:

https://codesearch.debian.net/results/%5C%24SOURCE_DATE_EPOCH%20-path%3Adeb=
ian%2F/page_0
https://codesearch.debian.net/results/getenv%5C%28%22SOURCE_DATE_EPOCH%22%5=
C%29%20-path%3Adebian%2F/page_0

Ben.

--=20
Ben Hutchings
Never attribute to conspiracy what can adequately be explained by stupidity=
.
--=-Cha6UU3z8l6RWJTg3Lxf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVi7KBOe/yOyVhhEJAQpGEw/+OH9B9b1botch6UjEayJEWkZgvNBAKy8i
+GKUyUfKVKa3v2976Ts8REz6CmIKsSl2IFrMLmakdS4llrBANiWLsiO8cHH3BLvX
P2kQNuzi9dos4SFwyEpE2nZQ3U+tep3/QMNmVf0DO4r1tt0GvjPH2jRcV2GZBjFX
i67BoPvdPxjrxvzVI5ISKvo8Sc+5uV7a7feu5r+yYqmlFgn4A98CfhTMG4R2lxQr
LrQO01Yq4qAA25QdhGYcoSC+Dl50QA0Ym/w75N2JT15o4aU4j0imQUcH2Ba7DKz3
nXR0WJvNYibgJSSkiLnhbvOhh9B+79EaSsa5OLrI7AHReLNXZNHhwu67eMCr16Gl
0EjW/uAnOcIeTmb/vd0SxVxAqDhyzGBTJhDvLIUR0fEIAnD1Ucy5TRYvyllcUUxB
osUOssQDsncX/H6Y2uf0bYBeiII2FvFzIA19/oXR/GoCNQgie+ymsOU1CARtjaHk
EnknKrmHOHoCIHElcFmSGRJMk9PvNH+aXVSX/+E6KkdBv9OK8TxJcWbiVMxlqlAj
NDLM1ajgfj86RWxXJ9ujB1kp/9B5Fkb52IvMGKGVFIt+CA+9YbTaJR2rkdXwR9BD
0aIQa72y+tFMAYsSTWh+ss0cCzVcLYekBRDrV8+V9CaY5kpgQVnAruAl7ItAxWX8
8052yh8yG2o=
=AFCs
-----END PGP SIGNATURE-----

--=-Cha6UU3z8l6RWJTg3Lxf--
