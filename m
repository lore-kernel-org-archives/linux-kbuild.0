Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:27071 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbeKOM5q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 07:57:46 -0500
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id wAF2pX91010431
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Nov 2018 11:51:34 +0900
Received: by mail-vs1-f47.google.com with SMTP id x1so10827283vsc.10
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Nov 2018 18:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20181114223211.b4a2gjmt5pvtg2bh@zorba> <6c9ff44b-5f27-15d0-c48f-cfd1e2ed33e4@infradead.org>
 <20181115000756.k2fsgzmswdbikpfb@zorba> <c13367b1-c28b-b889-ed91-233090f1410c@infradead.org>
 <20181115004706.r6azcyjd2fhtktio@zorba> <3d1cc558-17bf-d2b4-4121-33fff0625e22@infradead.org>
In-Reply-To: <3d1cc558-17bf-d2b4-4121-33fff0625e22@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 15 Nov 2018 11:50:56 +0900
Message-ID: <CAK7LNASk2NrsWkQs-pFAKFLG1-aDm29SQJJg378Voifqb320bw@mail.gmail.com>
Subject: Re: hidden string Kconfig ?
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: danielwa@cisco.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Nov 15, 2018 at 9:50 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 11/14/18 4:47 PM, Daniel Walker wrote:
> > On Wed, Nov 14, 2018 at 04:37:43PM -0800, Randy Dunlap wrote:
> >> On 11/14/18 4:07 PM, Daniel Walker wrote:
> >>> On Wed, Nov 14, 2018 at 03:16:17PM -0800, Randy Dunlap wrote:
> >>>> Hi,
> >>>>
> >>>> There are several "string" Kconfig symbols in init/Kconfig that do not have
> >>>> a prompt string after them.  I believe that these do what you are asking about.
> >>>> If not, please provide your example that is not working.
> >>>>
> >>>> Or:  this one works for me:
> >>>>
> >>>> ---
> >>>>  init/Kconfig |    4 ++++
> >>>>  1 file changed, 4 insertions(+)
> >>>>
> >>>> --- linux-next-20181114.orig/init/Kconfig
> >>>> +++ linux-next-20181114/init/Kconfig
> >>>> @@ -1858,6 +1858,10 @@ config CMDLINE
> >>>>
> >>>>  endif
> >>>>
> >>>> +config SPECIAL_STRING
> >>>> +  string
> >>>> +  default "special"
> >>>> +
> >>>>  endmenu           # General setup
> >>>>
> >>>>  source "arch/Kconfig"
> >>>>
> >>>>
> >>>> and "make oldconfig" gives me a .config file that contains:
> >>>> CONFIG_SPECIAL_STRING="special"
> >>>
> >>> I have this (in init/Kconfig),
> >>>
> >>> config CMDLINE
> >>>         string
> >>>
> >>> then inside my .config I have this,
> >>> CONFIG_CMDLINE="console=ttyS0"
> >>>
> >>> if you run  "make menuconfig", and change something then save. The
> >>> CONFIG_CMDLINE is gone.
> >>>
> >>> What I would want is for that option to remain untouched.
> >>
> >> Interesting.  I guess luckily for me I was testing with today's linux-next,
> >> which contains the CMDLINE Kconfig symbols in init/Kconfig, including this one:
> >>
> >> config CMDLINE
> >>      string ""
> >>
> >>
> >> and that does work with your "console=ttyS0" + make oldconfig or make xconfig.
> >>
> >> But apparently the string does need to have a prompt ("").
> >> Without that (as you listed it), the value does disappear.
> >
> > Yeah, the patch your talking about is from my -next tree. I'm trying to get rid
> > of the prompt .. There is no description, and no one should be setting that.
> > It's only there so that people don't lose their old CONFIG_CMDLINE.
>
> Yeah, not surprised to hear that.
>
> > It seems like Kconfig should be able to handle this because you may have an
> > obsolete string option which you may want to retain silently in the Kconfig.
>
> OK, I'll let the kconfig maintainer comment on that.



In current Kconfig, a 'string' type symbol is written to the .config when

[1] it has a visible prompt
    https://github.com/masahir0y/linux/blob/v4.19/scripts/kconfig/symbol.c#L364

   or

[2] it has a default property
    https://github.com/masahir0y/linux/blob/v4.19/scripts/kconfig/symbol.c#L421



I am open to changing the behavior
as long as it keeps grammatical consistency, though.


As far as I understood this particular case,
CONFIG_CMDLINE will go away after the GENERIC_CMDLINE migration is done.

(At least, upstream x86 and powerpc defconfig files seem complete).



Perhaps, some prompt for migration could be useful?

config CMDLINE
        string "(LEGACY) Please make this empty and use CMDLINE_PREPEND instead"




-- 
Best Regards
Masahiro Yamada
