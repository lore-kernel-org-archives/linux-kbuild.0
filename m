Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:33498 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751434AbeC1LWk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Mar 2018 07:22:40 -0400
Received: by mail-vk0-f66.google.com with SMTP id j85so1159855vke.0
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Mar 2018 04:22:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-15-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-15-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 28 Mar 2018 04:22:38 -0700
Message-ID: <CAGXu5jK48XYSpga0M-49GPrMT3iud7rqEOD7ZpKQR-MXi=zjWw@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] kconfig: add CC_IS_CLANG and CLANG_VERSION
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> This will be useful to describe the clang version dependency.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

One aspect of clang version checking that may be "weird" (and likely
won't be meaningful for very long as we're about to raise the minimum
gcc version), is that clang claims to be gcc version 4.2 if you look
at #defines. This is already handled in compiler.h, but may be weird
in Kconfig.

Regardless:

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
