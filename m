Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:59815 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752357AbdCPRly (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Mar 2017 13:41:54 -0400
MIME-Version: 1.0
In-Reply-To: <20170316143124.1513546-1-arnd@arndb.de>
References: <CAK8P3a0792yTULUhMi2Tj0KzA_nRznnZ2-vVa9Ga_8pNe5UbNg@mail.gmail.com>
 <20170316143124.1513546-1-arnd@arndb.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 17 Mar 2017 02:41:17 +0900
Message-ID: <CAK7LNATb_9WPoPmFdhqnLaAwU5cJe8Qdq9s7seXtsPjB0vCr=A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix compile time regression
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-03-16 23:31 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> I noticed that a patch I did causes the time for a clean rebuild to
> go up significantly, from 13 to 18 seconds on ARM defconfig, and
> in the worst case forcing a rebuild of every file each time.
>
> The fix is very simple, using a ':=' assignment instead of '='
> to force the cc-disable-warning call to only be evaluated once
> instead of every time.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 3a964fa3a787..e7d4d20deb4e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -381,7 +381,7 @@ LDFLAGS_MODULE  =
>  CFLAGS_KERNEL  =
>  AFLAGS_KERNEL  =
>  LDFLAGS_vmlinux =
> -CFLAGS_GCOV    = -fprofile-arcs -ftest-coverage -fno-tree-loop-im $(call cc-disable-warning,maybe-uninitialized,)
> +CFLAGS_GCOV    := -fprofile-arcs -ftest-coverage -fno-tree-loop-im $(call cc-disable-warning,maybe-uninitialized,)
>  CFLAGS_KCOV    := $(call cc-option,-fsanitize-coverage=trace-pc,)
>
>  ifeq ($(COMPILER),clang)
> --


Squashed into the first patch.


-- 
Best Regards
Masahiro Yamada
