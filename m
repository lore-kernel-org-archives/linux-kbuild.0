Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:40746 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751187AbeC1D0n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 23:26:43 -0400
Received: by mail-vk0-f66.google.com with SMTP id x5so593006vkd.7
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Mar 2018 20:26:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-2-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-2-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 27 Mar 2018 20:26:41 -0700
Message-ID: <CAGXu5jJBePX5b6zbSa5rM=ouFgSeLvqxEg3kxTViKdnOukmnGA@mail.gmail.com>
Subject: Re: [PATCH v2 01/21] kbuild: remove kbuild cache
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> The kbuild cache was introduced to remember the result of shell
> commands, some of which are expensive to compute, such as
> $(call cc-option,...).
>
> However, this turned out not so clever as I had first expected.
> Actually, it is problematic.  For example, "$(CC) -print-file-name"
> is cached.  If the compiler is updated, the stale search path causes
> build error, which is difficult to figure out.  Another problem
> scenario is cache files could be touched while install targets are
> running under the root permission.  We can patch them if desired,
> but the build infrastructure is getting uglier and uglier.
>
> Now, we are going to move compiler flag tests to the configuration
> phase.  If this is completed, the result of compiler tests will be
> naturally cached in the .config file.  We will not have performance
> issues of incremental building since this testing only happens at
> Kconfig time.
>
> To start this work with a cleaner code base, remove the kbuild
> cache first.
>
> Revert the following commits:
> Commit 9a234a2e3843 ("kbuild: create directory for make cache only when necessary")
> Commit e17c400ae194 ("kbuild: shrink .cache.mk when it exceeds 1000 lines")
> Commit 4e56207130ed ("kbuild: Cache a few more calls to the compiler")
> Commit 3298b690b21c ("kbuild: Add a cache for generated variables")
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
