Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:32888 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750762AbcCKJSx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Mar 2016 04:18:53 -0500
Subject: Re: [PATCH] staging: netlogic: removed 1 multiple assignment checkpatch warning
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Content-Type: multipart/signed; boundary="Apple-Mail=_CE95EFA3-9BFE-461A-AEC9-E5F6AB16B9B4"; protocol="application/pgp-signature"; micalg=pgp-sha512
From: Parth Sane <laerdevstudios@gmail.com>
In-Reply-To: <1457687719-8057-1-git-send-email-laerdevstudios@gmail.com>
Date: Fri, 11 Mar 2016 14:48:46 +0530
Message-Id: <959D407C-EA01-48D6-B183-C6FB52EC5335@gmail.com>
References: <1457687719-8057-1-git-send-email-laerdevstudios@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--Apple-Mail=_CE95EFA3-9BFE-461A-AEC9-E5F6AB16B9B4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,
I forgot to add the signed off part in the patch please ignore the =
previous patches I have sent. Please bear with a kernel newbie.
Regards,
Parth Sane
> On 11-Mar-2016, at 2:45 PM, laerdevstudios@gmail.com wrote:
>=20
> From: Parth Sane <laerdevstudios@gmail.com>
>=20
> diff --git a/drivers/staging/netlogic/platform_net.c =
b/drivers/staging/netlogic/platform_net.c
> index 7806c2b..daee1b2 100644
> --- a/drivers/staging/netlogic/platform_net.c
> +++ b/drivers/staging/netlogic/platform_net.c
> @@ -86,7 +86,8 @@ static void xlr_resource_init(struct resource *res, =
int offset, int irq)
>=20
> 	res++;
> 	res->name =3D "gmac";
> -	res->start =3D res->end =3D irq;
> +	res->end =3D irq;
> +	res->start =3D res->end;
> 	res->flags =3D IORESOURCE_IRQ;
> }
>=20
> --
> 2.1.4
>=20


--Apple-Mail=_CE95EFA3-9BFE-461A-AEC9-E5F6AB16B9B4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW4o13AAoJEOzxm4XTqyFiSOsP/AqqX7lWPPM4A0r/F3teabCG
HrGNTg1yY76xJOYNegu5E/tlJwgEC1BCPtLfLLJeT+Y43YKUlRPX57dPNea81LAJ
UDJEUy3S7jUBOtv/gHwz2Jjb09cEpt3E3+GyOSGLf743uQWceUHL7WI7xuke4n/L
SlgCsXXy2C8xPoA83E0hD6JvdsKyygruQAFAmx36+zl9K65TtJettHoOFG6Do6ms
x9D8FA89bt/Xinja3vgiFfvgr9gCGCb+sDgQF/wUbmP0WTOL3j+7kxmF86gr2WaC
gSghoYI0B02WP1mB3dWteCA5NFgNaLcDm75xeNHxL6r3by7p+YTrQEJ2V3R/t2RH
6gfwHyyHisFrGvCaaVKEUcpPMOUjHv2Uaw9vTIiK0YkAU4FqdnA+PlWxArCRs2Zu
eR1fmUDVvxo0ZgrpI64Ijs3WOVd/4K03vW5V7i7cwK1tT/pNlp5NIQBvzTsHFqtA
XKdrlSDkESBva3AIE6/nEcoZMLvPXVadELUaSFAJsYjoBvR9UUlbStbYYZFIMqju
evOA63IkXzCjmiNaklgC5bEf/eC3/J6pJuvY2k/BKnBcf6kSvi6rtEU999/FVwtC
9kD08dUU66WuHE01c52YWJcN4AXiinle+t25NRu+/7Bf7cIL2aICQmg5tB7WYk0l
F+xMYvFbVhYT1C3rrWpf
=2qQv
-----END PGP SIGNATURE-----

--Apple-Mail=_CE95EFA3-9BFE-461A-AEC9-E5F6AB16B9B4--
