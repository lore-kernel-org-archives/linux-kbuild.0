Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35000 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728648AbeLFMxE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Dec 2018 07:53:04 -0500
Received: by mail-wr1-f68.google.com with SMTP id 96so404428wrb.2
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Dec 2018 04:53:01 -0800 (PST)
Reply-To: monstr@monstr.eu
Subject: Re: [PATCH 2/7] microblaze: adjust the help to the real behavior
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-3-git-send-email-yamada.masahiro@socionext.com>
 <80bf0f6e-8f1f-314e-b22d-6e786cf15e45@monstr.eu>
 <CAK7LNAQBFfaJbFXf5h9LX689RUwA4kSeqPrimVOWDWq0XAVJ_Q@mail.gmail.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <c8283f39-2d68-f7f7-82ee-c0da75755e5b@monstr.eu>
Date: Thu, 6 Dec 2018 13:52:49 +0100
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQBFfaJbFXf5h9LX689RUwA4kSeqPrimVOWDWq0XAVJ_Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="XhLnlO5rQel1C0IKrmcNm3vvWto4s6IIa"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XhLnlO5rQel1C0IKrmcNm3vvWto4s6IIa
Content-Type: multipart/mixed; boundary="4s1YDqlLOFzzUUEdBjGQo53mcbR8Op90C";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michal Simek <michal.simek@xilinx.com>
Message-ID: <c8283f39-2d68-f7f7-82ee-c0da75755e5b@monstr.eu>
Subject: Re: [PATCH 2/7] microblaze: adjust the help to the real behavior
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-3-git-send-email-yamada.masahiro@socionext.com>
 <80bf0f6e-8f1f-314e-b22d-6e786cf15e45@monstr.eu>
 <CAK7LNAQBFfaJbFXf5h9LX689RUwA4kSeqPrimVOWDWq0XAVJ_Q@mail.gmail.com>
In-Reply-To: <CAK7LNAQBFfaJbFXf5h9LX689RUwA4kSeqPrimVOWDWq0XAVJ_Q@mail.gmail.com>

--4s1YDqlLOFzzUUEdBjGQo53mcbR8Op90C
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06. 12. 18 6:27, Masahiro Yamada wrote:
> Hi Michal,
>=20
> On Thu, Dec 6, 2018 at 12:41 AM Michal Simek <monstr@monstr.eu> wrote:
>>
>> On 03. 12. 18 8:50, Masahiro Yamada wrote:
>>> "make ARCH=3Dmicroblaze help" mentions simpleImage.<dt>.unstrip,
>>> but it never works because Makefile assumes "system.unstrip" is
>>> the name of DT.
>>>
>>> $ make ARCH=3Dmicroblaze CROSS_COMPILE=3Dmicroblaze-linux- simpleImag=
e.system.unstrip
>>>   [ snip ]
>>> make[1]: *** No rule to make target 'arch/microblaze/boot/dts/system.=
unstrip.dtb', needed by 'arch/microblaze/boot/dts/system.dtb'.  Stop.
>>> make: *** [Makefile;1060: arch/microblaze/boot/dts] Error 2
>>> make: *** Waiting for unfinished jobs....
>>>
>>> Rip off the never-working target.
>>>
>>> In my understanding, simpleImage.<dt> works like a phony target that
>>> generates multiple images. Reflect the behavior to the help message.
>>>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> ---
>>>
>>>  arch/microblaze/Makefile | 4 +---
>>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
>>> index 0823d29..97e1384 100644
>>> --- a/arch/microblaze/Makefile
>>> +++ b/arch/microblaze/Makefile
>>> @@ -89,9 +89,7 @@ define archhelp
>>>    echo '* linux.bin    - Create raw binary'
>>>    echo '  linux.bin.gz - Create compressed raw binary'
>>>    echo '  linux.bin.ub - Create U-Boot wrapped raw binary'
>>> -  echo '  simpleImage.<dt> - ELF image with $(arch)/boot/dts/<dt>.dt=
s linked in'
>>> -  echo '                   - stripped elf with fdt blob'
>>> -  echo '  simpleImage.<dt>.unstrip - full ELF image with fdt blob'
>>> +  echo '  simpleImage.<dt> - Create images with $(arch)/boot/dts/<dt=
>.dts linked in'
>>>    echo '  *_defconfig      - Select default config from arch/microbl=
aze/configs'
>>>    echo ''
>>>    echo '  Targets with <dt> embed a device tree blob inside the imag=
e'
>>>
>>
>> I understand what you are trying to say but I would still like to keep=

>> information about unstrip file.
>> It is correct that it is not build target. It is just generated file a=
nd
>> message above was used for description what it is.
>> Definitely agree that this should be the part of targets but it should=

>> be in description.
>> The same is for missing description for simpleImage.<dt>.strip and
>> simpleImage.<dt>.ub files.
>>
>> Thanks,
>> Michal
>>
>=20
> If we want to be precise to the current behavior,
> we could describe more.
> (Is it too much?)
>=20
>=20
> Architecture specific targets (microblaze):
> * linux.bin    - Create raw binary
>   linux.bin.gz - Create compressed raw binary
>   linux.bin.ub - Create U-Boot wrapped raw binary
>   simpleImage.<dt> - Create the following images with
> arch/macroblaze/boot/dts/<dt>.dts linked in

type - microblaze
maybe <dtb> here.

>                      simpleImage.<dt>        : raw image
>                      simpleImage.<dt>.ub     : raw image with U-Boot he=
ader
>                      simpleImage.<dt>.unstrip: ELF (identical to vmlinu=
x)
>                      simpleImage.<dt>.strip  : stripped ELF
>   *_defconfig      - Select default config from arch/microblaze/configs=

>=20
>=20
>=20
>=20
> If you want to modify as you like,
> I will not touch it though.

what you have above is fine for me.

>=20
>=20
>=20
>=20
>=20
> BTW, "make ARCH=3Dmicroblaze help" looks like follows:
>=20
> * linux.bin    - Create raw binary
>   linux.bin.gz - Create compressed raw binary
>   linux.bin.ub - Create U-Boot wrapped raw binary
>   simpleImage.<dt> - ELF image with /boot/dts/<dt>.dts linked in
>                    - stripped elf with fdt blob
>   simpleImage.<dt>.unstrip - full ELF image with fdt blob
>   *_defconfig      - Select default config from arch/microblaze/configs=

>=20
>=20
>=20
>=20
> Since "arch" is not set anywhere, $(arch) is empty,
> "ELF image with /boot/dts/<dt>.dts linked in" looks strange.

As I said good to fix it in a way you have above.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs



--4s1YDqlLOFzzUUEdBjGQo53mcbR8Op90C--

--XhLnlO5rQel1C0IKrmcNm3vvWto4s6IIa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlwJG6UACgkQykllyylKDCFG0wCdFaOySdaGtiKgunnsBtCKqcRa
4twAn17bVP52XUKPS4xARzOsfE25hF8+
=NNt/
-----END PGP SIGNATURE-----

--XhLnlO5rQel1C0IKrmcNm3vvWto4s6IIa--
