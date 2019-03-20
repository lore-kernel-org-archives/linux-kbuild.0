Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:42104 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfCTN3e (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Mar 2019 09:29:34 -0400
MIME-Version: 1.0
References: <CAG5bF+RvumzKK0E-GAT223jnBvkRe1RN_0J9cGpfPOqCBvfWyw@mail.gmail.com>
In-Reply-To: <CAG5bF+RvumzKK0E-GAT223jnBvkRe1RN_0J9cGpfPOqCBvfWyw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 20 Mar 2019 22:28:43 +0900
Message-ID: <CAK7LNAT3_YA4+cdcJGzgpZ_QcL-LxfFNOpuL7tibGvuLo4CHfA@mail.gmail.com>
Subject: Re: [PATCH] Revert "kbuild: use -Oz instead of -Os when using clang"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Behan Webster <behanw@converseincode.com>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, Nick Desaulniers <ndesaulniers@google.com>, Manoj Gupta <manojgupta@chromium.org>, Tiancong Wang <tcwang@chromium.org>, Stephen Hines <srhines@google.com>, clang-built-linux@googlegroups.com

On Tue, Mar 19, 2019 at 6:10 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The clang option -Oz enables *aggressive* optimization for size,
> which doesn't necessarily result in smaller images, but can have
> negative impact on performance. Switch back to the less aggressive
> -Os.
>
> This reverts commit 6748cb3c299de1ffbe56733647b01dbcc398c419.
>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>


Applied to linux-kbuild/fixes.  Thanks.


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
Best Regards
Masahiro Yamada
