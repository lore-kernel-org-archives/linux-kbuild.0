Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:34608 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751932AbeC1Den (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 23:34:43 -0400
Received: by mail-ua0-f194.google.com with SMTP id l21so678929uak.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Mar 2018 20:34:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-6-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-6-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 27 Mar 2018 20:34:41 -0700
Message-ID: <CAGXu5jLASUx_SJV-WfKLq5wPXeDpJzBOKneG8q_TjA4jY9w0aA@mail.gmail.com>
Subject: Re: [PATCH v2 05/21] kconfig: remove string expansion in file_lookup()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
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

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
