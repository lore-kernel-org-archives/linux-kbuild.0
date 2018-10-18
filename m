Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f65.google.com ([209.85.210.65]:32827 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbeJRIfH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Oct 2018 04:35:07 -0400
MIME-Version: 1.0
References: <20181017000809.GA21292@WindFlash> <20181017081115.GA22535@zn.tnic>
 <CAK7LNASVn7CB5uL9tCtNC2u4Ary5eb-vyiB_sS2ey5AZNweKAA@mail.gmail.com>
In-Reply-To: <CAK7LNASVn7CB5uL9tCtNC2u4Ary5eb-vyiB_sS2ey5AZNweKAA@mail.gmail.com>
From: Leonardo Bras <leobras.c@gmail.com>
Date: Wed, 17 Oct 2018 21:36:38 -0300
Message-ID: <CADvQ+rGVLG85p82O-joY6yU4maMdP0RsyJr-JGPNCrfjy4-WbA@mail.gmail.com>
Subject: Re: [PATCH 1/4] Adds -Wshadow=local on KBUILD_HOSTCFLAGS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Borislav Petkov <bp@alien8.de>, lkcamp@lists.libreplanetbr.org, Matthew Wilcox <willy6545@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Michal Marek <michal.lkml@markovi.net>, linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Wed, Oct 17, 2018 at 5:21 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Wed, Oct 17, 2018 at 5:11 PM Borislav Petkov <bp@alien8.de> wrote:
> >
> > On Tue, Oct 16, 2018 at 09:08:09PM -0300, Leonardo Br=C3=A1s wrote:
> > > Adds -Wshadow=3Dlocal on KBUILD_HOSTCFLAGS to show shadow warnings
> > > on tools built for HOST.
> > >
> > > Signed-off-by: Leonardo Br=C3=A1s <leobras.c@gmail.com>
> > > ---
> > >  Makefile | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index e8b599b4dcde..fb0a9ac195e7 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -360,7 +360,7 @@ HOST_LFS_LIBS :=3D $(shell getconf LFS_LIBS 2>/de=
v/null)
> > >
> > >  HOSTCC       =3D gcc
> > >  HOSTCXX      =3D g++
> > > -KBUILD_HOSTCFLAGS   :=3D -Wall -Wmissing-prototypes -Wstrict-prototy=
pes -O2 \
> > > +KBUILD_HOSTCFLAGS   :=3D -Wall -Wshadow=3Dlocal -Wmissing-prototypes=
 -Wstrict-prototypes -O2 \
> > >               -fomit-frame-pointer -std=3Dgnu89 $(HOST_LFS_CFLAGS) \
> > >               $(HOSTCFLAGS)
> > >  KBUILD_HOSTCXXFLAGS :=3D -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
> > > --
> >
> > You might wanna take a look at scripts/Makefile.extrawarn which already
> > has -Wshadow.
>
>
> scripts/Makefile.extrawarn provides options for the target compiler (CC),
> whereas this patch adds -Wshadow=3Dlocal for the host compiler (HOSTCC).
>
>


Thanks for helping, :)

Leonardo Bras

>
> --
> Best Regards
> Masahiro Yamada
