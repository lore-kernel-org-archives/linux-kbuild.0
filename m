Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39412 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729034AbeKPC24 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 21:28:56 -0500
Received: by mail-oi1-f195.google.com with SMTP id 192-v6so17206848oii.6
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Nov 2018 08:20:28 -0800 (PST)
MIME-Version: 1.0
References: <20181114223211.b4a2gjmt5pvtg2bh@zorba> <6c9ff44b-5f27-15d0-c48f-cfd1e2ed33e4@infradead.org>
 <20181115000756.k2fsgzmswdbikpfb@zorba> <c13367b1-c28b-b889-ed91-233090f1410c@infradead.org>
 <20181115004706.r6azcyjd2fhtktio@zorba> <3d1cc558-17bf-d2b4-4121-33fff0625e22@infradead.org>
 <CAK7LNASk2NrsWkQs-pFAKFLG1-aDm29SQJJg378Voifqb320bw@mail.gmail.com> <20181115132516.o5eiomuhk4tq5cmr@zorba>
In-Reply-To: <20181115132516.o5eiomuhk4tq5cmr@zorba>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 15 Nov 2018 17:20:16 +0100
Message-ID: <CAFkk2KRS0+7moW9VKjrBaNuXCVkowrQGymGcAFeNz64Yq6hUCg@mail.gmail.com>
Subject: Re: hidden string Kconfig ?
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: danielwa@cisco.com
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Nov 15, 2018 at 2:25 PM Daniel Walker <danielwa@cisco.com> wrote:
>
> On Thu, Nov 15, 2018 at 11:50:56AM +0900, Masahiro Yamada wrote:
> >
> >
> > In current Kconfig, a 'string' type symbol is written to the .config when
> >
> > [1] it has a visible prompt
> >     https://github.com/masahir0y/linux/blob/v4.19/scripts/kconfig/symbol.c#L364
> >
> >    or
> >
> > [2] it has a default property
> >     https://github.com/masahir0y/linux/blob/v4.19/scripts/kconfig/symbol.c#L421
> >
>
> Ok.
>
>
> >
> > I am open to changing the behavior
> > as long as it keeps grammatical consistency, though.
> >
> >
> > As far as I understood this particular case,
> > CONFIG_CMDLINE will go away after the GENERIC_CMDLINE migration is done.
> >
> > (At least, upstream x86 and powerpc defconfig files seem complete).
> >
> >
> >
> > Perhaps, some prompt for migration could be useful?
> >
> > config CMDLINE
> >         string "(LEGACY) Please make this empty and use CMDLINE_PREPEND instead"
>
> I think it would be confusing to leave it. The reason I wanted to have it in
> there silently is so I can print a warning, or BUILD_BUG_ON (which is what I
> currently do). Just so that people 1) don't lose those options, and 2) So that I
> can remind or catch people when they don't notice there was a change. Russell
> (ARM32 maintainer) complained in this regard.
>
> I'll look into the Kconfig code and see if I can make something acceptable.
>
> Daniel

Note that it'd be inconsistent for string symbols to respect user
values (values from .config files) when they don't have a prompt. A
prompt says that the symbol can be assigned a value by the user.
Assigning a symbol a value in a .config file is the same as assigning
it a value in the menuconfig interface.

(See my previous message for why promptless symbol still end up in
.config. The assignments to promptless symbols don't influence the
symbol's value on the Kconfig side.)

I wonder if having an exception for a one-off like this is really
worth it. It might make the Kconfig semantics harder to understand.
The rule now is that symbols without prompts always derive their value
from other symbols (via defaults, in this case).

See https://docs.zephyrproject.org/latest/application/kconfig-tips.html#optional-prompts
for a way to make prompts optional. Not sure if it'd be helpful here
though.

Cheers,
Ulf
