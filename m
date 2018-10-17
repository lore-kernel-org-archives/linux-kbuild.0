Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41925 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbeJRHQu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Oct 2018 03:16:50 -0400
MIME-Version: 1.0
References: <20181017000809.GA21292@WindFlash> <716d591a-a0da-e048-a00d-0fe7dabdc4f1@koikeco.de>
In-Reply-To: <716d591a-a0da-e048-a00d-0fe7dabdc4f1@koikeco.de>
From: Leonardo Bras <leobras.c@gmail.com>
Date: Wed, 17 Oct 2018 20:18:37 -0300
Message-ID: <CADvQ+rGoxSHuVjA1-wbYW=bvb5sUjJS1EZSKdkHU2dwzjgDxow@mail.gmail.com>
Subject: Re: [Lkcamp] [PATCH 1/4] Adds -Wshadow=local on KBUILD_HOSTCFLAGS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: helen@koikeco.de
Cc: lkcamp@lists.libreplanetbr.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Matthew Wilcox <willy6545@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>

Hello Helen,

On Wed, Oct 17, 2018 at 1:32 AM Helen Koike <helen@koikeco.de> wrote:
>
> Hi Leonardo,
>
> Thanks for the patch.
>
> On 10/16/18 9:08 PM, Leonardo Br=C3=A1s wrote:
> > Adds -Wshadow=3Dlocal on KBUILD_HOSTCFLAGS to show shadow warnings
> > on tools built for HOST.
> >
> > Signed-off-by: Leonardo Br=C3=A1s <leobras.c@gmail.com>
> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index e8b599b4dcde..fb0a9ac195e7 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -360,7 +360,7 @@ HOST_LFS_LIBS :=3D $(shell getconf LFS_LIBS 2>/dev/=
null)
> >
> >  HOSTCC       =3D gcc
> >  HOSTCXX      =3D g++
> > -KBUILD_HOSTCFLAGS   :=3D -Wall -Wmissing-prototypes -Wstrict-prototype=
s -O2 \
> > +KBUILD_HOSTCFLAGS   :=3D -Wall -Wshadow=3Dlocal -Wmissing-prototypes -=
Wstrict-prototypes -O2 \
> >               -fomit-frame-pointer -std=3Dgnu89 $(HOST_LFS_CFLAGS) \
> >               $(HOSTCFLAGS)
> >  KBUILD_HOSTCXXFLAGS :=3D -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
> >
>
> I believe this should be the last patch on this series and not the first
> one to avoid commits in between where we have those warnings.
>

You are right, I will change the order for v2.
Thanks!

> Regards
> Helen

Regards,
Leonardo
