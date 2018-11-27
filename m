Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19230 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbeK0M3F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Nov 2018 07:29:05 -0500
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id wAR1Wmw5030310
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Nov 2018 10:32:49 +0900
Received: by mail-vk1-f174.google.com with SMTP id 197so4675141vkf.4
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Nov 2018 17:32:49 -0800 (PST)
MIME-Version: 1.0
References: <e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org>
 <CAK7LNARKuFj=YhSHg2fKw2yuWHOaTMUVQA75=3W8Hxdn0Y8Uuw@mail.gmail.com> <CAFkk2KSiFq16vXeCfYO8G_J5c4Kf59JeqqtRh-=g+NbjwGXAjg@mail.gmail.com>
In-Reply-To: <CAFkk2KSiFq16vXeCfYO8G_J5c4Kf59JeqqtRh-=g+NbjwGXAjg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 27 Nov 2018 10:32:11 +0900
Message-ID: <CAK7LNATLwdmFMvB1ZWA404zkqtMwB-f96adYESLDgxBNsMiMJQ@mail.gmail.com>
Subject: Re: netfilter Kconfig question
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Taehee Yoo <ap420073@gmail.com>

On Tue, Nov 27, 2018 at 4:49 AM Ulf Magnusson <ulfalizer@gmail.com> wrote:
>
> On Mon, Nov 26, 2018 at 8:31 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Hi Randy,
> >
> >
> > On Tue, Nov 20, 2018 at 5:51 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> > >
> > > Hi Yamada-san,
> > >
> > > There was recently a netfilter build error in linux-next for which
> > > a patch was posted by Taehee Yoo.  The patch works (fixes the build
> > > error) but I don't see how or why.
> > >
> > > My build error report is here:
> > > https://lore.kernel.org/lkml/fa7a7824-44df-c058-dba2-ec29c5028361@infradead.org/T/#u
> > >
> > >
> > > Would you take a look at it and try to explain why the patch works?
> > >
> > > The patch's email thread begins here:
> > > https://www.spinics.net/lists/netfilter-devel/msg56985.html
> >
> >
> > I think this is a bug of Kconfig.
> >
> > I sent a patch.
> > https://patchwork.kernel.org/patch/10697637/
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
>
> I always understood this behavior as intentional.
>
> Say that a high-level arch symbol has 'select FOO_HELPERS if FOO' for
> example, where both FOO and FOO_HELPERS can be compiled as modules.
>
> The intention there is probably to make sure that FOO_HELPERS is
> available whenever FOO is (FOO_HELPERS must be >= FOO). If FOO is y,
> then FOO_HELPERS must be y. If FOO is m, then it's fine for
> FOO_HELPERS to be m (but not n), because it can be loaded as needed
> whenever FOO is.

If we find such an example, it should be rewritten to:


config FOO
        tristate "foo"
        select FOO_HELPERS




> Forcing FOO_HELPERS to y would remove the possibility to compile it as
> a module.

This depends on the selector if you write like this:


config OTHER_OPTION
       tristate "?"
       select FOO_HELPERS if FOO


although "FOO_HELPERS >= FOO" is not met.



> I suspect some things rely on this (and that some other
> symbols just automagically act in a reasonable way even though it
> wasn't planned).
>
> And yeah, there might be better ways to handle that particular case,
> but going for concepts. :)
>
> Cheers,
> Ulf



-- 
Best Regards
Masahiro Yamada
