Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41102 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgDFKrM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Apr 2020 06:47:12 -0400
MIME-Version: 1.0
References: <20200401053913.216783-1-nickrterrell@gmail.com>
 <20200401053913.216783-7-nickrterrell@gmail.com> <20200401093310.GA13748@zn.tnic>
 <D45F637D-6BB0-4F08-BEBE-FAB9B56F36F6@fb.com> <20200402155810.GD9352@zn.tnic> <2370741E-FE5A-44C1-8BF3-24A03E321F4E@fb.com>
In-Reply-To: <2370741E-FE5A-44C1-8BF3-24A03E321F4E@fb.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 6 Apr 2020 12:47:30 +0200
Message-ID: <CA+icZUWP0HR5ZiWq438bpcyu71cxmkv2HPqeuR2EwUAz5CjwBg@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] x86: bump ZO_z_extra_bytes margin for zstd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <terrelln@fb.com>
Cc: Borislav Petkov <bp@alien8.de>, Nick Terrell <nickrterrell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>

On Thu, Apr 2, 2020 at 10:26 PM Nick Terrell <terrelln@fb.com> wrote:
>
>
>
> > On Apr 2, 2020, at 8:58 AM, Borislav Petkov <bp@alien8.de> wrote:
> >
> > On Wed, Apr 01, 2020 at 05:33:03PM +0000, Nick Terrell wrote:
> >> The code is currently written so that all the compression algorithms u=
se the
> >> same ZO_z_extra_bytes. It is taken to be the maximum of the growth rat=
e
> >> plus the maximum fixed overhead. Just a few lines above is the comment=
:
> >>
> >> # =E2=80=A6 Hence safety
> >> # margin should be updated to cover all decompressors so that we don't
> >> # need to deal with each of them separately. Please check
> >> # the description in lib/decompressor_xxx.c for specific information.
> >>
> >> So I was been following the guidance in the comments.
> >
> > Please state that in the commit message when you send your next
> > revision.
>
> Will do.
>
> >> Does it matter? I=E2=80=99m not an expert here,
> >
> > Huh, you're only sending the code then? Or what do you mean with not
> > being an expert?
>
> I mean that while I=E2=80=99ve read and understood this piece of the code=
, have tested
> the patches, have followed the template of other compression methods
> added, and am confident in the correctness of the code, I=E2=80=99m not a=
 regular
> contributor to the pre-boot x86 kernel code. So it is possible that there=
 is a
> use case for kernel compression that I=E2=80=99m not aware of where RAM i=
s extremely
> tight and within 64 KB of the current limits.
>
> It seems to me that adding 64KB to the memory requirement for kernel
> decompression is not going to break anyone. If it did the kernel image is=
 taking
> up nearly all available RAM, which doesn=E2=80=99t seem likely. But, I do=
n=E2=80=99t know all
> use cases. If it does break someone, we can put up a separate patch that
> switches all the compression methods over a per-method ZO_z_extra_bytes.
>

Hi Nick,

are you planning a zstd-v5?
If yes, please CC me, thanks.

Regards,
- Sedat -
