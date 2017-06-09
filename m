Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:61078 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751673AbdFIQQv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2017 12:16:51 -0400
MIME-Version: 1.0
In-Reply-To: <20170601145707.590629-1-arnd@arndb.de>
References: <20170601145707.590629-1-arnd@arndb.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 10 Jun 2017 01:16:34 +0900
Message-ID: <CAK7LNARcvevZMEj2P=3dss3_qfeGd-tjVU4_tZ3efu4c+CmfXw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: speed up checksyscalls.sh
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

2017-06-01 23:57 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> checksyscalls.sh is run at every "make" run while building the kernel,
> even if no files have changed. I looked at where we spend time in
> a trivial empty rebuild and found checksyscalls.sh to be a source
> of noticeable overhead, as it spawns a lot of child processes just
> to call 'cat' copying from stdin to stdout, once for each of the
> over 400 x86 syscalls.
>
> Using a shell-builtin (echo) instead of the external command gives
> us a 13x speedup:
>
>     Before                 After
> real    0m1.018s       real     0m0.077s
> user    0m0.068s       user     0m0.048s
> sys     0m0.156s       sys      0m0.024s
>
> The time it took to rebuild a single file on my machine dropped
> from 5.5 seconds to 4.5 seconds.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to linux-kbuild/kbuild.  Thanks!




-- 
Best Regards
Masahiro Yamada
