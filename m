Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:51682 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754338AbaDMN0K (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Apr 2014 09:26:10 -0400
Message-ID: <1397395563.10849.79.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH v2 1/1] builddeb: add arm64 in the supported
 architectures
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 13 Apr 2014 14:26:03 +0100
In-Reply-To: <1397307186-3977-2-git-send-email-fathi.boudra@linaro.org>
References: <1397307186-3977-1-git-send-email-fathi.boudra@linaro.org>
	 <1397307186-3977-2-git-send-email-fathi.boudra@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Rg7GMFj8kLdOhvWftUmR"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Maximilian Attems <maks@debian.org>


--=-Rg7GMFj8kLdOhvWftUmR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2014-04-12 at 15:53 +0300, Fathi Boudra wrote:
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>

Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

> ---
>  scripts/package/builddeb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index f46e4dd..0bf29a6 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -42,6 +42,8 @@ create_package() {
>  		debarch=3Dhppa ;;
>  	mips*)
>  		debarch=3Dmips$(grep -q CPU_LITTLE_ENDIAN=3Dy $KCONFIG_CONFIG && echo =
el || true) ;;
> +	arm64)
> +		debarch=3Darm64 ;;
>  	arm*)
>  		debarch=3Darm$(grep -q CONFIG_AEABI=3Dy $KCONFIG_CONFIG && echo el || =
true) ;;
>  	*)

--=20
Ben Hutchings
I haven't lost my mind; it's backed up on tape somewhere.

--=-Rg7GMFj8kLdOhvWftUmR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAU0qQa+e/yOyVhhEJAQpzNxAAnszi429l6u6DZ0dbYPzigw4QbW701W/N
2ZDRnF51kH9Y+onUipanwKGKLu48Os44JQUZQIz3bn+LhhvmgLWJdoR1BpQc83HP
DUhlTs+3Mltp9kAoRFw4qghQF4fJ9Ttz42eJaE6WGwaO7bBD71qXOIhAWWYXWu2s
jdnc3KaETz8ichfrz4tUVFn+acuz5uslwCiazj9MDrg4NXZnVA9UPCf6pX6M05IR
KlAAt1ahGbzChNvvvfLV9x5ZdDxAPkcdMJD4Xuxv6HE0AtWgq1RWNVDBoiJJgXqK
OUS2jFabAEtbwzlivkxbg980opiMp226yQl6XXA1S8iG5ACbWHGxfFIYJNlTAjve
ZhMUNVDsItsfLOBe+ZENXrMom/j05WceGPBYYLu6f5QhSHYu//1a2/2sInLxXt0P
OIG2l+gZQ5w+VBB6w/5pTm9H0WGZNO8h39qroPjsVi1giIwOv0n/zTWc8/fYpLEZ
1vOsPd1KLZxkPLq5Clkab9LTkCGENbkbqM41P/UvqptY2Dxb13T3aQytMzi/S9q8
gqKFWK2mCW404j2Yx5dlgeuLVAE5O9ZUG1AvmctqrwCZQWLXsUHcUdr2rFQdjOEV
ZJCyZk05JAqZbACisNi0+EXmxQnusL8VGTFrRXVu077NOnwnz9BCbIuVPYI4c28O
JWAbTJTn9Xk=
=M0zP
-----END PGP SIGNATURE-----

--=-Rg7GMFj8kLdOhvWftUmR--
