Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:55100 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750793AbdKJG0o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Nov 2017 01:26:44 -0500
Date: Fri, 10 Nov 2017 07:26:40 +0100
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 3/4] kbuild: create object directories simpler and faster
Message-ID: <20171110062640.kjqpo4houbybzjex@gmail.com>
References: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
 <1510242077-8122-4-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510242077-8122-4-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Michal Marek <mmarek@suse.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>


* Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> For the out-of-tree build, scripts/Makefile.build creates output
> directories, but this operation is not efficient.
> 
> scripts/Makefile.lib calculates obj-dirs as follows:
> 
>   obj-dirs := $(dir $(multi-objs) $(obj-y))
> 
> Please notice $(sort ...) is not used here.  Usually the resulted
> obj-dirs is as many "./" as objects.
> 
> For those duplicated paths, the following command is invoked.
> 
>   _dummy := $(foreach d,$(obj-dirs), $(shell [ -d $(d) ] || mkdir -p $(d)))
> 
> Then, the costly shell command is run over and over again.
> 
> I see many points for optimization:
> 
> [1] Use $(sort ...) to cut down duplicated paths before passing them
>     to system call
> [2] Use single $(shell ...) instead of repeating it with $(foreach ...)
>     This will reduce forking.
> [3] We can calculate obj-dirs more simply.  Most of objects are already
>     accumulated in $(targets).  So, $(dir $(targets)) is fine and more
>     comprehensive.
> 
> I also removed bad code in arch/x86/entry/vdso/Makefile.  This is now
> really unnecessary.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  arch/x86/entry/vdso/Makefile |  4 ----
>  scripts/Makefile.build       | 15 ++++++---------
>  scripts/Makefile.host        | 11 -----------
>  scripts/Makefile.lib         |  5 -----
>  4 files changed, 6 insertions(+), 29 deletions(-)

I love not just the speedup, but the diffstat as well ;-)

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
