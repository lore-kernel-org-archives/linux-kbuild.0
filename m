Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46963 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727474AbfCRVr0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 17:47:26 -0400
Received: by mail-pg1-f194.google.com with SMTP id a22so12280974pgg.13
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Mar 2019 14:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAG5bF+RvumzKK0E-GAT223jnBvkRe1RN_0J9cGpfPOqCBvfWyw@mail.gmail.com>
In-Reply-To: <CAG5bF+RvumzKK0E-GAT223jnBvkRe1RN_0J9cGpfPOqCBvfWyw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 18 Mar 2019 14:47:13 -0700
Message-ID: <CAKwvOdnms16AC3jPcc_7MXD7QF43dKvHsi+aqmsz0wX-u1GTpA@mail.gmail.com>
Subject: Re: [PATCH] Revert "kbuild: use -Oz instead of -Os when using clang"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Behan Webster <behanw@converseincode.com>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, Manoj Gupta <manojgupta@chromium.org>, Tiancong Wang <tcwang@chromium.org>, Stephen Hines <srhines@google.com>, clang-built-linux@googlegroups.com

On Mon, Mar 18, 2019 at 2:10 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The clang option -Oz enables *aggressive* optimization for size,
> which doesn't necessarily result in smaller images, but can have
> negative impact on performance. Switch back to the less aggressive
> -Os.
>
> This reverts commit 6748cb3c299de1ffbe56733647b01dbcc398c419.

Does scripts/checkpatch.pl complain about this format (full sha, no
title)?  Not sure that necessitates a v2, but if so would be good to
mention that Clang generates excessive calls into libgcc/compiler-rt
at -Oz.  Thanks for the patch and the discussion/sanity check.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 9ef547fc7ffe..191f3ce3cb5e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -667,7 +667,7 @@ KBUILD_CFLAGS       += $(call cc-disable-warning, format-overflow)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, int-in-bool-context)
>
>  ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
> -KBUILD_CFLAGS  += $(call cc-option,-Oz,-Os)
> +KBUILD_CFLAGS  += -Os
>  else
>  KBUILD_CFLAGS   += -O2
>  endif
> --
> 2.21.0.225.g810b269d1ac-goog



-- 
Thanks,
~Nick Desaulniers
