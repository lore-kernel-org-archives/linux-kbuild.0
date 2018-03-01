Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:42310 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031531AbeCAPDe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Mar 2018 10:03:34 -0500
MIME-Version: 1.0
In-Reply-To: <1518806331-7101-4-git-send-email-yamada.masahiro@socionext.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com> <1518806331-7101-4-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 2 Mar 2018 00:02:46 +0900
Message-ID: <CAK7LNAT5TT0qcnVk3yMATvw=g_LwLPJ36pZBWJhTF=aQ3aSu4A@mail.gmail.com>
Subject: Re: [PATCH 03/23] kconfig: add xstrdup() helper
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

2018-02-17 3:38 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> We already have xmalloc(), xcalloc(), and xrealloc(().  Add xstrdup()
> as well to save tedious error handling.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


This is a trivial patch,
so I will pick it up now.




-- 
Best Regards
Masahiro Yamada
