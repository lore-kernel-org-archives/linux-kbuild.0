Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:62287 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1427786AbdDWHN0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Apr 2017 03:13:26 -0400
MIME-Version: 1.0
In-Reply-To: <1492035921-9538-1-git-send-email-yamada.masahiro@socionext.com>
References: <1492035921-9538-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 23 Apr 2017 16:13:20 +0900
Message-ID: <CAK7LNAR6c--9=Wu0zH4dBDXwBnaDt_PJ5=rwjDxwf5Nt4d+SYA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: drop -Wno-unknown-warning-option from clang options
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Behan Webster <behanw@converseincode.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Kees Cook <keescook@chromium.org>, Michael Davidson <md@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-04-13 7:25 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Since commit c3f0d0bc5b01 ("kbuild, LLVMLinux: Add -Werror to
> cc-option to support clang"), cc-option and friends work correctly
> for clang.
>
> However, the combination of -Werror and -Wno-unknown-warning-option
> makes clang happy with any unknown warning options.
>
> Once -Wno-unknown-warning-option is added, any succeeding call of
> cc-disable-warning is evaluated positive, then unknown warning
> options are accepted.  This should be dropped.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Applied to linux-kbuild/kbuild.



-- 
Best Regards
Masahiro Yamada
