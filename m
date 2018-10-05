Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37885 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728433AbeJEQF2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Oct 2018 12:05:28 -0400
MIME-Version: 1.0
References: <20180921142234.16882-1-kieran.bingham+renesas@ideasonboard.com>
 <20181005083313.2088252-1-arnd@arndb.de> <08b190b9dabd4625ae3d636b88b43ccb@AcuMS.aculab.com>
In-Reply-To: <08b190b9dabd4625ae3d636b88b43ccb@AcuMS.aculab.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 5 Oct 2018 11:07:22 +0200
Message-ID: <CAK8P3a0ZWfjGfpCRzoVw9vg=xg2ov2c7et_qTi5mzd81_RParQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix kernel/bounds.c 'W=1' warning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Laight <David.Laight@aculab.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kieran.bingham+renesas@ideasonboard.com, "# 3.4.x" <stable@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Fri, Oct 5, 2018 at 10:52 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Arnd Bergmann
> > Sent: 05 October 2018 09:33
> >
> > Building any configuration with 'make W=1' produces a warning:
> >
> > kernel/bounds.c:16:6: warnign: no previous prototype for 'foo' [-Wmissing-prototypes]
> >
> > When also passing -Werror, this prevents us from building any
> > other files. Nobody ever calls the function, but we can't make
> > it 'static' either since we want the compiler output.
> >
> > Calling it 'main' instead however avoids the warning, because gcc
> > does not insist on having a declaration for main.
>
> Ugg.
> main() might be special in other ways too.
> It wouldn't surprise me if some linkers don't do special stuff for it.
>
> What is wrong with just putting and extra "void foo(void);" before
> the function?

Greg objected to that on the basis that we don't want declarations
in .c files -- they should be in a shared header:

https://lkml.org/lkml/2018/9/21/735

I don't see what could go wrong here with calling it main(), after
all we are just interested in the assembler output, not even
creating an object file.

      Arnd
