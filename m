Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:18684 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937504AbdKREHe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Nov 2017 23:07:34 -0500
MIME-Version: 1.0
In-Reply-To: <1510072307-16819-2-git-send-email-yamada.masahiro@socionext.com>
References: <1510072307-16819-1-git-send-email-yamada.masahiro@socionext.com> <1510072307-16819-2-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 18 Nov 2017 13:06:24 +0900
Message-ID: <CAK7LNASt+4oNw3niSOcM=++Z8D0CF5jy8z1d2oz7Lp=CT2b6tg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: create built-in.o automatically if parent
 directory wants it
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linux-MIPS <linux-mips@linux-mips.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>

2017-11-08 1:31 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> "obj-y += foo/" syntax requires Kbuild to visit the "foo" subdirectory
> and link built-in.o from that directory.  This means foo/Makefile is
> responsible for creating built-in.o even if there is no object to
> link (in this case, built-in.o is an empty archive).
>
> We have had several fixups like commit 4b024242e8a4 ("kbuild: Fix
> linking error built-in.o no such file or directory"), then ended up
> with a complex condition as follows:
>
>   ifneq ($(strip $(obj-y) $(obj-m) $(obj-) $(subdir-m) $(lib-target)),)
>   builtin-target := $(obj)/built-in.o
>   endif
>
> We still have more cases not covered by the above, so we need to add
>   obj- := dummy.o
> in several places just for creating empty built-in.o.
>
> A key point is, the parent Makefile knows whether built-in.o is needed
> or not.  If a subdirectory needs to create built-in.o, its parent can
> tell the fact when Kbuild descends into it.
>
> If non-empty $(need-builtin) flag is passed from the parent, built-in.o
> should be created.  $(obj-y) should be still checked to support the
> single target "%/".  All of ugly tricks will go away.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild/kbuild.



-- 
Best Regards
Masahiro Yamada
