Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:13044 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729813AbgCaEPc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 00:15:32 -0400
From: Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and
 initramfs
Date: Tue, 31 Mar 2020 04:15:14 +0000
Message-ID: <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com>
References: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
In-Reply-To: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FEED80B093E22C4884948E4AFC9AE77A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "sedat.dilek@gmail.com" <sedat.dilek@gmail.com>
Cc: Nick Terrell <nickrterrell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>, Nick Desaulniers <ndesaulniers@google.com>

> On Mar 29, 2020, at 8:45 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>=20
> [ CC: Nick Desaulniers ]
>=20
> Hi Nick,
>=20
> I have tested your patchset v3 on top of Linux v5.6-rc7+
> compiled/linked with Clang/LLD v9.0.1.
>=20
> My Linux system is Debian/testing (will be "bullseye" aka version 11) AMD=
64.
> I used zstd package version 1.4.4+dfsg-3.
>=20
> I have no big numbers for you expect a comparison of initrd.img files
> compressed with GZIP (default by Debian) and ZSTD:
>=20
> root# du -k /boot/initrd.img-$(uname -r).{gz,zst}
> 29272   /boot/initrd.img-5.6.0-rc7-1-amd64-clang.gz
> 23540   /boot/initrd.img-5.6.0-rc7-1-amd64-clang.zst
>=20
> I needed to do some modifications to stuff from
> initramfs-tools/initramfs-tools-core (see end-titles).
>=20
> Do you plan to push this for Linux v5.7?

I hope that it will be accepted. From my point of view this patch set is
ready for merge, except for the maximum window size increase
requested by Petr.

> Feel free to add credits for the whole series:
>=20
>   Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

Thanks for testing the patch set Sedat!

-Nick=
