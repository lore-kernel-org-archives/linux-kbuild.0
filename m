Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37491 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbfEOSi3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 14:38:29 -0400
Received: by mail-pf1-f194.google.com with SMTP id g3so415494pfi.4
        for <linux-kbuild@vger.kernel.org>; Wed, 15 May 2019 11:38:29 -0700 (PDT)
Date: Wed, 15 May 2019 11:38:26 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
Message-ID: <201905151131.EBB45E5@keescook>
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK7LNAQgBKq9JDGtQUD1kgKrfLZ4jOjuLJi7_tpSPLJZsWtmag@mail.gmail.com>
 <201905150913.C23BD99AD@keescook>
 <CAK7LNARezpQgcK9O9K3ZFeebMVNroWStno_brvSLadsKXVfm-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARezpQgcK9O9K3ZFeebMVNroWStno_brvSLadsKXVfm-Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, May 16, 2019 at 02:55:02AM +0900, Masahiro Yamada wrote:
> 
> On Thu, May 16, 2019 at 1:20 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Wed, May 15, 2019 at 04:53:15PM +0900, Masahiro Yamada wrote:
> > > On Wed, May 15, 2019 at 4:40 PM Masahiro Yamada
> > > <yamada.masahiro@socionext.com> wrote:
> > > >
> > > > [...]
> > > > diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> > > > new file mode 100755
> > > > index 000000000000..944e68bd22b0
> > > > --- /dev/null
> > > > +++ b/scripts/modules-check.sh
> > > > @@ -0,0 +1,18 @@
> > > > +#!/bin/sh
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +# Warn if two or more modules have the same basename
> > > > +check_same_name_modules()
> > > > +{
> > > > +       same_name_modules=$(cat modules.order modules.builtin | \
> > > > +                               xargs basename -a | sort | uniq -d)
> >
> > While probably it'll never be a problem, just for robustness, I'd add "--"
> > to the end basename to terminate argument interpretation:
> >
> >     xargs basename -a -- | sort | ...
> 
> 
> Sorry for my ignorance, but could you
> teach me the effect of "--" ?
> 
> 
> I sometimes use "--" as a separator
> when there is ambiguity in arguments
> for example, "git log <revision> -- <path>"
> 
> 
> In this case, what is intended by "--"?

It means "end of arguments" so that whatever xargs passes into the
program aren't interpretted as an argument. In this case, if there was
a module path somehow ever named --weird/build/path/foo.o, xargs would
launch basename as:

	basename -a --weird/build/path/foo.o

and basename would fail since it didn't recognize the argument. Having
"--" will stop argument parsing:

	basename -a -- --weird/build/path/foo.o

This is just a robustness suggestion that I always recommend for xargs
piping, since this can turn into a security flaw (though not here) when
an argument may have behavioral side-effects. So, it's just a thing that
always jumps out at me, though in this particular case I don't think
we could ever see it cause a problem, but better to always write these
xargs patterns as safely as possible.

-- 
Kees Cook
