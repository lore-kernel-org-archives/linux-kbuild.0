Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:40996 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750706Ab3FOED3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 15 Jun 2013 00:03:29 -0400
Message-ID: <1371268995.3776.13.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH v5 2/4] deb-pkg: split debug symbols in their own package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sat, 15 Jun 2013 05:03:15 +0100
In-Reply-To: <1371203217-19572-3-git-send-email-anisse@astier.eu>
References: <1371203217-19572-1-git-send-email-anisse@astier.eu>
	 <1371203217-19572-3-git-send-email-anisse@astier.eu>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-sYQX/V1IdrKF8U1vEp1q"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>


--=-sYQX/V1IdrKF8U1vEp1q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-06-14 at 11:46 +0200, Anisse Astier wrote:
> This can reduce almost 3 times the size of the linux-image package,
> while keeping the debug symbols available for this particular build, in
> their own package.
>=20
> This mimics the way kernels are built in debian, ubuntu, or with
> make-kpkg, and comes at the price of a small slowdown in the building of
> packages.
[...]
> @@ -128,6 +136,20 @@ if grep -q '^CONFIG_MODULES=3Dy' $KCONFIG_CONFIG ; t=
hen
>  		mv "$tmpdir/lib/modules/$version"/* "$tmpdir/usr/lib/uml/modules/$vers=
ion/"
>  		rmdir "$tmpdir/lib/modules/$version"
>  	fi
> +	if [ -n "$BUILD_DEBUG" ] ; then
> +		(
> +			cd $tmpdir
> +			for module in $(find lib/modules/ -name *.ko); do
[...]

Can shells generally cope with the list this produces for, say, an
allmodconfig build?  My instinct would be to use xargs and while, but
I'm willing to believe that this does work.

Ben.

--=20
Ben Hutchings
If the facts do not conform to your theory, they must be disposed of.

--=-sYQX/V1IdrKF8U1vEp1q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUbvng+e/yOyVhhEJAQpPzA//RLHWBW9x6X24SKtmJ0rJzJI49rqAwhMX
n53iCzxAMagBgkoU4AKlmGFNFKrJpC9HLOdt4hjv5UOuXhpOEjXCiUc2zb+KzABa
kRAbNjK/ggUYPIGMZeF6PMrcB3hsGpwDb4iUghEO6Jlyhpx57aS6E391UzzLFb1e
55W4ewkPDox3vnFRqkZOo1LdEHlSTiXAY2zm2KHOPbWjPMOcR5oMt+8GxKEDA39q
VWojQS4+pWDIzkRUgZyqY2RvxMwpJ4kBYobpAl/V/ZoeyDaoWpcepcly13VFN7SP
0/TRyJpaLuBKX4PrQXU0EUobLNbFpeY/qkSm7Bv8GawAhGjepiX9kMEGfkilM2xe
yeCESEVHT7+IlOmoHXJ71S1Eld1tusUidDJXohSrbBu2CEugZdpfXbEC9XS/jr7x
RoePGZ0rSruOtJIxIy7AlxiGFwlzS59zhvPnZeS/jqtNZqvM7Dxvw4Np982VHG76
uFc+/vEw6BZoKHmIbFvQ5Nc4rmLYo4Q4ndTJpAoosYakddSbEwlH4jT/VhXR5+Kb
2Gc7GCCcEsFCatHE4a/Rv7NZ77NCYCpFfO7wXJwLPEb8kaYX4rokA+N5l8uXkKYb
fGNPp8APm3TehFctFToCMWfglXhcG3DAbuhpum4YnQkB11j8qQ/PXhI1xPL7tQrR
mDyXnmAlj84=
=7fXp
-----END PGP SIGNATURE-----

--=-sYQX/V1IdrKF8U1vEp1q--
