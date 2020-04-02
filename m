Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:58726 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732625AbgDBRBg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 13:01:36 -0400
MIME-Version: 1.0
References: <202004020117.6E434C035@keescook>
In-Reply-To: <202004020117.6E434C035@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 3 Apr 2020 02:00:52 +0900
Message-ID: <CAK7LNAQGTAgtADfY4H-k8X1J9nTMeOWvo8ZFfrUSHQUbhgcLKw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Kees,

On Thu, Apr 2, 2020 at 5:18 PM Kees Cook <keescook@chromium.org> wrote:
>
> When doing Clang builds of the kernel, it is possible to link with
> either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> discover this from a running kernel. Add the "$LD -v" output to
> /proc/version.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  init/Makefile       | 2 +-
>  scripts/mkcompile_h | 8 ++++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/init/Makefile b/init/Makefile
> index 6246a06364d0..82c15bdb42d7 100644
> --- a/init/Makefile
> +++ b/init/Makefile
> @@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
>         @$($(quiet)chk_compile.h)
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@   \
>         "$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"    \
> -       "$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)"
> +       "$(CONFIG_PREEMPT_RT)" "$(LD)" "$(CC) $(KBUILD_CFLAGS)"
> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index 3a5a4b210c86..f98c07709370 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -6,7 +6,8 @@ ARCH=$2
>  SMP=$3
>  PREEMPT=$4
>  PREEMPT_RT=$5
> -CC=$6
> +LD=$6
> +CC=$7


Just a nit.

If you just append 'LD',
you do not need to touch the 'CC=$6' line.


If you do not mind, I will fold the following
on top of your patch.




--- a/init/Makefile
+++ b/init/Makefile
@@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
        @$($(quiet)chk_compile.h)
        $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@   \
        "$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"    \
-       "$(CONFIG_PREEMPT_RT)" "$(LD)" "$(CC) $(KBUILD_CFLAGS)"
+       "$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)" "$(LD)"
diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 8b38a96163e2..5b80a4699740 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -6,8 +6,8 @@ ARCH=$2
 SMP=$3
 PREEMPT=$4
 PREEMPT_RT=$5
-LD=$6
-CC=$7
+CC=$6
+LD=$7






--
Best Regards
Masahiro Yamada
