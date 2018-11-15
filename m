Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcdn-iport-9.cisco.com ([173.37.86.80]:43471 "EHLO
        rcdn-iport-9.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbeKPDKI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 22:10:08 -0500
Date: Thu, 15 Nov 2018 09:01:15 -0800
From: Daniel Walker <danielwa@cisco.com>
Subject: Re: hidden string Kconfig ?
Message-ID: <20181115170020.wrhgzoxswlycw42i@zorba>
References: <20181114223211.b4a2gjmt5pvtg2bh@zorba>
 <6c9ff44b-5f27-15d0-c48f-cfd1e2ed33e4@infradead.org>
 <20181115000756.k2fsgzmswdbikpfb@zorba>
 <c13367b1-c28b-b889-ed91-233090f1410c@infradead.org>
 <20181115004706.r6azcyjd2fhtktio@zorba>
 <3d1cc558-17bf-d2b4-4121-33fff0625e22@infradead.org>
 <CAK7LNASk2NrsWkQs-pFAKFLG1-aDm29SQJJg378Voifqb320bw@mail.gmail.com>
 <20181115132516.o5eiomuhk4tq5cmr@zorba>
 <CAFkk2KRS0+7moW9VKjrBaNuXCVkowrQGymGcAFeNz64Yq6hUCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFkk2KRS0+7moW9VKjrBaNuXCVkowrQGymGcAFeNz64Yq6hUCg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Nov 15, 2018 at 05:20:16PM +0100, Ulf Magnusson wrote:
> On Thu, Nov 15, 2018 at 2:25 PM Daniel Walker <danielwa@cisco.com> wrote:
> >
> > On Thu, Nov 15, 2018 at 11:50:56AM +0900, Masahiro Yamada wrote:
> > >
> > >
> > > In current Kconfig, a 'string' type symbol is written to the .config when
> > >
> > > [1] it has a visible prompt
> > >     https://github.com/masahir0y/linux/blob/v4.19/scripts/kconfig/symbol.c#L364
> > >
> > >    or
> > >
> > > [2] it has a default property
> > >     https://github.com/masahir0y/linux/blob/v4.19/scripts/kconfig/symbol.c#L421
> > >
> >
> > Ok.
> >
> >
> > >
> > > I am open to changing the behavior
> > > as long as it keeps grammatical consistency, though.
> > >
> > >
> > > As far as I understood this particular case,
> > > CONFIG_CMDLINE will go away after the GENERIC_CMDLINE migration is done.
> > >
> > > (At least, upstream x86 and powerpc defconfig files seem complete).
> > >
> > >
> > >
> > > Perhaps, some prompt for migration could be useful?
> > >
> > > config CMDLINE
> > >         string "(LEGACY) Please make this empty and use CMDLINE_PREPEND instead"
> >
> > I think it would be confusing to leave it. The reason I wanted to have it in
> > there silently is so I can print a warning, or BUILD_BUG_ON (which is what I
> > currently do). Just so that people 1) don't lose those options, and 2) So that I
> > can remind or catch people when they don't notice there was a change. Russell
> > (ARM32 maintainer) complained in this regard.
> >
> > I'll look into the Kconfig code and see if I can make something acceptable.
> >
> > Daniel
> 
> Note that it'd be inconsistent for string symbols to respect user
> values (values from .config files) when they don't have a prompt. A
> prompt says that the symbol can be assigned a value by the user.
> Assigning a symbol a value in a .config file is the same as assigning
> it a value in the menuconfig interface.
 
We could do it differently, for example, if the config file has an option set,
then the Kconfig system should show a warning or error. I was thinking their
might be a way to do that already with the $(shell, ...) stuff , or $(error-if,
..) but I couldn't get those to work.

Like in my case if you have CONFIG_CMDLINE="none blank" then print a warning
letting people know that value disappeared. This is basically what I'm doing
right now, if you have that option it will trigger a BUILD_BUG_ON().

> (See my previous message for why promptless symbol still end up in
> .config. The assignments to promptless symbols don't influence the
> symbol's value on the Kconfig side.)
> 
> I wonder if having an exception for a one-off like this is really
> worth it. It might make the Kconfig semantics harder to understand.
> The rule now is that symbols without prompts always derive their value
> from other symbols (via defaults, in this case).

I would think others have this issue, when you have one version of Linux with
one Kconfig setup, then you have to migrate to a newer Kconfig setup. There
should be graceful ways to handle it.

Daniel
