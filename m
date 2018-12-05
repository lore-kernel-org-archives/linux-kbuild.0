Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45904 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbeLEPlW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Dec 2018 10:41:22 -0500
Received: by mail-wr1-f65.google.com with SMTP id b14so6582948wru.12
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Dec 2018 07:41:20 -0800 (PST)
Reply-To: monstr@monstr.eu
Subject: Re: [PATCH 1/7] microblaze: fix cleaning of boot images
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-2-git-send-email-yamada.masahiro@socionext.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <0e57c216-c85c-9cd4-7922-e4509e44858c@monstr.eu>
Date: Wed, 5 Dec 2018 16:41:13 +0100
MIME-Version: 1.0
In-Reply-To: <1543823457-32478-2-git-send-email-yamada.masahiro@socionext.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="cKZX7aCx9mliA3OoshTchzirzkI9C2Ccx"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cKZX7aCx9mliA3OoshTchzirzkI9C2Ccx
Content-Type: multipart/mixed; boundary="pOgLeTpw6oQKJ9s6ogOZuw1JoPb1xy7PW";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <0e57c216-c85c-9cd4-7922-e4509e44858c@monstr.eu>
Subject: Re: [PATCH 1/7] microblaze: fix cleaning of boot images
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-2-git-send-email-yamada.masahiro@socionext.com>

--pOgLeTpw6oQKJ9s6ogOZuw1JoPb1xy7PW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03. 12. 18 8:50, Masahiro Yamada wrote:
> The simpleImage.<dt> target generates the following files:
>=20
>   arch/microblaze/boot/simpleImage.<dt>
>   arch/microblaze/boot/simpleImage.<dt>.ub
>   arch/microblaze/boot/simpleImage.<dt>.strip
>   arch/microblaze/boot/simpleImage.<dt>.unstrip
>=20
> However, "make ARCH=3Dmicroblaze clean" only cleans up the unstrip
> image. Fix the clean-files to take care of all the four.
>=20
> Adding linux.bin.ub to clean-files is redundant because it is
> already added into "targets".
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
>  arch/microblaze/boot/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/microblaze/boot/Makefile b/arch/microblaze/boot/Makef=
ile
> index 600e5a1..e8684a2 100644
> --- a/arch/microblaze/boot/Makefile
> +++ b/arch/microblaze/boot/Makefile
> @@ -37,4 +37,4 @@ $(obj)/simpleImage.%: vmlinux FORCE
>  	$(call if_changed,strip,.strip)
>  	@echo 'Kernel: $(UIMAGE_OUT) is ready' ' (#'`cat .version`')'
> =20
> -clean-files +=3D simpleImage.*.unstrip linux.bin.ub
> +clean-files +=3D simpleImage.*
>=20

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs



--pOgLeTpw6oQKJ9s6ogOZuw1JoPb1xy7PW--

--cKZX7aCx9mliA3OoshTchzirzkI9C2Ccx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlwH8ZkACgkQykllyylKDCGUaACeL0gfOxjRY+CCCb1pHuzBHccA
bVIAn1cQmBlttPk8lQMzk/44xCp/oDNn
=mdOg
-----END PGP SIGNATURE-----

--cKZX7aCx9mliA3OoshTchzirzkI9C2Ccx--
