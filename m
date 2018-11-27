Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36724 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729254AbeK0TSq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Nov 2018 14:18:46 -0500
Received: by mail-ot1-f68.google.com with SMTP id k98so19340893otk.3
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Nov 2018 00:21:41 -0800 (PST)
MIME-Version: 1.0
References: <e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org>
 <CAK7LNARKuFj=YhSHg2fKw2yuWHOaTMUVQA75=3W8Hxdn0Y8Uuw@mail.gmail.com>
 <CAFkk2KSiFq16vXeCfYO8G_J5c4Kf59JeqqtRh-=g+NbjwGXAjg@mail.gmail.com>
 <CAK7LNATLwdmFMvB1ZWA404zkqtMwB-f96adYESLDgxBNsMiMJQ@mail.gmail.com>
 <CAFkk2KR4hKXqZcVXvh6xP4DJ8F1Oz7CS5M8J=KaQp1ob8QHLaA@mail.gmail.com>
 <CAK7LNATphkaDHozY2scesMVNAgdT6WM7j6-1cRsc7DatmnY16A@mail.gmail.com> <CAFkk2KSREjX_aTAvCb65bpU_YL1E-dXtsYqfu_4zgErq1fQqrA@mail.gmail.com>
In-Reply-To: <CAFkk2KSREjX_aTAvCb65bpU_YL1E-dXtsYqfu_4zgErq1fQqrA@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 27 Nov 2018 09:21:29 +0100
Message-ID: <CAFkk2KR=-v3PjLRfq77vhW3JL=NKYyE=r3T_=UL3nP_RsO1PQQ@mail.gmail.com>
Subject: Re: netfilter Kconfig question
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, ap420073@gmail.com

On Tue, Nov 27, 2018 at 9:07 AM Ulf Magnusson <ulfalizer@gmail.com> wrote:
>
> On Tue, Nov 27, 2018 at 8:48 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > On Tue, Nov 27, 2018 at 4:36 PM Ulf Magnusson <ulfalizer@gmail.com> wrote:
> > >
> > > On Tue, Nov 27, 2018 at 2:33 AM Masahiro Yamada
> > > <yamada.masahiro@socionext.com> wrote:
> > > >
> > > > On Tue, Nov 27, 2018 at 4:49 AM Ulf Magnusson <ulfalizer@gmail.com> wrote:
> > > > >
> > > > > On Mon, Nov 26, 2018 at 8:31 AM Masahiro Yamada
> > > > > <yamada.masahiro@socionext.com> wrote:
> > > > > >
> > > > > > Hi Randy,
> > > > > >
> > > > > >
> > > > > > On Tue, Nov 20, 2018 at 5:51 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> > > > > > >
> > > > > > > Hi Yamada-san,
> > > > > > >
> > > > > > > There was recently a netfilter build error in linux-next for which
> > > > > > > a patch was posted by Taehee Yoo.  The patch works (fixes the build
> > > > > > > error) but I don't see how or why.
> > > > > > >
> > > > > > > My build error report is here:
> > > > > > > https://lore.kernel.org/lkml/fa7a7824-44df-c058-dba2-ec29c5028361@infradead.org/T/#u
> > > > > > >
> > > > > > >
> > > > > > > Would you take a look at it and try to explain why the patch works?
> > > > > > >
> > > > > > > The patch's email thread begins here:
> > > > > > > https://www.spinics.net/lists/netfilter-devel/msg56985.html
> > > > > >
> > > > > >
> > > > > > I think this is a bug of Kconfig.
> > > > > >
> > > > > > I sent a patch.
> > > > > > https://patchwork.kernel.org/patch/10697637/
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Best Regards
> > > > > > Masahiro Yamada
> > > > >
> > > > > I always understood this behavior as intentional.
> > > > >
> > > > > Say that a high-level arch symbol has 'select FOO_HELPERS if FOO' for
> > > > > example, where both FOO and FOO_HELPERS can be compiled as modules.
> > > > >
> > > > > The intention there is probably to make sure that FOO_HELPERS is
> > > > > available whenever FOO is (FOO_HELPERS must be >= FOO). If FOO is y,
> > > > > then FOO_HELPERS must be y. If FOO is m, then it's fine for
> > > > > FOO_HELPERS to be m (but not n), because it can be loaded as needed
> > > > > whenever FOO is.
> > > >
> > > > If we find such an example, it should be rewritten to:
> > > >
> > > >
> > > > config FOO
> > > >         tristate "foo"
> > > >         select FOO_HELPERS
> > >
> > > Yup, almost always cleaner ways to do it.
> > >
> > > >
> > > >
> > > >
> > > >
> > > > > Forcing FOO_HELPERS to y would remove the possibility to compile it as
> > > > > a module.
> > > >
> > > > This depends on the selector if you write like this:
> > > >
> > > >
> > > > config OTHER_OPTION
> > > >        tristate "?"
> > > >        select FOO_HELPERS if FOO
> > > >
> > > >
> > > > although "FOO_HELPERS >= FOO" is not met.
> > >
> > > Yeah, that's why I mentioned "high-level arch symbol", because it gets
> > > more confusing for other symbols. Think boards and the like too.
> > >
> > > If you think of 'config A ... select C if B' as "A needs C if B", then
> > > the current behavior still does the right thing in all cases:
> > >
> > >   A B     | C
> > >   --------+-----
> > >   n n/m/y | n(+)  (A not enabled, irrelevant)
> > >   m n     | n(+)  (B not enabled, irrelevant)
> > >   m m     | m(+)  (Fine, C can be loaded if A and B are)
> > >   m y     | m(+)  (Ditto)
> > >   y n     | n(+)  (B not enabled, irrelevant)
> > >   y m     | m(+)  (Fine, C can be loaded if B is)
> > >   y y     | y     (Fine, C is available whenever B is)
> > >
> > > The big if there is whether you think of select that way. Just trying
> > > to show why I think it was designed that way.
> >
> >
> > No.
> >
> >
> >
> >   y m     | m(+)  (Fine, C can be loaded if B is)
> >
> >
> > is not fine.
> >
> >
> >
> > If 'A' is builtin, 'C' must be builtin as well.
> >
> >
> >
> > How can 'A' resolve references to 'C'
> > for the combination A=y and C=m ?
>
> If A needs to resolve references to C even when it's a module, then
> that's a different kind of dependency: A needs C if B != n.

Even when B is a module that is.

Cheers,
Ulf
