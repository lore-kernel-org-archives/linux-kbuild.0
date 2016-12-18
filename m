Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:33103 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751936AbcLROO5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Dec 2016 09:14:57 -0500
MIME-Version: 1.0
In-Reply-To: <20161216092503.2654754-1-arnd@arndb.de>
References: <20161216092503.2654754-1-arnd@arndb.de>
From: Namhyung Kim <namhyung.with.foss@gmail.com>
Date: Sun, 18 Dec 2016 23:14:56 +0900
Message-ID: <CADWwUUaBRajmyKO+JR+DZqPj=yVtJX_4neKQaUPub+hjW4Ps=Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: disable -ffunction-sections on gcc-4.7 with ftrace
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Namhyung Kim <namhyung@kernel.org>

Hi,

On Fri, Dec 16, 2016 at 6:24 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> When ftrace is enabled and we build with gcc-4.7 or older, we
> get a warning for each file on architectures that select
> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION:
>
> warning: -ffunction-sections disabled; it makes profiling impossible [enabled by default]
>
> This turns off function sections in that specific case, leaving
> it enabled for all other configurations.
>
> Fixes: b67067f1176d ("kbuild: allow archs to select link dead code/data elimination")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 4fb4b889c862..7dfd0aa4f3f7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -638,7 +638,11 @@ KBUILD_CFLAGS      += $(call cc-option,-fno-delete-null-pointer-checks,)
>  KBUILD_CFLAGS  += $(call cc-disable-warning,frame-address,)
>
>  ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
> +ifdef CONFIG_FUNCTION_TRACER
> +KBUILD_CFLAGS  += $(call cc-ifversion, -ge,0409,$(call cc-option,-ffunction-sections,))

s/0409/0408/ ?

Thanks,
Namhyung


> +else
>  KBUILD_CFLAGS  += $(call cc-option,-ffunction-sections,)
> +endif
>  KBUILD_CFLAGS  += $(call cc-option,-fdata-sections,)
>  endif
>
> --
> 2.9.0
>
