Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:32094 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751558AbdFIQeZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2017 12:34:25 -0400
MIME-Version: 1.0
In-Reply-To: <1496733328-22521-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496733328-22521-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 10 Jun 2017 01:34:11 +0900
Message-ID: <CAK7LNATMMiTrSqXgjAHuVDOSgDYH77UpR2mAaTazEABVzxhKYg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove duplicated arch/*/include/generated/uapi
 include path
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.com>, Arnd Bergmann <arnd@arndb.de>, James Hogan <james.hogan@imgtec.com>, Florian Fainelli <f.fainelli@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-06-06 16:15 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Commit 90ac086bca10 ("Makefile: include arch/*/include/generated/uapi
> before .../generated") introduced this for bisect'ability.  The commit
> chose to promote arch/*/include/generated/uapi in the search path
> rather than cleaning stale headers.
>
> After all, we found that approach was not enough, and ended up with
> cleaning stale headers by commit cda2c65f981d ("kbuild: Remove stale
> asm-generic wrappers").
>
> So, the extra search path is no longer needed because Kbuild invokes
> scripts/Makefile.asm-generic and remove stale headers before it starts
> descending.
>
> This commit is also reverting commit dc33db7c338e ("Kbuild: avoid
> duplicate include path") because we have no more duplicated path.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Applied to linux-kbuild/kbuild.



-- 
Best Regards
Masahiro Yamada
