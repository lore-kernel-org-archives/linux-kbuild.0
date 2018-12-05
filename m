Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34336 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbeLEP77 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Dec 2018 10:59:59 -0500
Received: by mail-wm1-f65.google.com with SMTP id y185so12096416wmd.1
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Dec 2018 07:59:58 -0800 (PST)
Reply-To: monstr@monstr.eu
Subject: Re: [PATCH 5/7] microblaze: add linux.bin* and simpleImage.* to PHONY
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-6-git-send-email-yamada.masahiro@socionext.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <c3717811-87a4-ab24-6640-056bc3c8a77a@monstr.eu>
Date: Wed, 5 Dec 2018 16:59:52 +0100
MIME-Version: 1.0
In-Reply-To: <1543823457-32478-6-git-send-email-yamada.masahiro@socionext.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="uyCVXhwLCEOvIEONP6Ia7tsWex3mhiKOc"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uyCVXhwLCEOvIEONP6Ia7tsWex3mhiKOc
Content-Type: multipart/mixed; boundary="leWRSohRb4VxEz7A6urp6hzKox5qpLkPr";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <c3717811-87a4-ab24-6640-056bc3c8a77a@monstr.eu>
Subject: Re: [PATCH 5/7] microblaze: add linux.bin* and simpleImage.* to PHONY
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-6-git-send-email-yamada.masahiro@socionext.com>

--leWRSohRb4VxEz7A6urp6hzKox5qpLkPr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03. 12. 18 8:50, Masahiro Yamada wrote:
> linux.bin, linux.bin.gz, and linux.bin.ub are phony targets to
> generate a corresponding image under arch/microblaze/boot/.
>=20
> simpleImage.% also works like a PHONY target, but a pattern that
> contains '%' cannot be a PHONY target. I renamed it to equivalent
> simpleImage.$(DTB).
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
>  arch/microblaze/Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
> index c5d5b0e..7a5df02 100644
> --- a/arch/microblaze/Makefile
> +++ b/arch/microblaze/Makefile
> @@ -79,11 +79,13 @@ all: linux.bin
>  archclean:
>  	$(Q)$(MAKE) $(clean)=3D$(boot)
> =20
> +PHONY +=3D linux.bin linux.bin.gz linux.bin.ub
>  linux.bin linux.bin.gz linux.bin.ub: vmlinux
>  	$(Q)$(MAKE) $(build)=3D$(boot) $(boot)/$@
>  	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
> =20
> -simpleImage.%: vmlinux
> +PHONY +=3D simpleImage.$(DTB)
> +simpleImage.$(DTB): vmlinux
>  	$(Q)$(MAKE) $(build)=3D$(boot) simple_images
>  	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
> =20
>=20

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs



--leWRSohRb4VxEz7A6urp6hzKox5qpLkPr--

--uyCVXhwLCEOvIEONP6Ia7tsWex3mhiKOc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlwH9fgACgkQykllyylKDCFX4QCgj+2iYBi8MuKZ/y/c6hoa8ImI
eSIAn2BJ/U1Px8ydCqoYpHTgLcDhTHgY
=nXPn
-----END PGP SIGNATURE-----

--uyCVXhwLCEOvIEONP6Ia7tsWex3mhiKOc--
