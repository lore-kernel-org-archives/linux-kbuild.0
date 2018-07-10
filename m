Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46220 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754463AbeGJC3H (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jul 2018 22:29:07 -0400
Date: Mon, 9 Jul 2018 21:29:04 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH v2] objtool: move libelf detection to Kconfig from
 Makefile
Message-ID: <20180710022904.e3oql2ts4qz43bzo@treble>
References: <1531186516-15764-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1531186516-15764-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>

On Tue, Jul 10, 2018 at 10:35:16AM +0900, Masahiro Yamada wrote:
> Currently, users are allowed to enable STACK_VALIDATION regardless
> of the compiler capability.  The top-level Makefile warns or breaks
> the build if it turns out that the host compiler cannot link libelf.
> 
> Move the libelf test to Kconfig so that users can enable the feature
> only when the host compiler can build the objtool.  The ugly check
> in the Makefile will go away.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

Actually, looking at this again, I want to rescind my ack.

This patches changes the behavior in a subtle (but important) way.

Before, if I did "make defconfig", it would *always* choose the ORC
unwinder.  Then, if I didn't have libelf-devel, the build would fail and
it would tell me what I need to install.

But now with this patch, if I do "make defconfig", the generated config
actually changes based on what I happen to have installed on my build
system.  If I don't have libelf-devel, then it silently chooses the
non-default unwinder (frame pointer).

This is a subtle difference, but IMO it's dangerous, because it will
silently enable the frame pointer unwinder for the majority of new
systems, even though it's not the default.

I strongly prefer the original behavior, because we really want to
encourage people to use the ORC unwinder, even if that means they have
to install a package to build it.

Also -- in general -- I suspect that silently changing the defaults like
this will create a lot of bad surprises.  The output of "make defconfig"
should be predictable and not dependent on what RPMs I happen to have
installed.

-- 
Josh
