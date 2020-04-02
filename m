Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50571 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729275AbgDBOYb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 10:24:31 -0400
MIME-Version: 1.0
References: <202004020117.6E434C035@keescook>
In-Reply-To: <202004020117.6E434C035@keescook>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 2 Apr 2020 16:24:36 +0200
Message-ID: <CA+icZUW0R9LDGJ1YjJAB2oWkcEQxCO79xYmdVEoh=P8Fy_AL1A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, linux-kbuild@vger.kernel.org, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, linux-kernel@vger.kernel.org

On Thu, Apr 2, 2020 at 10:18 AM Kees Cook <keescook@chromium.org> wrote:
>
> When doing Clang builds of the kernel, it is possible to link with
> either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> discover this from a running kernel. Add the "$LD -v" output to
> /proc/version.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Hi Kees,

this patch is really really a good one!

I use Clang and LLD to build my Linux-kernels.

For archiving important informations of my latest build I did:

cd linux
readelf -p .comment vmlinux > ../archives/readelf-p-comment_vmlinux.txt
...or...
readelf -p .comment arch/x86/boot/compressed/vmlinux >
../archives/readelf-p-comment_vmlinux-compressed.txt

The output looks like:

String dump of section '.comment':
  [     0]  Linker: LLD 10.0.0
  [    14]  clang version 10.0.0-1

With my next linux-kernel build I will include this one.

Feel free to add any appropriate credits.

Thanks.

Regards,
- Sedat -

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
>
>  vecho() { [ "${quiet}" = "silent_" ] || echo "$@" ; }
>
> @@ -72,7 +73,10 @@ UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
>    printf '#define LINUX_COMPILE_BY "%s"\n' "$LINUX_COMPILE_BY"
>    echo \#define LINUX_COMPILE_HOST \"$LINUX_COMPILE_HOST\"
>
> -  echo \#define LINUX_COMPILER \"`$CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//'`\"
> +  CC_VERSION=$($CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//')
> +  LD_VERSION=$($LD -v | head -n1 | sed 's/(compatible with [^)]*)//' \
> +                     | sed 's/[[:space:]]*$//')
> +  printf '#define LINUX_COMPILER "%s"\n' "$CC_VERSION, $LD_VERSION"
>  } > .tmpcompile
>
>  # Only replace the real compile.h if the new one is different,
> --
> 2.20.1
>
>
> --
> Kees Cook
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/202004020117.6E434C035%40keescook.
