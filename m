Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:42691 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750979AbdJRQyS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Oct 2017 12:54:18 -0400
MIME-Version: 1.0
In-Reply-To: <1507800145-29563-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507800145-29563-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 19 Oct 2017 01:53:24 +0900
Message-ID: <CAK7LNATb66XMABK91ZoEpZSekpcROtPEO+KjSBYZ+OOy7QoHuA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: do not call cc-option before KBUILD_CFLAGS initialization
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-12 18:22 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Some $(call cc-option,...) are invoked very early, even before
> KBUILD_CFLAGS, etc. are initialized.
>
> The returned string from $(call cc-option,...) depends on
> KBUILD_CPPFLAGS, KBUILD_CFLAGS, and GCC_PLUGINS_CFLAGS.
>
> Since they are exported, they are not empty when the top Makefile
> is recursively invoked.
>
> The recursion occurs in several places.  For example, the top
> Makefile invokes itself for silentoldconfig.  "make tinyconfig",
> "make rpm-pkg" are the cases, too.
>
> In those cases, the second call of cc-option from the same line
> runs a different shell command due to non-pristine KBUILD_CFLAGS.
>
> To get the same result all the time, KBUILD_* and GCC_PLUGINS_CFLAGS
> must be initialized before any call of cc-option.  This avoids
> garbage data in the .cache.mk file.
>
> Move all calls of cc-option below the config targets because target
> compiler flags are unnecessary for Kconfig.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild/kbuild.



-- 
Best Regards
Masahiro Yamada
