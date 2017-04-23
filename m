Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:18875 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1427613AbdDWGyG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Apr 2017 02:54:06 -0400
MIME-Version: 1.0
In-Reply-To: <1492150646-20848-1-git-send-email-yamada.masahiro@socionext.com>
References: <1492150646-20848-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 23 Apr 2017 15:53:44 +0900
Message-ID: <CAK7LNAR5nc=jsG+6Q59uHfu_W-qV4q2k5fx=AdduUV283OkY3g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: avoid conflict between -ffunction-sections and
 -pg on gcc-4.7
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-04-14 15:17 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Arnd Bergmann reported:
>   "When ftrace is enabled and we build with gcc-4.7 or older, we
>   get a warning for each file on architectures that select
>   CONFIG_LD_DEAD_CODE_DATA_ELIMINATION:
>
>   warning: -ffunction-sections disabled; it makes profiling impossible [enabled by default]
>   "
>
> Since commit c3f0d0bc5b01 ("kbuild, LLVMLinux: Add -Werror to
> cc-option to support clang"), warnings are treated as errors in
> cc-option checks.  CC_FLAGS_FTRACE is blindly added to KBUILD_CFLAGS,
> so $(call cc-option,-ffunction-sections,) should be moved below it
> in order to detect the conflict between the two options.
>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Applied to linux-kbuild/kbuild.


-- 
Best Regards
Masahiro Yamada
