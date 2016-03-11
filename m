Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:35922 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935419AbcCKItJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Mar 2016 03:49:09 -0500
Subject: Re: [PATCH] Fixed 1 multiple equals checkpatch warning.
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Content-Type: multipart/signed; boundary="Apple-Mail=_75D220C9-CAEE-463B-A6C1-11D81150BADB"; protocol="application/pgp-signature"; micalg=pgp-sha512
From: Parth Sane <laerdevstudios@gmail.com>
In-Reply-To: <1457685829-7018-1-git-send-email-laerdevstudios@gmail.com>
Date: Fri, 11 Mar 2016 14:19:00 +0530
Message-Id: <E9C3EC11-24FC-47CC-82AA-D2790492669A@gmail.com>
References: <1457685829-7018-1-git-send-email-laerdevstudios@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--Apple-Mail=_75D220C9-CAEE-463B-A6C1-11D81150BADB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,
Please ignore the previous patch. I=E2=80=99ll be sending in one soon =
again since the earlier one sent more warning. Apologies for any =
inconvenience.
Regards,
Parth Sane
> On 11-Mar-2016, at 2:13 PM, laerdevstudios@gmail.com wrote:
>=20
> From: Parth Sane <laerdevstudios@gmail.com>
>=20
> diff --git a/drivers/staging/netlogic/platform_net.c =
b/drivers/staging/netlogic/platform_net.c
> index 7806c2b..de2c3cb 100644
> --- a/drivers/staging/netlogic/platform_net.c
> +++ b/drivers/staging/netlogic/platform_net.c
> @@ -86,7 +86,8 @@ static void xlr_resource_init(struct resource *res, =
int offset, int irq)
>=20
> 	res++;
> 	res->name =3D "gmac";
> -	res->start =3D res->end =3D irq;
> +	res->end =3D irq;
> +        res->start =3D res->end;
> 	res->flags =3D IORESOURCE_IRQ;
> }
>=20
> --
> 2.1.4
>=20


--Apple-Mail=_75D220C9-CAEE-463B-A6C1-11D81150BADB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW4oZ9AAoJEOzxm4XTqyFibIsP/000a5lkH7ew1PRpWAHPwHIM
30eBDm8OvaE+OqyQ7pGp/1ZSjbquauYbyDp39QsmLtdKNuTIUQwb37BQh/MUMVWc
8l+Il0byndUFOyY3W9C4n6qMhvJ6FYO/YM2CFg73tT9G2X6FemYsHaWLFyvMltb6
Nv0C8wmmHbguxXC18Kj0aO+BXBMugrlpxL8hypR0a/mEhvfte3yzfNGd3uIztk0s
WlO6CGrROWVsqU3mOlXKKSGG7KvBJnbpw15OxLHWRbkuNE5hSYF+TSpg9Tksv1vr
7ahBjVMObdC64GHnWfqRcEBvj5bcRCm9JmRgf+pLdkQRVe37eCcdhg0eX97dqMeS
e+zrEsrBTS0pVdQe1xb4XMnOvcaZnQxD5ZE2X3bZfPEZ30uY0hLbm1cABEvQ+4ro
rdIO8HAE060NHK6mRWskWsHr6LzaPVoJoJJedU616/VSYw3NYe3L6N6WTHZb5jsv
M/RJ4csW3uUyLjjeSh3OcIjt9Sw9eIhK9PKd97iSqzUiKVNHyXGfz/gZtOlOj4Bk
wYbtOUfls63Mbjo+ocCtMxDINZ0b2yPwukJoyP2aK5JHlicur7i9556GVyPwVGcL
6hzWEicIceyGV98pjgGda5bkaytzv2JyDtkVPNcKndINuaNCK1jAg/s5lkS+7KMm
yG1A31beu+XaWaJrl+fl
=gYnH
-----END PGP SIGNATURE-----

--Apple-Mail=_75D220C9-CAEE-463B-A6C1-11D81150BADB--
