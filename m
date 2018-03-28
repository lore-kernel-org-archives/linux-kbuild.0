Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:43103 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752125AbeC1LZj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Mar 2018 07:25:39 -0400
Received: by mail-ua0-f193.google.com with SMTP id u4so1267177uaf.10
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Mar 2018 04:25:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-17-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-17-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 28 Mar 2018 04:25:37 -0700
Message-ID: <CAGXu5j+YCwPjd9ha2hP26Wjho8q4vVA6kzvOjGUROVJxffGekQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] kcov: imply GCC_PLUGINS and GCC_PLUGIN_SANCOV
 instead of select'ing them
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> As Documentation/kbuild/kconfig-language.txt notes, 'select' should be
> used with care - it forces a lower limit of another symbol, ignoring
> the dependency.  In this case, KCOV can select GCC_PLUGINS even if
> 'depends on HAVE_GCC_PLUGINS' is unmet.
>
> 'imply' is modest enough to observe the dependency, and this makes
> sense.  If you enable KCOV, you will probably want to enable
> GCC_PLUGIN_SANCOV, but it should not break the dependency.
>
> I also remove unneeded code, I just happened to notice.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
