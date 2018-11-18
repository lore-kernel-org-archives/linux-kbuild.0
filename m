Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49952 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbeKRPUb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Nov 2018 10:20:31 -0500
MIME-Version: 1.0
References: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
 <1542270435-11181-4-git-send-email-yamada.masahiro@socionext.com> <20181116200109.GC15240@ravnborg.org>
In-Reply-To: <20181116200109.GC15240@ravnborg.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 18 Nov 2018 14:00:31 +0900
Message-ID: <CAK7LNATefLJcb52N0=p2qAk-N_0hEQDOQinw5+kUiKo7oWFRnQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] kbuild: refactor modversions build rules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Sam,


On Sat, Nov 17, 2018 at 5:01 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Masahiro
>
> On Thu, Nov 15, 2018 at 05:27:10PM +0900, Masahiro Yamada wrote:
> > Let $(CC) compile objects into normal files *.o instead of .tmp_*.o
> > whether CONFIG_MODVERSIONS is enabled or not. This will help simplify
> > build rules a lot.
>
> Another approach would be to move more of the build stuff to
> one or a few build scripts.

Shifting code from Makefile to a shell script
will be another clean-up.


This patch is addressing a different problem.

See this code in Malefile.build

ifdef CONFIG_MODVERSIONS
objtool_o = $(@D)/.tmp_$(@F)
else
objtool_o = $(@)
endif



cmd_cc_o_c writes an object into a different file name
depending CONFIG_MODVERSIONS, which makes difficult
for other actions to manipulate the object in a
consistent manner.

I will clarify this in the commit log in v2.

Thanks.





> Using build scripts makes is much easier to add comments and
> still keep it readable.
> And when the build logic list a set of serialized actions
> they thay can be included in a build script nicely.
>
> But that said - I also like the simplifications you made.
> Everytime you trim the core kbuild files it is a win for
> readability.
>
>         Sam



-- 
Best Regards
Masahiro Yamada
