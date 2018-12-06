Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39980 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729571AbeLFNJd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Dec 2018 08:09:33 -0500
Received: by mail-wr1-f67.google.com with SMTP id p4so424007wrt.7
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Dec 2018 05:09:31 -0800 (PST)
Reply-To: monstr@monstr.eu
Subject: Re: [PATCH 0/7] microblaze: fix various problems in building boot
 images
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <dd726c23-7c37-2b38-5b9f-a4edc391511d@monstr.eu>
 <CAK7LNARtiP2xnB3hK92QJ_GadnViCG7kxXW73RmjzQAxJM4GKQ@mail.gmail.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <8dd96009-976b-99a5-c8e5-8a2242a04371@monstr.eu>
Date: Thu, 6 Dec 2018 14:09:23 +0100
MIME-Version: 1.0
In-Reply-To: <CAK7LNARtiP2xnB3hK92QJ_GadnViCG7kxXW73RmjzQAxJM4GKQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="xVjJa22C8ZUdUVhqaibgSri8AbzwxfX5N"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xVjJa22C8ZUdUVhqaibgSri8AbzwxfX5N
Content-Type: multipart/mixed; boundary="q3oKDBuMMQBmesEffbWlXj9Y2IOPo3avY";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Message-ID: <8dd96009-976b-99a5-c8e5-8a2242a04371@monstr.eu>
Subject: Re: [PATCH 0/7] microblaze: fix various problems in building boot
 images
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <dd726c23-7c37-2b38-5b9f-a4edc391511d@monstr.eu>
 <CAK7LNARtiP2xnB3hK92QJ_GadnViCG7kxXW73RmjzQAxJM4GKQ@mail.gmail.com>
In-Reply-To: <CAK7LNARtiP2xnB3hK92QJ_GadnViCG7kxXW73RmjzQAxJM4GKQ@mail.gmail.com>

--q3oKDBuMMQBmesEffbWlXj9Y2IOPo3avY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 06. 12. 18 6:08, Masahiro Yamada wrote:
> Hi Michal,
>=20
> On Thu, Dec 6, 2018 at 1:41 AM Michal Simek <monstr@monstr.eu> wrote:
>>
>> On 03. 12. 18 8:50, Masahiro Yamada wrote:
>>> This patch set fixes various issues in microblaze Makefiles.
>>>
>>> BTW, "simpleImage.<dt>" works like a phony target to generate the
>>> following four images, where the first three are just aliases.
>>>
>>>  - arch/microblaze/boot/simpleImage.<dt>:
>>>          identical to arch/microblaze/boot/linux.bin
>>
>> It is not - fdt section should be empty.
>> simpleImage has this section filled.
>>
>>>
>>>  - arch/microblaze/boot/simpleImage.<dt>.unstrip:
>>>          identical to vmlinux
>>
>> The same here with filled section.
>=20
>=20
> vmlinux is built anyway
> for whatever target you are building.
>=20
> What is the point of making a copy of vmlinux?
> They are the same.
> You can confirm it by 'diff'
>=20
> $ export CROSS_COMPILE=3Dmicroblaze-linux-
> $ make ARCH=3Dmicroblaze  defconfig
> $ make -j8 ARCH=3Dmicroblaze   simpleImage.system
> $ diff arch/microblaze/boot/simpleImage.system.unstrip  vmlinux

I can't remember the reason for this. Maybe it was just a copy from
PowerPC which started to use this simpleImage format in past and MB just
copied it.

>>>
>>>  - arch/microblaze/boot/simpleImage.<dt>.ub:
>>>          identical to arch/microblaze/boot/linux.bin.ub
>>
>> as above.
>>
>>>
>>>  - arch/microblaze/boot/simpleImage.<dt>.strip:
>>>          stripped vmlinux
>>
>> And this is there because unstrip version is quite huge and for early
>> issues you need to know only some symbols that's why debugger is not
>> overflow with stuff which none needs.
>> Maybe this is not an issue now but that strip version is used a lot.
>>
>>
>>>
>>> I am not sure how much useful those copies are,
>>> but, I tried my best to keep the same behavior.
>>>
>>> IMHO, I guess DTB=3D<dt> would be more sensible,
>>> but it is up to Michal.
>>
>> What do you mean by this exactly?
>=20
>=20
> As I showed above,
> arch/microblaze/boot/simpleImage.system.unstrip
> is exactly the same as vmlinux.
>=20
> arch/microblaze/boot/simpleImage.<dt>
> is objcopy'ed binary of vmlinux.
>=20
> arch/microblaze/boot/simpleImage.<dt>.ub
> is objcopy'ed binary of vmlinux, with u-boot header prepended.
>=20
> You have already build-rules for them.
>=20
>=20
>=20
> It is true that the stripped image only exist in simpleImage,
> but I think "arch/microblaze/boot/vmlinux.strip"
> is a more sensible name.
>=20
>=20
>=20
> What I want to point out is:
>     "Which file should be compiled in",
>     is a part of the configuration.
>     We generally do not change the final
>     target name just for the difference of
>     configuration.
>     For example, ARM just uses "vmlinux", "Image", "zImage", etc.
>     Never duplicate target-specific copies depending on configuration.
>=20
>=20
> Why does microblaze create copies for each DT
> instead of using generic image like linux.bin, linux.bin.ub, etc. ?
>=20
> If using generic image names is acceptable,
> "make simpleImage.<dt>" is just a shorthand of
> "make DTB=3D<dt> vmlinux linux.bin linux.bin.ub vmlinux.strip"
>=20
>=20
> Only the benefit of this approach is,
> you can keep all images for multiple boards at the same time.
>=20
> $ make ARCH=3Dmicroblaze simpleImage.board1
> $ make ARCH=3Dmicroblaze simpleImage.board2
> $ make ARCH=3Dmicroblaze simpleImage.board3

yes that's one thing which came to my mind too.

>=20
>=20
>=20
>=20
> Since I do not know how many users rely on this usage,
> I said "it is up to you".

One thing is what it is sensible and the second thing is historical
connection to that names. Because Xilinx was having ppc405 and ppc440
and microblaze as big endian architecture at that time was taking a lot
of stuff from powerpc that's why we took also that targets just to be
the same in distributions.
PPC was using simpleImage format in the same way that's why we have
adopted that too.

Personally for me it is not a problem to remove that simpleImage format
but I have no idea how many people rely on that.

I can't see any problem not to generate/copy simpleImage.<dt>.unstrip
version but I would keep the rest same as before just to make sure that
we are not breaking anybody.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs



--q3oKDBuMMQBmesEffbWlXj9Y2IOPo3avY--

--xVjJa22C8ZUdUVhqaibgSri8AbzwxfX5N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlwJH4MACgkQykllyylKDCF0PwCfexX9N0AQnIULIDRhZ3o5g8j1
X4oAniiNfrqiexAPtyCl2bNBV+T0MGck
=xOyM
-----END PGP SIGNATURE-----

--xVjJa22C8ZUdUVhqaibgSri8AbzwxfX5N--
