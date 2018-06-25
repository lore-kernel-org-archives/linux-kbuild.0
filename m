Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934184AbeFYOQK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jun 2018 10:16:10 -0400
Date: Mon, 25 Jun 2018 10:16:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] trace: fix SKIP_STACK_VALIDATION=1 build
Message-ID: <20180625101607.08db48ff@gandalf.local.home>
In-Reply-To: <CAK7LNARngmBXa5w3XFfuA7pEv39vWjJVNJ+3XVLPYd9QLH+f-A@mail.gmail.com>
References: <20180608214746.136554-1-gthelen@google.com>
        <CAK7LNARngmBXa5w3XFfuA7pEv39vWjJVNJ+3XVLPYd9QLH+f-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Greg Thelen <gthelen@google.com>, Andi Kleen <andi@firstfloor.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>, Michal Marek <michal.lkml@markovi.net>

On Sat, 23 Jun 2018 02:42:26 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 2018-06-09 6:47 GMT+09:00 Greg Thelen <gthelen@google.com>:
> > Non gcc-5 builds with CONFIG_STACK_VALIDATION=y and
> > SKIP_STACK_VALIDATION=1 fail.
> > Example output:
> >   /bin/sh: init/.tmp_main.o: Permission denied
> >
> > commit 96f60dfa5819 ("trace: Use -mcount-record for dynamic ftrace"),
> > added a mismatched endif.  This causes cmd_objtool to get mistakenly
> > set.
> >
> > Relocate endif to balance the newly added -record-mcount check.
> >
> > Fixes: 96f60dfa5819 ("trace: Use -mcount-record for dynamic ftrace")
> > Signed-off-by: Greg Thelen <gthelen@google.com>
> > ---  
> 
> Applied to linux-kbuild/fixes. Thanks!
> 
> 

I already pushed this to Linus. As I was the one to mess it up in the
first place ;-) (I think I applied it with some fuzz)

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ed7d40bc67b8353c677b38c6cdddcdc310c0f452

-- Steve
