Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:37126 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933857AbdC3QDb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Mar 2017 12:03:31 -0400
MIME-Version: 1.0
In-Reply-To: <20170328011909.150513-1-mka@chromium.org>
References: <20170328011909.150513-1-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 31 Mar 2017 01:03:02 +0900
Message-ID: <CAK7LNATU+JNx2eZCTuqyws=CQL3Z2p6QJ7Oa0DNMvxbNJNH4Jg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use -Oz instead of -Os when using clang
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Behan Webster <behanw@converseincode.com>, Greg Hackmann <ghackmann@google.com>, Grant Grundler <grundler@chromium.org>, Michael Davidson <md@google.com>, Peter Foley <pefoley2@pefoley.com>

2017-03-28 10:19 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> This generates smaller resulting object code when compiled with clang.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index b2faa9319372..66bcdbf58371 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -638,7 +638,8 @@ KBUILD_CFLAGS       += $(call cc-option,-fdata-sections,)
>  endif
>
>  ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
> -KBUILD_CFLAGS  += -Os $(call cc-disable-warning,maybe-uninitialized,)
> +KBUILD_CFLAGS  += $(call cc-option,-Oz,-Os)
> +KBUILD_CFLAGS  += $(call cc-disable-warning,maybe-uninitialized,)
>  else
>  ifdef CONFIG_PROFILE_ALL_BRANCHES
>  KBUILD_CFLAGS  += -O2 $(call cc-disable-warning,maybe-uninitialized,)
> --
> 2.12.2.564.g063fe858b8-goog
>



This is the same as the following commit in LLVMLinux
except Author/Signed-off-by.

Who should the authorship really belong to?



commit 186e62808239c603bfa308d5ea994a10d67bb409
Author: Behan Webster <behanw@converseincode.com>
Date:   Thu Oct 16 14:28:54 2014 +0200

    LLVMLinux: use -Oz instead of -Os when using clang

    This generates smaller resulting object code when compiled with clang.

    Signed-off-by: Behan Webster <behanw@converseincode.com>


-- 
Best Regards
Masahiro Yamada
