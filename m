Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:60235 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755239Ab3GDBqK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Jul 2013 21:46:10 -0400
Message-ID: <1372902360.22888.25.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH v6 2/4] deb-pkg: split debug symbols in their own package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Thu, 04 Jul 2013 02:46:00 +0100
In-Reply-To: <1372860126-8909-3-git-send-email-anisse@astier.eu>
References: <1372860126-8909-1-git-send-email-anisse@astier.eu>
	 <1372860126-8909-3-git-send-email-anisse@astier.eu>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-SgpgDroagHKo3LAHOe/O"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>


--=-SgpgDroagHKo3LAHOe/O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-07-03 at 16:02 +0200, Anisse Astier wrote:
> This can reduce almost 3 times the size of the linux-image package,
> while keeping the debug symbols available for this particular build, in
> their own package.
>=20
> This mimics the way kernels are built in debian, ubuntu, or with
> make-kpkg, and comes at the price of a small slowdown in the building of
> packages.
>=20
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> Cc: Ben Hutchings <ben@decadent.org.uk>
> Acked-by: maximilian attems <max@stro.at>
[...]

Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

--=20
Ben Hutchings
Tomorrow will be cancelled due to lack of interest.

--=-SgpgDroagHKo3LAHOe/O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUdTT2Oe/yOyVhhEJAQrG0xAArS65piw5lFzDCnaRRl8ZuxN2f3+Gzg6k
3wsyr+0150JzLZrgnTyJiGMYqmM8m8m/LhTSVOIHbOpMof6pPagaLBh1BSDa7CuQ
Nhchuu3pXeDQn0yz8Sx3rapjqrO7/07bHOWpv6XPN+3Qslu2NQltKGBXr5c4qz8Z
lQT0CHi574HVEZE/P2P06/rf0aQUUSeaqxRfsWGMMlRYGJLe4QsR+EIw7+95B4Q3
tCMpyVcqwFNc7uOGMTT0yUZFtsy8o5PVsqPHIy9KeqcGQjK43RePgen6cEv5JYUP
BhheM2GPQ3zRZ955vqCo+Nxcd97Oc9wFS5+joyKgYIB+UZpNcSPimsbukGn5aw9e
f5UJXVmOjdw0RatDnVVFtvzOo01MUPnavp25gvUVoR+O+eJ+odcBRN5KglylaL9X
1I+2h8wfGkPImWbsmgkghLgaJ/Inucu1sbX0kUuRokyeIqxmBZczzljCPPaPrm2r
4u+LM08fsBnO/qDF+PS6cEtjKjEQVbnuAoQLQ0vhWT4mUGLf/5AqJdBN0afOu14y
k+ml9brTo8THeH/GabJux0THQRSA+t0VshmnF2Ym9LtrhhsuNXgkAc94d4aDEurQ
VowAqnZIc79OAGUO1VMWOpMUNzvWBekmhjNOtQGl2FsceT//DkLiEYVC4SgN3Xvu
XCCF8/B2Vjg=
=T0hk
-----END PGP SIGNATURE-----

--=-SgpgDroagHKo3LAHOe/O--
