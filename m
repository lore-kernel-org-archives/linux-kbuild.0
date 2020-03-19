Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:21122 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgCSPfJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Mar 2020 11:35:09 -0400
MIME-Version: 1.0
References: <20200317000718.177637-1-slyfox@gentoo.org> <nycvar.YFH.7.76.2003170154580.19500@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2003170240410.19500@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2003170240410.19500@cbobk.fhfr.pm>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 20 Mar 2020 00:34:05 +0900
Message-ID: <CAK7LNARKBjfYsqvaksDhSwhDHxLv0o6c8cLx=eWuVYGHCGZ_Sw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: disallow data races on gcc-10 as well
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Sergei Trofimovich <slyfox@gentoo.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Mar 17, 2020 at 10:41 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Tue, 17 Mar 2020, Jiri Kosina wrote:
>
> > > The flag change happened at https://gcc.gnu.org/PR92046.
> > >
> > > CC: Jiri Kosina <jkosina@suse.cz>
> > > CC: Masahiro Yamada <masahiroy@kernel.org>
> > > CC: Michal Marek <michal.lkml@markovi.net>
> > > CC: linux-kbuild@vger.kernel.org
> > > Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> > > ---
> > >  Makefile | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 171f2b004c8a..9696eb2cd5a1 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -714,6 +714,7 @@ endif
> > >
> > >  # Tell gcc to never replace conditional load with a non-conditional one
> > >  KBUILD_CFLAGS      += $(call cc-option,--param=allow-store-data-races=0)
> > > +KBUILD_CFLAGS      += $(call cc-option,-fno-allow-store-data-races)
> >
> > I have to say I can't really read gcc sources without major cerebral pain,
> > so let me me dense here: what happens to gcc<10 if you pass
> > -fno-allow-store-data-races to it?
>
> Sorry, brainfart on my side, your patch is good :)
>
>         Acked-by: Jiri Kosina <jkosina@suse.cz>
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

Applied to linux-kbuild with Jiri's Ack.

Thanks.

-- 
Best Regards
Masahiro Yamada
