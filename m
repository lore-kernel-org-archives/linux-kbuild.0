Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49223 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751054AbeAVPFQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jan 2018 10:05:16 -0500
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com [209.85.217.174]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id w0MF53E6009559
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jan 2018 00:05:04 +0900
Received: by mail-ua0-f174.google.com with SMTP id i15so6012453uak.3
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jan 2018 07:05:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180115230930.8723-1-petr.vorel@gmail.com>
References: <20180115230930.8723-1-petr.vorel@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 23 Jan 2018 00:04:22 +0900
Message-ID: <CAK7LNAStFqZ6F5HS-yXMCAJ3sgM4fkfvFg887Mkr-SBRZnQ13g@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] kconfig: menuconfig make "Selected by:" and
 "Depends on:" readable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>

2018-01-16 8:09 GMT+09:00 Petr Vorel <petr.vorel@gmail.com>:
> rev_dep expressions can get rather unwieldy, especially if a symbol is
> selected by more than a handful of other symbols. I.e. it's possible to
> have near endless expressions like:
>    A && B && !C || D || F && (G || H) || [...]
>
> Chop these expressions into actually readable chunks:
>    - A && B && !C
>    - D
>    - F && (G || H)
>    - [...]
>
> I.e. transform the top level OR tokens into newlines and prepend each
> line with a minus. This makes the "Selected by:" blurb much easier to
> read. For consistency the same is done for "Depends on:" although the
> problem isn't that bad for it. This is done only if there is more than
> one top level OR.
>
> This also prevents trimming too long lines.
>
> Based on idea from Paul Bolle.
>
> Reported-by: Paul Bolle <pebolle@tiscali.nl>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Tested on search USB and General setup -> Kernel compression mode (Gzip) -> Help.
>
> Changes v3->v4:
> * Add split also for "Depends on:". This is done for consistency (reported
>   by Masahiro Yamada). I didn't consider other symbols which call expr_gstr_print()
>   as reasonable candidates (i.e. "Implies:" and "Range : ").
> * Add new line and hyphen only when there are more top level OR than one.
> ---



How much did you check the call graph of expr_print()?
This function is called from various places.

Probably, the format will be broken here are there.


For example, here is an example of breakage.

-----------------(test case)-------------
config FOO
       bool
       default y
       select BAR

config BAR
       bool "foo"
       depends on BAZ || QUX
-----------------(test case end)----------




Without your patch,

$ make alldefconfig
scripts/kconfig/conf  --alldefconfig Kconfig
warning: (FOO) selects BAR which has unmet direct dependencies (BAZ || QUX)
#
# configuration written to .config
#


Then, with your patch,

$ make alldefconfig
scripts/kconfig/conf  --alldefconfig Kconfig
warning: (FOO) selects BAR which has unmet direct dependencies (BAZ
  - QUX)
#
# configuration written to .config
#




One more thing.
This patch improves the readability of "selected by" and "implied by",
but it is questionable for "depends on".


  Depends on:
  - BAR [=y]
  - BAZ [=y]

... means "depends on BAR && BAZ",
but it might be confusing with

   depends on BAR
   depends on BAZ

... which is equivalent to "depends on BAR || BAZ".



The idea seems useful, but I want to see this only where appropriate.


-- 
Best Regards
Masahiro Yamada
