Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:35816 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751341AbeC1Lrw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Mar 2018 07:47:52 -0400
Received: by mail-vk0-f66.google.com with SMTP id h134so1198092vke.2
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Mar 2018 04:47:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-21-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-21-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 28 Mar 2018 04:47:50 -0700
Message-ID: <CAGXu5jJQfYXqsF7pcRsUtY9Mrw+Yi_Y6+CBAwDrQT_4kpUiHDA@mail.gmail.com>
Subject: Re: [PATCH v2 20/21] gcc-plugins: enable GCC_PLUGINS for COMPILE_TEST
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> The plugin availability is checked in Kconfig, so all{yes,mod}config
> will not be bothered.  Remove 'depends on !COMPILE_TEST'.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - Remove more 'depends on'
>
>  arch/Kconfig | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 88cc925..b07094c 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -414,7 +414,6 @@ menuconfig GCC_PLUGINS
>         bool "GCC plugins"
>         depends on HAVE_GCC_PLUGINS
>         depends on $(success $srctree/scripts/gcc-plugin.sh $HOSTCXX $CC)
> -       depends on !COMPILE_TEST
>         help
>           GCC plugins are loadable modules that provide extra features to the
>           compiler. They are useful for runtime instrumentation and static analysis.

This one is nice, yes! We get coverage for anyone with plugin support.

> @@ -424,7 +423,6 @@ menuconfig GCC_PLUGINS
>  config GCC_PLUGIN_CYC_COMPLEXITY
>         bool "Compute the cyclomatic complexity of a function" if EXPERT
>         depends on GCC_PLUGINS
> -       depends on !COMPILE_TEST
>         help
>           The complexity M of a function's control flow graph is defined as:
>            M = E - N + 2P
> @@ -487,7 +485,6 @@ config GCC_PLUGIN_STRUCTLEAK_BYREF_ALL
>  config GCC_PLUGIN_STRUCTLEAK_VERBOSE
>         bool "Report forcefully initialized variables"
>         depends on GCC_PLUGIN_STRUCTLEAK
> -       depends on !COMPILE_TEST
>         help
>           This option will cause a warning to be printed each time the
>           structleak plugin finds a variable it thinks needs to be
> @@ -527,7 +524,6 @@ config GCC_PLUGIN_RANDSTRUCT
>  config GCC_PLUGIN_RANDSTRUCT_PERFORMANCE
>         bool "Use cacheline-aware structure randomization"
>         depends on GCC_PLUGIN_RANDSTRUCT
> -       depends on !COMPILE_TEST
>         help
>           If you say Y here, the RANDSTRUCT randomization will make a
>           best effort at restricting randomization to cacheline-sized

All three of these, though, please leave as they were. They're either
needlessly noisy for COMPILE_TEST (GCC_PLUGIN_CYC_COMPLEXITY and
*_VERBOSE), or reduce the COMPILE_TEST coverage
(GCC_PLUGIN_RANDSTRUCT_PERFORMANCE).

(And perhaps a comment is needed to explain these to avoid confusion
in the future?)

-Kees

-- 
Kees Cook
Pixel Security
