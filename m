Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:49264 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbgD0Pae (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Apr 2020 11:30:34 -0400
MIME-Version: 1.0
References: <20200423142354.312088-1-masahiroy@kernel.org> <20200423142354.312088-4-masahiroy@kernel.org>
In-Reply-To: <20200423142354.312088-4-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 28 Apr 2020 00:29:41 +0900
Message-ID: <CAK7LNASMXV6F_LpEr3AhAJSNt8TAGHDMxR4XFQ7L7Ha=__Dh8A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] kbuild: use CONFIG_CC_VERSION_TEXT to construct
 LINUX_COMPILER macro
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Apr 23, 2020 at 11:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> scripts/mkcompile_h runs $(CC) just for getting the version string.
> Re-use CONFIG_CC_VERSION_TEXT to optimize it.
>
> For GCC, this slightly changes the version string. I do not think it
> is a big deal as we do not have the defined format for LINUX_COMPILER.
> In fact, the recent commit 4dcc9a88448a ("kbuild: mkcompile_h:
> Include $LD version in /proc/version") added the linker version.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - new patch
>
>  init/Makefile       | 2 +-
>  scripts/mkcompile_h | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/init/Makefile b/init/Makefile
> index d45e967483b2..30c7345e4fe2 100644
> --- a/init/Makefile
> +++ b/init/Makefile
> @@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
>         @$($(quiet)chk_compile.h)
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@   \
>         "$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"    \
> -       "$(CONFIG_PREEMPT_RT)" "$(CC)" "$(LD)"
> +       "$(CONFIG_PREEMPT_RT)" "$(CONFIG_CC_VERSION_TEXT)" "$(LD)"


This causes a build error.

I will fix it up as follows:




diff --git a/init/Makefile b/init/Makefile
index 30c7345e4fe2..57499b1ff471 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
        @$($(quiet)chk_compile.h)
        $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@   \
        "$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"    \
-       "$(CONFIG_PREEMPT_RT)" "$(CONFIG_CC_VERSION_TEXT)" "$(LD)"

+       "$(CONFIG_PREEMPT_RT)" $(CONFIG_CC_VERSION_TEXT) "$(LD)"




> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index 5b80a4699740..baf3ab8d9d49 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -6,7 +6,7 @@ ARCH=$2
>  SMP=$3
>  PREEMPT=$4
>  PREEMPT_RT=$5
> -CC=$6
> +CC_VERSION="$6"
>  LD=$7
>
>  vecho() { [ "${quiet}" = "silent_" ] || echo "$@" ; }
> @@ -62,7 +62,6 @@ UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
>    printf '#define LINUX_COMPILE_BY "%s"\n' "$LINUX_COMPILE_BY"
>    echo \#define LINUX_COMPILE_HOST \"$LINUX_COMPILE_HOST\"
>
> -  CC_VERSION=$($CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//')
>    LD_VERSION=$($LD -v | head -n1 | sed 's/(compatible with [^)]*)//' \
>                       | sed 's/[[:space:]]*$//')
>    printf '#define LINUX_COMPILER "%s"\n' "$CC_VERSION, $LD_VERSION"
> --
> 2.25.1
>


--
Best Regards
Masahiro Yamada
