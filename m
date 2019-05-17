Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:22897 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfEQDip (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 23:38:45 -0400
MIME-Version: 1.0
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK7LNATUvPMqt93iwzNud0mxk99Si=CEBDyjA8BLEXM_tcTBfQ@mail.gmail.com> <201905151130.87CDB73C0@keescook>
In-Reply-To: <201905151130.87CDB73C0@keescook>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 17 May 2019 12:37:46 +0900
Message-ID: <CAK7LNASKnWkJhw3Hn1vKK=dB_vHOo0MtMd9duTpHoQSdgYoZLA@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Kees,

On Thu, May 16, 2019 at 3:31 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, May 16, 2019 at 03:07:54AM +0900, Masahiro Yamada wrote:
> > On Wed, May 15, 2019 at 4:40 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> >
> > >         $(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
> > > diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> > > new file mode 100755
> > > index 000000000000..944e68bd22b0
> > > --- /dev/null
> > > +++ b/scripts/modules-check.sh
> > > @@ -0,0 +1,18 @@
> > > +#!/bin/sh
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +
> > > +# Warn if two or more modules have the same basename
> > > +check_same_name_modules()
> > > +{
> > > +       same_name_modules=$(cat modules.order modules.builtin | \
> > > +                               xargs basename -a | sort | uniq -d)
> >
> >
> > I noticed a bug here.
> >
> >
> > allnoconfig + CONFIG_MODULES=y
> > will create empty modules.order and modules.builtin.
> >
> > Then, 'basename -a' will emit the error messages
> > since it receives zero arguments.
>
> You can skip running it by adding "-r" to xargs:
>
>        -r, --no-run-if-empty
>               If the standard input does not contain any nonblanks, do not run
>               the command.  Normally, the command is run once even if there is
>               no input.  This option is a GNU extension.

Good idea!

I will use this in v2.

Thanks.


-- 
Best Regards
Masahiro Yamada
