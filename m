Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:25345 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751172AbdJNDRt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Oct 2017 23:17:49 -0400
MIME-Version: 1.0
In-Reply-To: <1507802164-31614-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507802164-31614-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 14 Oct 2017 12:17:01 +0900
Message-ID: <CAK7LNARN_Ofzog5J1XWoW3dB6_m2wfVuFPYjvFkfdb0pnBR9gA@mail.gmail.com>
Subject: Re: [PATCH 0/2] kbuild: use relative path from $(srctree) instead of __FILE__
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Joe Perches <joe@perches.com>, Tom Rini <trini@konsulko.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, James Hogan <jhogan@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <dl9pf@gmx.de>, Michal Marek <michal.lkml@markovi.net>, Douglas Anderson <dianders@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>, Mark Charlebois <charlebm@gmail.com>

2017-10-12 18:56 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>
> Kbuild works in objtree, not in srctree.  So, __FILE__ is prefixed
> with $(srctree)/ for out-of-tree build.
>
> For example, WARN_ON() will look as follows if you built your kernel
> out of source tree:
>
> WARNING: CPU: 1 PID: 1 at /path/to/build/directory/arch/arm64/kernel/foo.c:...
>
> With this series, it will always look like follows regardless of O= option.
>
> WARNING: CPU: 1 PID: 1 at arch/arm64/kernel/foo.c:...
>
> If GCC does not support -Wno-builtin-macro-redefined (i.e. gcc version < 4.4),
> the output is prefixed with absolute path.
>

I expect to replace __FILE__ with its relative path,
but actually it replaces __FILE__ with relative path of __BASE_FILE__.
This will change the behavior in several places.

I take back this series.


-- 
Best Regards
Masahiro Yamada
