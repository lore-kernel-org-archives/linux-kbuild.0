Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:52210 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfEPJjc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 05:39:32 -0400
MIME-Version: 1.0
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK7LNAQgBKq9JDGtQUD1kgKrfLZ4jOjuLJi7_tpSPLJZsWtmag@mail.gmail.com>
 <201905150913.C23BD99AD@keescook> <CAK7LNARezpQgcK9O9K3ZFeebMVNroWStno_brvSLadsKXVfm-Q@mail.gmail.com>
 <5e6999f3d0b349bd86a32a612cff7b4b@AcuMS.aculab.com>
In-Reply-To: <5e6999f3d0b349bd86a32a612cff7b4b@AcuMS.aculab.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 May 2019 18:38:35 +0900
Message-ID: <CAK7LNAQbtxRxg=1_ZDMmX=q8AGYQescqXZ1TqAjDufMFww6pyQ@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Laight <David.Laight@aculab.com>
Cc: Kees Cook <keescook@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi David,

On Thu, May 16, 2019 at 6:00 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Masahiro Yamada
> > Sent: 15 May 2019 18:55
> ...
> > >     xargs basename -a -- | sort | ...
> >
> > Sorry for my ignorance, but could you
> > teach me the effect of "--" ?
> >
> > I sometimes use "--" as a separator
> > when there is ambiguity in arguments
> > for example, "git log <revision> -- <path>"
> >
> > In this case, what is intended by "--"?
>
> The '--' stops getopt() from parsing any more parameters.
> Useful things like 'grep -- -q' which will search for the
> string '-q' rather than treating it as a command line option.
>
> This is all made more horrid by a decision by the writers
> of glibc getopt() to 'permute' argv[] so that 'options'
> can follow 'nonoptions' ie it converts:
>         prog file -arg
> to
>         prog -arg file
> The only program the historically allowed 'late' options
> was 'rlogin hostname -l username'.
> This is just broken.....


Ah, I see.  This does not happen for
modules.order or modules.builtin,
but I will use '--' just in case.

Thanks.


>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)



-- 
Best Regards
Masahiro Yamada
