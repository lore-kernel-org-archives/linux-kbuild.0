Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:46509 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753647AbdKJSqz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Nov 2017 13:46:55 -0500
Received: by mail-ua0-f194.google.com with SMTP id w47so3873698uah.3
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Nov 2017 10:46:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1510242077-8122-4-git-send-email-yamada.masahiro@socionext.com>
References: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com> <1510242077-8122-4-git-send-email-yamada.masahiro@socionext.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 Nov 2017 10:46:53 -0800
Message-ID: <CAD=FV=VTc25vp94=1+oB+rabaX3uGCQXsGJ6jf7LGdVd79sn0g@mail.gmail.com>
Subject: Re: [PATCH 3/4] kbuild: create object directories simpler and faster
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>

Hi,

On Thu, Nov 9, 2017 at 7:41 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
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

I don't think I'm familiar enough with the full kbuild system to add a
reviewed-by tag, but I looked this over and it seems like a nice idea
to me.

I tested this on my own machine which does do out of tree build and it
did provide a speedup.  I didn't run a ton of measurements, but it
appeared to save something like .5 seconds on a full "no-op" emerge
for me (bringing it down from ~28.5 seconds to 28 seconds).  Things
also seem to be working for me with this patch, though I'm only
testing on my own workstation and not across any time of farm.  In any
case:

Tested-by: Douglas Anderson <dianders@chromium.org>
