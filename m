Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:21287 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751259AbeDEOvT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Apr 2018 10:51:19 -0400
MIME-Version: 1.0
In-Reply-To: <1522383326-3880-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522383326-3880-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 5 Apr 2018 23:50:25 +0900
Message-ID: <CAK7LNAR7qOTYnK3JEShhVo807mMwm9-DiSB2yZrKa4vr+BBD1g@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: use -fmacro-prefix-map to make __FILE__ a
 relative path
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Tom Rini <trini@konsulko.com>, Joe Perches <joe@perches.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-03-30 13:15 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The __FILE__ macro is used everywhere in the kernel to locate the file
> printing the log message, such as WARN_ON(), etc.  If the kernel is
> built out of tree, this can be a long absolute path, like this:
>
>   WARNING: CPU: 1 PID: 1 at /path/to/build/directory/arch/arm64/kernel/foo.c:...
>
> This is because Kbuild runs in the objtree instead of the srctree,
> then __FILE__ is expanded to a file path prefixed with $(srctree)/.
>
> Commit 9da0763bdd82 ("kbuild: Use relative path when building in a
> subdir of the source tree") improved this to some extent; $(srctree)
> becomes ".." if the objtree is a child of the srctree.
>
> For other cases of out-of-tree build, __FILE__ is still the absolute
> path.  It also means the kernel image depends on where it was built.
>
> A brand-new option from GCC, -fmacro-prefix-map, solves this problem.
> If your compiler supports it, __FILE__ is the relative path from the
> srctree regardless of O= option.  This provides more readable log and
> more reproducible builds.
>
> Please note __FILE__ is always an absolute path for external modules.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> I tested this on GCC 8.
> (not released yet, but you can get the source code from the trunk.)


Applied to linux-kbuild.



-- 
Best Regards
Masahiro Yamada
