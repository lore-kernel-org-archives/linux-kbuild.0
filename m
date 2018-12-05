Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43812 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727182AbeLEQb1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Dec 2018 11:31:27 -0500
Received: by mail-wr1-f65.google.com with SMTP id r10so20321052wrs.10
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Dec 2018 08:31:24 -0800 (PST)
Reply-To: monstr@monstr.eu
Subject: Re: [PATCH 6/7] microblaze: fix race condition in building boot
 images
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-7-git-send-email-yamada.masahiro@socionext.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <ccf309af-f225-2c12-cb2f-1d8787d2e4fa@monstr.eu>
Date: Wed, 5 Dec 2018 17:31:18 +0100
MIME-Version: 1.0
In-Reply-To: <1543823457-32478-7-git-send-email-yamada.masahiro@socionext.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="QRafftiq0Vg7iGvJt1D24yW8ozuMu91fx"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QRafftiq0Vg7iGvJt1D24yW8ozuMu91fx
Content-Type: multipart/mixed; boundary="Q6imD8n9iDhX8BsH7vgVDGbfVKg7OPN2c";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <ccf309af-f225-2c12-cb2f-1d8787d2e4fa@monstr.eu>
Subject: Re: [PATCH 6/7] microblaze: fix race condition in building boot
 images
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-7-git-send-email-yamada.masahiro@socionext.com>

--Q6imD8n9iDhX8BsH7vgVDGbfVKg7OPN2c
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03. 12. 18 8:50, Masahiro Yamada wrote:
> I fixed a race condition in the parallel building of ARM in commit
> 3939f3345050 ("ARM: 8418/1: add boot image dependencies to not
> generate invalid images").
>=20
> I see the same problem for MicroBlaze too.
>=20
> "make -j<N> ARCH=3Dmicroblaze all linux.bin.ub" results in a broken bui=
ld
> since two threads descend into arch/microblaze/boot simultaneously.

I see also different problem that when I run that make above
linux.bin.ub is not generated at all.


>=20
> Add proper dependencies to avoid it.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
>  arch/microblaze/Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
> index 7a5df02..544796d 100644
> --- a/arch/microblaze/Makefile
> +++ b/arch/microblaze/Makefile
> @@ -79,13 +79,15 @@ all: linux.bin
>  archclean:
>  	$(Q)$(MAKE) $(clean)=3D$(boot)
> =20
> +linux.bin.ub linux.bin.gz: linux.bin
> +
>  PHONY +=3D linux.bin linux.bin.gz linux.bin.ub
>  linux.bin linux.bin.gz linux.bin.ub: vmlinux
>  	$(Q)$(MAKE) $(build)=3D$(boot) $(boot)/$@
>  	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
> =20
>  PHONY +=3D simpleImage.$(DTB)
> -simpleImage.$(DTB): vmlinux
> +simpleImage.$(DTB): linux.bin.ub

It looks weird that simpleImage requires linux.bin.ub.
Is it really linux.bin.ub here or just linux.bin?

>  	$(Q)$(MAKE) $(build)=3D$(boot) simple_images
>  	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
> =20
>=20


Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs



--Q6imD8n9iDhX8BsH7vgVDGbfVKg7OPN2c--

--QRafftiq0Vg7iGvJt1D24yW8ozuMu91fx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlwH/VYACgkQykllyylKDCGrMgCfQxhQUBclDm5RzrFGGQRzQLE9
BlsAnRxVOqJZCpD41urBkFUoh8S3aKTa
=56rY
-----END PGP SIGNATURE-----

--QRafftiq0Vg7iGvJt1D24yW8ozuMu91fx--
