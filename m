Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59178 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757159Ab1DGXmD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Apr 2011 19:42:03 -0400
From: Ben Hutchings <ben@decadent.org.uk>
In-Reply-To: <1300508770.26693.73.camel@localhost>
References: <1300508770.26693.73.camel@localhost>
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="=-4SCZLu+OTGKBwRYvkepP"
Date: Fri, 08 Apr 2011 00:41:55 +0100
Message-ID: <1302219716.5282.8.camel@localhost>
Mime-Version: 1.0
Subject: Re: [PATCH] kconfig: Avoid buffer underrun in choice input
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org


--=-4SCZLu+OTGKBwRYvkepP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2011-03-19 at 04:26 +0000, Ben Hutchings wrote:
> commit 40aee729b350672c2550640622416a855e27938f ('kconfig: fix default
> value for choice input') fixed some cases where kconfig would select
> the wrong option from a choice with a single valid option and thus
> enter an infinite loop.
>=20
> However, this broke the test for user input of the form 'N?', because
> when kconfig selects the single valid option the input is zero-length
> and the test will read the byte before the input buffer.  If this
> happens to contain '?' (as it will in a mips build on Debian unstable
> today) then kconfig again enters an infinite loop.

Please acknowledge this and send it upstream.

Ben.

> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Cc: stable@kernel.org [2.6.17+]
> ---
>  scripts/kconfig/conf.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 659326c..006ad81 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -332,7 +332,7 @@ static int conf_choice(struct menu *menu)
>  		}
>  		if (!child)
>  			continue;
> -		if (line[strlen(line) - 1] =3D=3D '?') {
> +		if (line[0] && line[strlen(line) - 1] =3D=3D '?') {
>  			print_help(child);
>  			continue;
>  		}

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-4SCZLu+OTGKBwRYvkepP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIVAwUATZ5Lv+e/yOyVhhEJAQooZA//Wrncu9+e7+FKc0nqhoMN81PlchZNxHkX
S8KDwfYsfbObYZQvBv5m+7rjwuzPi6nzy9T6ILJk6eHvRz28D9zTovmH9ju11Byx
8lUh5QdXl2Dtonxo780zQl6nm4IHwqRhglGRaqv3VnUKVUAHek2oWIMMbkOByHoh
Ld6SNSchODFuc3g+WBwLh3eCfiI9quBzJ1yaPhwnl+g2EpiAmTFkXMTtT1fKOzKE
TcvicarQMcS6kAuvHjYVHzyV+r+JRL5mGW1ehGaxvGi7bvsvSxCJMJtkkUVISdlE
VEDhmTxteTcNpwbXmRtwHx3VeF59vjp8P6sY6mOAtkU/EUbuj7E52uV+htpeLB5D
4ufzIZmGVT5d/ipgEMSU9e2dYioyFwmJJH5p0j3bQJILW266DGHd1bq+gA2/qc+Y
glBfOMKukuuZMOmhAXGMC9CccWYPH3d97pKZtnJOtZUeRNZAIlvLiput+yEvCDYW
nqde+ichTbB/4XXQNrFA8N9r+akt9Ayrblax3r0NFJj0Ngz1DzGSN0MU/MSMUwIQ
uqrCNC31byC+nrl6d84F6x51ZK/6Tm+vE7UREXItJyE1zYcFkgDeOEwsF91KC1FV
fVgK90ZSv8tLK5+Icad5hnqkzF2tbwc8xoVeSdIJU5EKAmr/ChPllAY7RhMLZzy3
bzDCJtoZRoI=
=2CHj
-----END PGP SIGNATURE-----

--=-4SCZLu+OTGKBwRYvkepP--
