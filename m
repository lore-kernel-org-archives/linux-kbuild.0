Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:34232 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753484AbeFGImz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jun 2018 04:42:55 -0400
MIME-Version: 1.0
In-Reply-To: <1527499328-13213-22-git-send-email-yamada.masahiro@socionext.com>
References: <1527499328-13213-1-git-send-email-yamada.masahiro@socionext.com> <1527499328-13213-22-git-send-email-yamada.masahiro@socionext.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Jun 2018 10:42:53 +0200
Message-ID: <CAMuHMdUDCtnyqydZan9Q-+hOQacWGJrrMbw4LshjYSjn2=yBjw@mail.gmail.com>
Subject: Re: [PATCH v5 21/31] kconfig: show compiler version text in the top comment
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Nicholas Piggin <npiggin@gmail.com>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>

Hi Yamada-san,

On Mon, May 28, 2018 at 11:21 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> The kernel configuration phase is now tightly coupled with the compiler
> in use.  It will be nice to show the compiler information in Kconfig.
>
> The compiler information will be displayed like this:
>
>   $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- config
>   scripts/kconfig/conf  --oldaskconfig Kconfig
>   *
>   * Linux/arm64 4.16.0-rc1 Kernel Configuration
>   *
>   *
>   * Compiler: aarch64-linux-gnu-gcc (Linaro GCC 7.2-2017.11) 7.2.1 20171011
>   *
>   *
>   * General setup
>   *
>   Compile also drivers which will not load (COMPILE_TEST) [N/y/?]
>
> If you use GUI methods such as menuconfig, it will be displayed in the
> top menu.
>
> This is simply implemented by using the 'comment' statement.  So, it
> will be saved into the .config file as well.
>
> This commit has a very important meaning.  If the compiler is upgraded,
> Kconfig must be re-run since different compilers have different sets
> of supported options.
>
> All referenced environments are written to include/config/auto.conf.cmd
> so that any environment change triggers syncconfig, and prompt the user
> to input new values if needed.
>
> With this commit, something like follows will be added to
> include/config/auto.conf.cmd
>
>   ifneq "$(CC_VERSION_TEXT)" "aarch64-linux-gnu-gcc (Linaro GCC 7.2-2017.11) 7.2.1 20171011"
>   include/config/auto.conf: FORCE
>   endif
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>

This is now commit 21c54b774744719c ("kconfig: show compiler version text
in the top comment") upstream.

This commit broke cross-compilation for me:

    $ make ARCH=m68k
    scripts/kconfig/conf  --syncconfig Kconfig
    scripts/kconfig/conf  --syncconfig Kconfig
    scripts/kconfig/conf  --syncconfig Kconfig
    scripts/kconfig/conf  --syncconfig Kconfig
    ...

with O=:

      GEN     ./Makefile
     scripts/kconfig/conf  --syncconfig Kconfig
      GEN     ./Makefile
    scripts/kconfig/conf  --syncconfig Kconfig
      GEN     ./Makefile
    scripts/kconfig/conf  --syncconfig Kconfig
      GEN     ./Makefile
    ...

.config gained (both with/without O=):

    #
    # Compiler: gcc (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609
    #

which is definitely wrong when cross-compiling for m68k.

Reverting the commit, and fixing up the conflicts, fixes the issue for me

Do you have a clue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
