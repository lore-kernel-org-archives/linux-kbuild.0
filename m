Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:37007 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfEQQZA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 12:25:00 -0400
MIME-Version: 1.0
References: <20190517042753.25857-1-yamada.masahiro@socionext.com> <20190517153439.3b479334@canb.auug.org.au>
In-Reply-To: <20190517153439.3b479334@canb.auug.org.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 18 May 2019 01:23:55 +0900
Message-ID: <CAK7LNAQMCfEE2ncrGj3Cair8udQZea_ZsTGGSsFA_7T86-7vRA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check uniqueness of module names
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, May 17, 2019 at 2:34 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Masahiro,
>
> Thanks for this, looks good to me.  Just a nit below.
>
> On Fri, 17 May 2019 13:27:53 +0900 Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >
>
> > diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> > new file mode 100755
> > index 000000000000..c875f6eab01e
> > --- /dev/null
> > +++ b/scripts/modules-check.sh
> > @@ -0,0 +1,20 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +set -e
> > +
> > +# Check uniqueness of module names
> > +check_same_name_modules()
> > +{
> > +     same_name_modules=$(cat modules.order modules.builtin | \
>                                                                 ^
> This trailing '\' is unnecessary after a pipe symbol.


With the suggestion from Alexander Kapshuk,
the code in v3 became short enough to fit in 80-columns.

Anyway, thanks for pointing it out.





> > +                             xargs -r basename -a -- | sort | uniq -d)
> > +
> > +     for m in $same_name_modules
> > +     do
> > +             echo "warning: same basename if the following are built as modules:" >&2
> > +             grep -h -e "/$m" modules.order modules.builtin | \
>
> Same here
>
> > +                                             sed 's:^kernel/:  :' >&2
> > +     done
> > +}
> > +
> > +check_same_name_modules
>
> Reviewed-by: Stephen ROthwell <sfr@canb.auug.org.au>
>
> --
> Cheers,
> Stephen Rothwell



-- 
Best Regards
Masahiro Yamada
