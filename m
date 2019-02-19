Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20592 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbfBSOw6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 09:52:58 -0500
MIME-Version: 1.0
References: <1547799412-20120-1-git-send-email-yamada.masahiro@socionext.com> <CAK7LNATiQFTwyZsy-Hw1e8S=HBzT_tzjEkBwivQD+o=Cga1Yhw@mail.gmail.com>
In-Reply-To: <CAK7LNATiQFTwyZsy-Hw1e8S=HBzT_tzjEkBwivQD+o=Cga1Yhw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 19 Feb 2019 23:52:07 +0900
Message-ID: <CAK7LNATcp8isvRG2M83_egBf9vocLoefFRJTSc4tyaV8SVK+Mg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: descend to scripts/kconfig/ directly when
 syncconfig is needed
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jan 24, 2019 at 1:25 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Fri, Jan 18, 2019 at 5:17 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > The recursion of the top Makefile is inefficient.
> > Just descend to scripts/kconfig/.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
>
> Applied to linux-kbuild.


I dropped this patch from my tree
because it has a drawback.


When I run 'make' in a pristine source tree,
I see a strange 'scripts/basic/fixdep: not found' error message.


$ make mrproper; make
  HOSTCC  scripts/kconfig/conf.o
/bin/sh: 1: scripts/basic/fixdep: not found
make[1]: *** [scripts/Makefile.host;109: scripts/kconfig/conf.o] Error 127
make[1]: *** Deleting file 'scripts/kconfig/conf.o'
Makefile:594: include/config/auto.conf: No such file or directory
make: *** [Makefile;634: include/config/auto.conf] Error 2







-- 
Best Regards
Masahiro Yamada
