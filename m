Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35226 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbeLEQd7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Dec 2018 11:33:59 -0500
Received: by mail-wm1-f68.google.com with SMTP id c126so13532640wmh.0
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Dec 2018 08:33:56 -0800 (PST)
Reply-To: monstr@monstr.eu
Subject: Re: [PATCH 7/7] microblaze: remove the unneeded code just in case
 file copy fails
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-8-git-send-email-yamada.masahiro@socionext.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <ed259512-5c34-45cd-22ec-38d64ce5e493@monstr.eu>
Date: Wed, 5 Dec 2018 17:33:49 +0100
MIME-Version: 1.0
In-Reply-To: <1543823457-32478-8-git-send-email-yamada.masahiro@socionext.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="VC9lh3RBMYJ2PxrENLn0X9aXZwr1h8zaG"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VC9lh3RBMYJ2PxrENLn0X9aXZwr1h8zaG
Content-Type: multipart/mixed; boundary="N41fux6WkqnwveAuf85T0cgflK5D3IJYe";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
Message-ID: <ed259512-5c34-45cd-22ec-38d64ce5e493@monstr.eu>
Subject: Re: [PATCH 7/7] microblaze: remove the unneeded code just in case
 file copy fails
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-8-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-8-git-send-email-yamada.masahiro@socionext.com>

--N41fux6WkqnwveAuf85T0cgflK5D3IJYe
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03. 12. 18 8:50, Masahiro Yamada wrote:
> I guess
>=20
>     || (rm -f $@ && echo false)
>=20
> ... should be
>=20
>     || (rm -f $@ && false)
>=20
> since printing the string "false" on the console has no point.
>=20
> Moreover, no Makefile needs to delete a target on error explicitly
> since commit 9c2af1c7377a ("kbuild: add .DELETE_ON_ERROR special
> target").
>=20
> Reuse equivalent cmd_shipped from scripts/Makefile.lib.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
>  arch/microblaze/boot/dts/Makefile | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/arch/microblaze/boot/dts/Makefile b/arch/microblaze/boot/d=
ts/Makefile
> index c7324e7..ef00dd3 100644
> --- a/arch/microblaze/boot/dts/Makefile
> +++ b/arch/microblaze/boot/dts/Makefile
> @@ -12,12 +12,9 @@ $(obj)/linked_dtb.o: $(obj)/system.dtb
>  # Generate system.dtb from $(DTB).dtb
>  ifneq ($(DTB),system)
>  $(obj)/system.dtb: $(obj)/$(DTB).dtb
> -	$(call if_changed,cp)
> +	$(call if_changed,shipped)
>  endif
>  endif
> =20
> -quiet_cmd_cp =3D CP      $< $@$2
> -	cmd_cp =3D cat $< >$@$2 || (rm -f $@ && echo false)
> -
>  # Rule to build device tree blobs
>  DTC_FLAGS :=3D -p 1024
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



--N41fux6WkqnwveAuf85T0cgflK5D3IJYe--

--VC9lh3RBMYJ2PxrENLn0X9aXZwr1h8zaG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlwH/e0ACgkQykllyylKDCFEFgCglgigA6xbCkCzVbb4ca3lXf3x
VGwAn3G9GGsi35LX72UIF44MX2rTBoCi
=zclB
-----END PGP SIGNATURE-----

--VC9lh3RBMYJ2PxrENLn0X9aXZwr1h8zaG--
