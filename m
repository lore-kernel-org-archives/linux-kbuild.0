Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34631 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbeK0Gof (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Nov 2018 01:44:35 -0500
Received: by mail-ot1-f68.google.com with SMTP id t5so17871168otk.1
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Nov 2018 11:49:24 -0800 (PST)
MIME-Version: 1.0
References: <e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org> <CAK7LNARKuFj=YhSHg2fKw2yuWHOaTMUVQA75=3W8Hxdn0Y8Uuw@mail.gmail.com>
In-Reply-To: <CAK7LNARKuFj=YhSHg2fKw2yuWHOaTMUVQA75=3W8Hxdn0Y8Uuw@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Mon, 26 Nov 2018 20:49:13 +0100
Message-ID: <CAFkk2KSiFq16vXeCfYO8G_J5c4Kf59JeqqtRh-=g+NbjwGXAjg@mail.gmail.com>
Subject: Re: netfilter Kconfig question
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, ap420073@gmail.com

On Mon, Nov 26, 2018 at 8:31 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Randy,
>
>
> On Tue, Nov 20, 2018 at 5:51 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > Hi Yamada-san,
> >
> > There was recently a netfilter build error in linux-next for which
> > a patch was posted by Taehee Yoo.  The patch works (fixes the build
> > error) but I don't see how or why.
> >
> > My build error report is here:
> > https://lore.kernel.org/lkml/fa7a7824-44df-c058-dba2-ec29c5028361@infradead.org/T/#u
> >
> >
> > Would you take a look at it and try to explain why the patch works?
> >
> > The patch's email thread begins here:
> > https://www.spinics.net/lists/netfilter-devel/msg56985.html
>
>
> I think this is a bug of Kconfig.
>
> I sent a patch.
> https://patchwork.kernel.org/patch/10697637/
>
>
> --
> Best Regards
> Masahiro Yamada

I always understood this behavior as intentional.

Say that a high-level arch symbol has 'select FOO_HELPERS if FOO' for
example, where both FOO and FOO_HELPERS can be compiled as modules.

The intention there is probably to make sure that FOO_HELPERS is
available whenever FOO is (FOO_HELPERS must be >= FOO). If FOO is y,
then FOO_HELPERS must be y. If FOO is m, then it's fine for
FOO_HELPERS to be m (but not n), because it can be loaded as needed
whenever FOO is.

Forcing FOO_HELPERS to y would remove the possibility to compile it as
a module. I suspect some things rely on this (and that some other
symbols just automagically act in a reasonable way even though it
wasn't planned).

And yeah, there might be better ways to handle that particular case,
but going for concepts. :)

Cheers,
Ulf
