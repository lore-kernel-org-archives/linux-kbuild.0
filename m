Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:36961 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752754AbeDACwD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 31 Mar 2018 22:52:03 -0400
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-6-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-6-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sun, 1 Apr 2018 04:52:02 +0200
Message-ID: <CAFkk2KSiy+Q_KrQBO8AQxg9PQdoQ5maSMeP64XapJdBfePdQhA@mail.gmail.com>
Subject: Re: [PATCH v2 05/21] kconfig: remove string expansion in file_lookup()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Mar 27, 2018 at 7:29 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> There are two callers of file_lookup().
>
> [1] zconf_initscan()
>     This is used to open the first Kconfig.  However, it cannot
>     contain environments in the file path because zconf_fopen() is
>     called before file_lookup().  By swapping the call order,
>     KBUILD_KCONFIG would be able to contain environments, but I do
>     not see practical benefits to support it.
>
> [2] zconf_nextfile()
>     This is used to open the next file from 'source' statement like
>         source "arch/$SRCARCH/Kconfig"
>     but this has already been expanded in the lexer phase.
>
> So, file_lookup() does not need to expand the given path.
>
> By the way, file_lookup() was already buggy; it expanded a given path,
> but it used the path before expansion for look-up:
>         if (!strcmp(name, file->name)) {
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

s/environments/environment variables/

Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
