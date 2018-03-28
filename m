Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:45293 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751209AbeC1LYQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Mar 2018 07:24:16 -0400
Received: by mail-ua0-f194.google.com with SMTP id j18so1268174uae.12
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Mar 2018 04:24:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-16-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-16-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 28 Mar 2018 04:24:14 -0700
Message-ID: <CAGXu5jLmyp4Q9VeP-F3N2SJuUxPpo3=2WTUC4vRLX348FwrtUQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] gcov: remove CONFIG_GCOV_FORMAT_AUTODETECT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>

On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> CONFIG_GCOV_FORMAT_AUTODETECT compiles either gcc_3_4.c or gcc_4_7.c
> according to your GCC version.
>
> We can achieve the equivalent behavior by setting reasonable dependency
> with the knowledge of the compiler version.
>
> If GCC older than 4.7 is used, GCOV_FORMAT_3_4 is the default, but users
> are still allowed to select GCOV_FORMAT_4_7 in case the newer format is
> back-ported.
>
> On the other hand, If GCC 4.7 or newer is used, there is no reason to
> use GCOV_FORMAT_3_4, so it should be hidden.
>
> If you down-grade your compiler GCC 4.7 or older, oldconfig/syncconfig
> will display a prompt for the choice because GCOV_FORMAT_3_4 becomes
> visible as a new symbol.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
