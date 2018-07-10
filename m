Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47472 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750913AbeGJE0M (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Jul 2018 00:26:12 -0400
Date: Mon, 9 Jul 2018 23:26:09 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH v2] objtool: move libelf detection to Kconfig from
 Makefile
Message-ID: <20180710042609.zie5fgrvoyusmeod@treble>
References: <1531186516-15764-1-git-send-email-yamada.masahiro@socionext.com>
 <20180710022904.e3oql2ts4qz43bzo@treble>
 <CAK7LNASM+81JkGu5-z8GRZ9+sRyd55gO0G0M5c54zRhE5JhE3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNASM+81JkGu5-z8GRZ9+sRyd55gO0G0M5c54zRhE5JhE3g@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, X86 ML <x86@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Tue, Jul 10, 2018 at 12:47:49PM +0900, Masahiro Yamada wrote:
> Hi.
> 
> 
> 2018-07-10 11:29 GMT+09:00 Josh Poimboeuf <jpoimboe@redhat.com>:
> > On Tue, Jul 10, 2018 at 10:35:16AM +0900, Masahiro Yamada wrote:
> >> Currently, users are allowed to enable STACK_VALIDATION regardless
> >> of the compiler capability.  The top-level Makefile warns or breaks
> >> the build if it turns out that the host compiler cannot link libelf.
> >>
> >> Move the libelf test to Kconfig so that users can enable the feature
> >> only when the host compiler can build the objtool.  The ugly check
> >> in the Makefile will go away.
> >>
> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
> >
> > Actually, looking at this again, I want to rescind my ack.
> >
> > This patches changes the behavior in a subtle (but important) way.
> >
> > Before, if I did "make defconfig", it would *always* choose the ORC
> > unwinder.  Then, if I didn't have libelf-devel, the build would fail and
> > it would tell me what I need to install.
> >
> > But now with this patch, if I do "make defconfig", the generated config
> > actually changes based on what I happen to have installed on my build
> > system.  If I don't have libelf-devel, then it silently chooses the
> > non-default unwinder (frame pointer).
> >
> > This is a subtle difference, but IMO it's dangerous, because it will
> > silently enable the frame pointer unwinder for the majority of new
> > systems, even though it's not the default.
> >
> > I strongly prefer the original behavior, because we really want to
> > encourage people to use the ORC unwinder, even if that means they have
> > to install a package to build it.
> >
> > Also -- in general -- I suspect that silently changing the defaults like
> > this will create a lot of bad surprises.  The output of "make defconfig"
> > should be predictable and not dependent on what RPMs I happen to have
> > installed.
> 
> 
> 
> Actually, we had similar discussion for stack protector.
> 
> 
> First, Kees liked to let the build fail
> instead of disabling the stack protector silently:
> 
> https://lkml.org/lkml/2018/2/9/697
> 
> 
> 
> Linus said:
> But yes, I also reacted to your earlier " It can't silently rewrite it
> to _REGULAR because the compiler support for _STRONG regressed."
> Because it damn well can. If the compiler doesn't support
> -fstack-protector-strong, we can just fall back on -fstack-protector.
> Silently. No extra crazy complex logic for that either.
> 
> (https://lkml.org/lkml/2018/2/10/281)
> 
> 
> 
> I hope this is the same pattern.

I wasn't a part of the -fstack-protector conversation, but I doubt it's
the same pattern.  We're trying to phase out frame pointers, for several
reasons.  One big reason is that they cause a general slowdown across
the entire kernel.

Since we switched the x86_64 default to the ORC unwinder, a lot of
people have switched over.  But this patch will reverse (or at least
slow down) that trend, because almost nobody has the libelf devel
packaged installed by default.  So over time, it will effectively make
frame pointers the default again in many cases.  That's exactly what we
*don't* want to do.  It will also cause people to accidentally re-enable
frame pointers when they thought they had ORC.

-- 
Josh
