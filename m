Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:51678 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754338AbaDMNZU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Apr 2014 09:25:20 -0400
Message-ID: <1397395507.10849.77.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH] builddeb: use $OBJCOPY variable instead of objcopy
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 13 Apr 2014 14:25:07 +0100
In-Reply-To: <1397297604-4271-1-git-send-email-fathi.boudra@linaro.org>
References: <1397297604-4271-1-git-send-email-fathi.boudra@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-uEo9IMLk7HXh9OYED5jn"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Maximilian Attems <max@stro.at>


--=-uEo9IMLk7HXh9OYED5jn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2014-04-12 at 13:13 +0300, Fathi Boudra wrote:
> In cross-build environment, we expect to use the cross-compiler objcopy
> instead of the host objcopy.
>=20
> It fixes following build failures:
> objcopy --only-keep-debug lib/modules/3.14/kernel/net/ipv6/xfrm6_mode_tun=
nel.ko /srv/build/linux/debian/dbgtmp/usr/lib/debug/lib/modules/3.14/kernel=
/net/ipv6/xfrm6_mode_tunnel.ko
> objcopy: Unable to recognise the format of the input file `lib/modules/3.=
14/kernel/net/ipv6/xfrm6_mode_tunnel.ko'
>=20
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>

Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

You could add:

Cc: stable <stable@vger.kernel.org> # 3.12+
Fixes: 810e843746b7 ('deb-pkg: split debug symbols in their own package')

Ben.

> ---
>  scripts/package/builddeb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index f46e4dd..152d4d2 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -155,11 +155,11 @@ if grep -q '^CONFIG_MODULES=3Dy' $KCONFIG_CONFIG ; =
then
>  			for module in $(find lib/modules/ -name *.ko); do
>  				mkdir -p $(dirname $dbg_dir/usr/lib/debug/$module)
>  				# only keep debug symbols in the debug file
> -				objcopy --only-keep-debug $module $dbg_dir/usr/lib/debug/$module
> +				$OBJCOPY --only-keep-debug $module $dbg_dir/usr/lib/debug/$module
>  				# strip original module from debug symbols
> -				objcopy --strip-debug $module
> +				$OBJCOPY --strip-debug $module
>  				# then add a link to those
> -				objcopy --add-gnu-debuglink=3D$dbg_dir/usr/lib/debug/$module $module
> +				$OBJCOPY --add-gnu-debuglink=3D$dbg_dir/usr/lib/debug/$module $modul=
e
>  			done
>  		)
>  	fi

--=20
Ben Hutchings
I haven't lost my mind; it's backed up on tape somewhere.

--=-uEo9IMLk7HXh9OYED5jn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAU0qQM+e/yOyVhhEJAQrh8Q/9HtlAcXk2lr+j8O4AL08JCY06YTDOj7Ma
4a6cd0Ab9YDZyS+22wk8LDGGIR9HI/4qrPnN7RcDxmCEkmyj/mLQfPQL4WiM/d/4
LsaX3U37uroe5WHC47iHjujmT8pjNvFershMQ3JMBB5XtQnr/UfTr0471cALJ+hu
Q2VN0T7J3vAfntm1+cvA+jEB380MnrvTND6ZtcJKcL0ETH9r+sWIgRUpmv7zL46D
SgCGX6aXnKBFXJ31e6JWkGNhwBr4gtEI2nHB0iGOcuEf40yfnzD3kOxI5GqNuv04
gx9N6cSItgPRClpODrssSfalbALagP1outB1LtYGjdLTxs97dyi18dcJOs3teE/y
DFBDvO8SWU1BGCp3ePe0fsrSHYMx/xqPEOqApoiof7rMjpWLsRC73vTypreXdUe6
VPKLsLuH7CCQhPD/WwKtTFIWpm5qDdmnpqdVbQSU9UVRRu5vPJq2ptdJVmuH+8na
kNl9ZtID2QRG2xRZY5BEvTqJiHlI5XNKxaP6gxXyU+L2a0PAA4v/dlkPfE+VvqG/
f4zwkq7bb5QuEKgEGgAwlNbmsO0asGP/5dXwblqJrtOSm1zH16IWajoYiVO5tB2A
OaVfaYgZrRs3KMuBk0DtLdHRny+Ve/EKLVFL5J5vTvxavnS1ywPyfzabjtSJZ5W+
snJVkFHyo+E=
=cCj6
-----END PGP SIGNATURE-----

--=-uEo9IMLk7HXh9OYED5jn--
