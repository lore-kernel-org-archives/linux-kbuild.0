Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45035 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgDAJuw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 05:50:52 -0400
MIME-Version: 1.0
References: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
 <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com> <CA+icZUWBJz6765Szg65HcOfhDh9tyoarJTnZ_kmahqvB5QKU=g@mail.gmail.com>
 <5F9D2C8D-B1DE-4F95-992E-524E02851CF4@fb.com>
In-Reply-To: <5F9D2C8D-B1DE-4F95-992E-524E02851CF4@fb.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 1 Apr 2020 11:50:51 +0200
Message-ID: <CA+icZUXxwkPcfKgaaEaV4XhQseK--N3a=ffh=kU-C84BcFuhrw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and initramfs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <terrelln@fb.com>
Cc: Nick Terrell <nickrterrell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, Apr 1, 2020 at 4:52 AM Nick Terrell <terrelln@fb.com> wrote:
>
>
>
> > On Mar 31, 2020, at 8:11 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Tue, Mar 31, 2020 at 6:15 AM Nick Terrell <terrelln@fb.com> wrote:
> >
> > [...]
> >
> >>> Do you plan to push this for Linux v5.7?
> >>
> >> I hope that it will be accepted. From my point of view this patch set =
is
> >> ready for merge, except for the maximum window size increase
> >> requested by Petr.
> >>
> >
> > Hi Nick,
> >
> > thanks for your answer.
> >
> > Did you send out a pull-request already?
>
> I haven=E2=80=99t sent out a pull request. If that is something that I ne=
ed to
> do, or if it makes the process easier for a maintainer to merge then
> I can do that.
>

[ CC  Stephen Rothwell (maintainer of Linux-next) ]

Hi Nick,

as Adam pointed out it might be good to ask "Stephen Rothwell"
<sfr@canb.auug.org.au>
to include your Git tree into linux-next. Stephen will give you some
informations about that.

> > Can you point me to that request or patch of Petr?
> > Is it relevant or optional for the pull-request?
>
> The patches from Petr are a parallel implementation of initramfs
> decompression and are available here [0]. They support initramfs
> compression well, but are missing some pieces for correct and
> performant zstd kernel decompression. Namely the equivalent of
> patch 6 in this series to increase ZO_z_extra_bytes, the
> performance fix in patch 1 that switches memcpy() to
> __builtin_memcpy(), and the decompress_single() function in patch 3.
>
> Without those changes a very compressible kernel may fail to
> decompress successfully, and will be corrupted. And the performance
> is about 4x worse on x86_64. My patches took 70 ms to decompress vs
> 318 ms with Petr=E2=80=99s. See the detailed comparison here [1].
>

Thanks for version 4 of your patchset and these clarifications.

I will try zstd-v4.

Regards,
- Sedat -



> >>> Feel free to add credits for the whole series:
> >>>
> >>>  Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> >>
> >> Thanks for testing the patch set Sedat!
> >>
> >
> > I have re-tested zstd-v3 patchset with Linux version 5.6 final and
> > Clang/LLD version 10.0.0 final (from Debian/unstable repository).
> >
> > Is it possible to mention that there might distro-specific changes
> > needed to initramfs-handling?
> > For Debian you are welcome to include below Link [1].
> > Not sure I will send/ask to/on the debian-kernel mailing list in this t=
opic.
>
> I don=E2=80=99t expect any distro specific changes are required to contin=
ue operating
> as-is. However, if a distro wanted to switch to a zstd compressed initram=
fs
> they would need to update their toolchain to compress with zstd.
>
> > Thanks and bonne chance.
> >
> > Regards,
> > - Sedat -
> >
> > [1] LINK: https://lore.kernel.org/lkml/CA+icZUXCn2an9aNDrm+-eneSAOyGibz=
0W1xYhwkA5k3B3U-5vQ@mail.gmail.com/
>
> [0] https://lkml.org/lkml/2020/3/16/461
> [1] https://lkml.org/lkml/2020/3/31/1573
>
