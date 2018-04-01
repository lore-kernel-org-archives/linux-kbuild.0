Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:38175 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752976AbeDAC7Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 31 Mar 2018 22:59:25 -0400
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-7-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-7-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sun, 1 Apr 2018 04:59:24 +0200
Message-ID: <CAFkk2KQK9vV+Xr=AvM09gEmEtSHsihpx_CYA6Qys6Gs7OrpbuQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/21] kconfig: remove string expansion for mainmenu
 after yyparse()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Mar 27, 2018 at 7:29 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Now that environments are expanded in the lexer, conf_parse() does
> not need to explicitly expand $ARCH and $KERNELVERSION in the mainmenu.
>
> The hack introduced by commit 0724a7c32a54 ("kconfig: Don't leak
> main menus during parsing") can go away.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
