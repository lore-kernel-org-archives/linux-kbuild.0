Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37919 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730944AbeLFOow (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Dec 2018 09:44:52 -0500
Received: by mail-wr1-f66.google.com with SMTP id v13so748969wrw.5
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Dec 2018 06:44:51 -0800 (PST)
Reply-To: monstr@monstr.eu
Subject: Re: [PATCH 0/7] microblaze: fix various problems in building boot
 images
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <19c7bdab-8df8-f7c6-7921-9a4d43dbca64@monstr.eu>
Date: Thu, 6 Dec 2018 15:44:43 +0100
MIME-Version: 1.0
In-Reply-To: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="UP8ZW8Nv7kiW1DZP44Zi1z8HAdOAL0H6o"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UP8ZW8Nv7kiW1DZP44Zi1z8HAdOAL0H6o
Content-Type: multipart/mixed; boundary="lV6F0GdKRGkgCXZZwIqBeKMUFRsl7PH7E";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>
Message-ID: <19c7bdab-8df8-f7c6-7921-9a4d43dbca64@monstr.eu>
Subject: Re: [PATCH 0/7] microblaze: fix various problems in building boot
 images
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>

--lV6F0GdKRGkgCXZZwIqBeKMUFRsl7PH7E
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03. 12. 18 8:50, Masahiro Yamada wrote:
> This patch set fixes various issues in microblaze Makefiles.
>=20
> BTW, "simpleImage.<dt>" works like a phony target to generate the
> following four images, where the first three are just aliases.
>=20
>  - arch/microblaze/boot/simpleImage.<dt>:
>          identical to arch/microblaze/boot/linux.bin
>=20
>  - arch/microblaze/boot/simpleImage.<dt>.unstrip:
>          identical to vmlinux
>=20
>  - arch/microblaze/boot/simpleImage.<dt>.ub:
>          identical to arch/microblaze/boot/linux.bin.ub
>=20
>  - arch/microblaze/boot/simpleImage.<dt>.strip:
>          stripped vmlinux
>=20
> I am not sure how much useful those copies are,
> but, I tried my best to keep the same behavior.
>=20
> IMHO, I guess DTB=3D<dt> would be more sensible,
> but it is up to Michal.
>=20
>=20
>=20
> Masahiro Yamada (7):
>   microblaze: fix cleaning of boot images
>   microblaze: adjust the help to the real behavior
>   microblaze: move "... is ready" message to arch/microblaze/Makefile
>   microblaze: fix multiple bugs in arch/microblaze/boot/Makefile
>   microblaze: add linux.bin* and simpleImage.* to PHONY
>   microblaze: fix race condition in building boot images
>   microblaze: remove the unneeded code just in case file copy fails
>=20
>  arch/microblaze/Makefile          | 14 +++++++++-----
>  arch/microblaze/boot/Makefile     | 33 +++++++++++++++++--------------=
--
>  arch/microblaze/boot/dts/Makefile |  5 +----
>  3 files changed, 27 insertions(+), 25 deletions(-)
>=20

One more thing I have in my mind for a while is that will be good to
configure kernel build flags from DT and completely get rid of these
symbols.

XILINX_MICROBLAZE0_USE_MSR_INSTR
XILINX_MICROBLAZE0_USE_PCMP_INSTR
XILINX_MICROBLAZE0_USE_BARREL
XILINX_MICROBLAZE0_USE_DIV
XILINX_MICROBLAZE0_USE_HW_MUL
XILINX_MICROBLAZE0_USE_FPU

It means setup CPUFLAGS based on extracting that values from DT that it
all the time match the hardware.
It will also simplify all the CPUFLAGS logic which is in
arch/microblaze/Makefile.

Do you have any idea how this can be done?

(I have the same issue in U-Boot too)

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs



--lV6F0GdKRGkgCXZZwIqBeKMUFRsl7PH7E--

--UP8ZW8Nv7kiW1DZP44Zi1z8HAdOAL0H6o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlwJNdsACgkQykllyylKDCGXHwCeMRhtfvZHX8Izhg7CVUrZYzSs
3hkAoJrNgHbAe/LP7naopXGcHGixk/HB
=yW57
-----END PGP SIGNATURE-----

--UP8ZW8Nv7kiW1DZP44Zi1z8HAdOAL0H6o--
