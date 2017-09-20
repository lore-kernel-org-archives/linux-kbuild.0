Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:37474 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751391AbdITO0Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 10:26:25 -0400
Received: by mail-wr0-f193.google.com with SMTP id u48so1600917wrf.4
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Sep 2017 07:26:24 -0700 (PDT)
Date: Wed, 20 Sep 2017 16:26:20 +0200
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH v3 1/1] kconfig: menuconfig make "selected by:" readable
Message-ID: <20170920142619.co2d6onsntz2ynjt@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20170223131008.13705-1-pvorel@suse.cz>
 <20170403093545.ebn5lawttpfwbpbl@x230>
 <CAK7LNAQ0Az05tnvxSnMdKZh0U4r-1k7U+PKhmtZ5BGwxCFng5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ0Az05tnvxSnMdKZh0U4r-1k7U+PKhmtZ5BGwxCFng5w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Petr Vorel <pvorel@suse.cz>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>, Michal Marek <mmarek@suse.cz>, yann.morin.1998@free.fr

Hi Masahiro,

> Hi Petr,

> 2017-04-03 18:35 GMT+09:00 Petr Vorel <pvorel@suse.cz>:
> > Hi,

> >> rev_dep expressions can get rather unwieldy, especially if a symbol is
> >> selected by more than a handful of other symbols. Ie, it's possible to
> >> have near endless expressions like:
> >>    A && B && !C || D || F && (G || H) || [...]

> >> Chop these expressions into actually readable chunks:
> >>    - A && B && !C
> >>    - D
> >>    - F && (G || H)
> >>    - [...]

> >> Ie, transform the top level "||" tokens into newlines and prepend each
> >> line with a minus. This makes the "Selected by:" blurb much easier to
> >> read.

> >> This also prevents trimming too long lines.

> >> Based on patch from Paul Bolle.
<snip>

> > Any comment on this patch, please?


> I noticed you added me in the To: list.
Thank you for your comments.
I'm sorry, it took me rather long time to reply.

> Basically I think this patch is a nice idea,
> but I am not a Kconfig maintainer.  Sorry.
> (I could pick up a really trivial one via kbuild tree somehow,
> but I want this one to be handled by a person with expertise in the area.)

> Yann E. MORIN is the Kconfig maintainer, but he has been
> silent for a few years. I guess Kconfig needs a new maintainer.
Well, Yann is still listed in MAINTAINERS file, even he's inactive (according to the date
of his git tree).


> Please take my comment just as a Kconfig user's point of view.

> The git-log only mentions "select", but I notice this patch
> also changes "depends on" format in a bit different way.

> For example,

> General setup  --->
>      Kernel compression mode (Gzip)  --->


> shows its help like this:

>   Depends on: HAVE_KERNEL_GZIP  [=y]
>   - HAVE_KERNEL_BZIP2 [=n]
>   - HAVE_KERNEL_LZMA [=y]
>   - HAVE_KERNEL_XZ [=y]
>   - HAVE_KERNEL_LZO [=y]
>   - HAVE_KERNEL_LZ4 [=y]

> (the first dependency in the same line in the "Depends on")

You're right, I overlooked it. Do you think it makes sense use it also for "Depends on"
section?


Kind regards,
Petr
