Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:27642 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbfEJHO7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 03:14:59 -0400
MIME-Version: 1.0
References: <20190510061205.28753-1-yamada.masahiro@socionext.com>
 <20190510061205.28753-2-yamada.masahiro@socionext.com> <20190510062116.GA18014@kroah.com>
In-Reply-To: <20190510062116.GA18014@kroah.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 10 May 2019 16:14:09 +0900
Message-ID: <CAK7LNARuDrYEgR8_U=mK2E22bc4JL_b4_5=wvJMc0siZio8S+A@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: do not write .config if the content is the same
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Joel Fernandes <joel@joelfernandes.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, May 10, 2019 at 3:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 10, 2019 at 03:12:05PM +0900, Masahiro Yamada wrote:
> > Kconfig updates the .config when it exits even if its content is
> > exactly the same as before. Since its timestamp becomes newer than
> > that of other build artifacts, additional processing is invoked,
> > which is annoying.
> >
> > - syncconfig is invoked to update include/config/auto.conf, etc.
> >
> > - kernel/config.o is recompiled if CONFIG_IKCONFIG is enabled,
> >   then vmlinux is relinked as well.
> >
> > If the .config is not changed at all, we do not have to even
> > touch it. Just bail out showing "No change to .config".
> >
> >   $ make allmodconfig
> >   scripts/kconfig/conf  --allmodconfig Kconfig
> >   #
> >   # configuration written to .config
> >   #
> >   $ make allmodconfig
> >   scripts/kconfig/conf  --allmodconfig Kconfig
> >   #
> >   # No change to .config
> >   #
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org> ?

OK.

For reviewers who do not know the context,
please see this comment from Linus:

https://lkml.org/lkml/2019/5/9/983



-- 
Best Regards
Masahiro Yamada
