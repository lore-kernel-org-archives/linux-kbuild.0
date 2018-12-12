Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37675 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbeLLI3H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Dec 2018 03:29:07 -0500
Received: by mail-wr1-f67.google.com with SMTP id j10so16716845wru.4
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Dec 2018 00:29:05 -0800 (PST)
Reply-To: monstr@monstr.eu
Subject: Re: [PATCH 20/27] microblaze: surround string default in Kconfig with
 double quotes
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
 <1544526070-16690-21-git-send-email-yamada.masahiro@socionext.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <d4de3285-b569-69cd-a71b-c09e4028869e@monstr.eu>
Date: Wed, 12 Dec 2018 09:28:06 +0100
MIME-Version: 1.0
In-Reply-To: <1544526070-16690-21-git-send-email-yamada.masahiro@socionext.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="F53LwevuHawLj3HbHSwU27BjJC7WOjZzt"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--F53LwevuHawLj3HbHSwU27BjJC7WOjZzt
Content-Type: multipart/mixed; boundary="j9XQHLvf8yQYOTrRWtOHQGyXfVt2DSoWr";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org
Message-ID: <d4de3285-b569-69cd-a71b-c09e4028869e@monstr.eu>
Subject: Re: [PATCH 20/27] microblaze: surround string default in Kconfig with
 double quotes
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
 <1544526070-16690-21-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-21-git-send-email-yamada.masahiro@socionext.com>

--j9XQHLvf8yQYOTrRWtOHQGyXfVt2DSoWr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11. 12. 18 12:01, Masahiro Yamada wrote:
> I guess this is a constant value instead of a symbol.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
> I will apply this to my Kbuild tree
> because it is necessary for Kconfig clean-ups.
>=20
>=20
>  arch/microblaze/Kconfig.platform | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/microblaze/Kconfig.platform b/arch/microblaze/Kconfig=
=2Eplatform
> index f7f1739..7361974 100644
> --- a/arch/microblaze/Kconfig.platform
> +++ b/arch/microblaze/Kconfig.platform
> @@ -65,6 +65,6 @@ config XILINX_MICROBLAZE0_USE_FPU
> =20
>  config XILINX_MICROBLAZE0_HW_VER
>  	string "Core version number"
> -	default 7.10.d
> +	default "7.10.d"
> =20
>  endmenu
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



--j9XQHLvf8yQYOTrRWtOHQGyXfVt2DSoWr--

--F53LwevuHawLj3HbHSwU27BjJC7WOjZzt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlwQxsoACgkQykllyylKDCHYhgCfe0gw7pUM5kdqKq0N0mCnN51Z
S34AoJT13XvCzjgRswWbrQFASfra3nLI
=1rv2
-----END PGP SIGNATURE-----

--F53LwevuHawLj3HbHSwU27BjJC7WOjZzt--
