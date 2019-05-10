Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:57794 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbfEJHEC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 03:04:02 -0400
Date: Fri, 10 May 2019 09:03:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] kconfig: do not write .config if the content is the
 same
Message-ID: <20190510070354.GA2193@ravnborg.org>
References: <20190510061205.28753-1-yamada.masahiro@socionext.com>
 <20190510061205.28753-2-yamada.masahiro@socionext.com>
 <CAMuHMdVmgZjyGxz0F=Akz+3egFtGMppGg6TRAnRhd=KZv5ADdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVmgZjyGxz0F=Akz+3egFtGMppGg6TRAnRhd=KZv5ADdg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Joel Fernandes <joel@joelfernandes.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Geert/Masahiro.

On Fri, May 10, 2019 at 08:46:35AM +0200, Geert Uytterhoeven wrote:
> Hi Yamada-san,
> 
> On Fri, May 10, 2019 at 8:14 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
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
It would be preferable that if nothing changed no output is generated.
Like we do not tell that we did not build a .o file because the .c file
had not changed.
Less noise for a kernel build where nothings happens.

> This causes a semantic change for the meaning of ".config.old", which is
> no longer updated if .config has not changed.
> Hence its contents may no longer correspond to the previous config, but to
> an arbitrary older version.
This semantic change is good.
So we now have a .config.old that correspond to the state before
the last change. Also after several kernel builds.

> > My workflow involves always running my own script "linux-oldconfig",
> instead of "make oldconfig", so I immediately see what has changed:
> 
>     $ cat $(type -p linux-oldconfig)
>     #!/bin/bash
>     make ${0#*/linux-} && colordiff -u .config{.old,}
So scripts relying on the old (broken) behaviour will no longer work.
The new behaviour is better as it is usefaul in many typical situations.

Hacking, hack. What did I change in the config?

	Sam
