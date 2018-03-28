Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:42380 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751398AbeC1Dfd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 23:35:33 -0400
Received: by mail-vk0-f68.google.com with SMTP id y127so595869vky.9
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Mar 2018 20:35:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-7-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-7-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 27 Mar 2018 20:35:31 -0700
Message-ID: <CAGXu5jK-MtuYre2LB7=9ewFDPntv6p03PCmra9cQW57f293rTA@mail.gmail.com>
Subject: Re: [PATCH v2 06/21] kconfig: remove string expansion for mainmenu
 after yyparse()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Now that environments are expanded in the lexer, conf_parse() does
> not need to explicitly expand $ARCH and $KERNELVERSION in the mainmenu.
>
> The hack introduced by commit 0724a7c32a54 ("kconfig: Don't leak
> main menus during parsing") can go away.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
