Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55590 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbeLEQlK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Dec 2018 11:41:10 -0500
Received: by mail-wm1-f66.google.com with SMTP id y139so13903147wmc.5
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Dec 2018 08:41:09 -0800 (PST)
Reply-To: monstr@monstr.eu
Subject: Re: [PATCH 0/7] microblaze: fix various problems in building boot
 images
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <dd726c23-7c37-2b38-5b9f-a4edc391511d@monstr.eu>
Date: Wed, 5 Dec 2018 17:41:01 +0100
MIME-Version: 1.0
In-Reply-To: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="svNOVL13q6FxCdhSHHW6hgLU8MdLu4uy6"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--svNOVL13q6FxCdhSHHW6hgLU8MdLu4uy6
Content-Type: multipart/mixed; boundary="MSVYFBXQIqseltohcSuoSjzf0VJrIOtDM";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Message-ID: <dd726c23-7c37-2b38-5b9f-a4edc391511d@monstr.eu>
Subject: Re: [PATCH 0/7] microblaze: fix various problems in building boot
 images
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>

--MSVYFBXQIqseltohcSuoSjzf0VJrIOtDM
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

It is not - fdt section should be empty.
simpleImage has this section filled.

>=20
>  - arch/microblaze/boot/simpleImage.<dt>.unstrip:
>          identical to vmlinux

The same here with filled section.

>=20
>  - arch/microblaze/boot/simpleImage.<dt>.ub:
>          identical to arch/microblaze/boot/linux.bin.ub

as above.

>=20
>  - arch/microblaze/boot/simpleImage.<dt>.strip:
>          stripped vmlinux

And this is there because unstrip version is quite huge and for early
issues you need to know only some symbols that's why debugger is not
overflow with stuff which none needs.
Maybe this is not an issue now but that strip version is used a lot.


>=20
> I am not sure how much useful those copies are,
> but, I tried my best to keep the same behavior.
>=20
> IMHO, I guess DTB=3D<dt> would be more sensible,
> but it is up to Michal.

What do you mean by this exactly?

Definitely thanks for looking at this.
Michal



--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs



--MSVYFBXQIqseltohcSuoSjzf0VJrIOtDM--

--svNOVL13q6FxCdhSHHW6hgLU8MdLu4uy6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlwH/54ACgkQykllyylKDCEAqgCfR9/DxCsXl6NlRGgU9JZ31euK
5zoAn17ir1wuoX67oPoeL52wjTf5mTXt
=jAbi
-----END PGP SIGNATURE-----

--svNOVL13q6FxCdhSHHW6hgLU8MdLu4uy6--
