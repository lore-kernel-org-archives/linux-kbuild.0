Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36442 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727240AbeLEPky (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Dec 2018 10:40:54 -0500
Received: by mail-wm1-f67.google.com with SMTP id a18so13429068wmj.1
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Dec 2018 07:40:52 -0800 (PST)
Reply-To: monstr@monstr.eu
Subject: Re: [PATCH 2/7] microblaze: adjust the help to the real behavior
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-3-git-send-email-yamada.masahiro@socionext.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <80bf0f6e-8f1f-314e-b22d-6e786cf15e45@monstr.eu>
Date: Wed, 5 Dec 2018 16:40:46 +0100
MIME-Version: 1.0
In-Reply-To: <1543823457-32478-3-git-send-email-yamada.masahiro@socionext.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="RvVwhLGJR5KStavD1M5BS65DxOMkrsxrD"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RvVwhLGJR5KStavD1M5BS65DxOMkrsxrD
Content-Type: multipart/mixed; boundary="0TWQ9qg9x5W2c9yQU2nS8dvfBdZ2NwlMm";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <80bf0f6e-8f1f-314e-b22d-6e786cf15e45@monstr.eu>
Subject: Re: [PATCH 2/7] microblaze: adjust the help to the real behavior
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-3-git-send-email-yamada.masahiro@socionext.com>

--0TWQ9qg9x5W2c9yQU2nS8dvfBdZ2NwlMm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03. 12. 18 8:50, Masahiro Yamada wrote:
> "make ARCH=3Dmicroblaze help" mentions simpleImage.<dt>.unstrip,
> but it never works because Makefile assumes "system.unstrip" is
> the name of DT.
>=20
> $ make ARCH=3Dmicroblaze CROSS_COMPILE=3Dmicroblaze-linux- simpleImage.=
system.unstrip
>   [ snip ]
> make[1]: *** No rule to make target 'arch/microblaze/boot/dts/system.un=
strip.dtb', needed by 'arch/microblaze/boot/dts/system.dtb'.  Stop.
> make: *** [Makefile;1060: arch/microblaze/boot/dts] Error 2
> make: *** Waiting for unfinished jobs....
>=20
> Rip off the never-working target.
>=20
> In my understanding, simpleImage.<dt> works like a phony target that
> generates multiple images. Reflect the behavior to the help message.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
>  arch/microblaze/Makefile | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
> index 0823d29..97e1384 100644
> --- a/arch/microblaze/Makefile
> +++ b/arch/microblaze/Makefile
> @@ -89,9 +89,7 @@ define archhelp
>    echo '* linux.bin    - Create raw binary'
>    echo '  linux.bin.gz - Create compressed raw binary'
>    echo '  linux.bin.ub - Create U-Boot wrapped raw binary'
> -  echo '  simpleImage.<dt> - ELF image with $(arch)/boot/dts/<dt>.dts =
linked in'
> -  echo '                   - stripped elf with fdt blob'
> -  echo '  simpleImage.<dt>.unstrip - full ELF image with fdt blob'
> +  echo '  simpleImage.<dt> - Create images with $(arch)/boot/dts/<dt>.=
dts linked in'
>    echo '  *_defconfig      - Select default config from arch/microblaz=
e/configs'
>    echo ''
>    echo '  Targets with <dt> embed a device tree blob inside the image'=

>=20

I understand what you are trying to say but I would still like to keep
information about unstrip file.
It is correct that it is not build target. It is just generated file and
message above was used for description what it is.
Definitely agree that this should be the part of targets but it should
be in description.
The same is for missing description for simpleImage.<dt>.strip and
simpleImage.<dt>.ub files.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs



--0TWQ9qg9x5W2c9yQU2nS8dvfBdZ2NwlMm--

--RvVwhLGJR5KStavD1M5BS65DxOMkrsxrD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlwH8X4ACgkQykllyylKDCE/EgCfdwk8ZvSbDnR0bg+6p7+pCprL
+4QAn2Fg2Mk9GMy8BR1PhSuGNeMUQBag
=PyP9
-----END PGP SIGNATURE-----

--RvVwhLGJR5KStavD1M5BS65DxOMkrsxrD--
