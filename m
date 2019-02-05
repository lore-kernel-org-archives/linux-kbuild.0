Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:25446 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbfBEI0s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Feb 2019 03:26:48 -0500
MIME-Version: 1.0
References: <20190201210853.244043-1-jflat@chromium.org>
In-Reply-To: <20190201210853.244043-1-jflat@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Feb 2019 17:26:05 +0900
Message-ID: <CAK7LNAS5j6+o+wb8WL=8WP4r4fgqY1MDSGe0_u9Nri81_Eb3xw@mail.gmail.com>
Subject: Re: [PATCH] kbuild, LLVMLinux: Don't suppress format warnings
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: jflat@chromium.org
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Sat, Feb 2, 2019 at 6:10 AM <jflat@chromium.org> wrote:
>
> From: Jon Flatley <jflat@chromium.org>
>
> gcc produces format warnings that clang suppresses. To keep behavior
> consistent between gcc and clang, don't suppress format warnings in
> clang.
>
> Signed-off-by: Jon Flatley <jflat@chromium.org>
> ---

Applied to linux-kbuild.
Thanks.




>  scripts/Makefile.extrawarn | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 768306add591..94daf4e1fc73 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -68,7 +68,6 @@ else
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += $(call cc-disable-warning, initializer-overrides)
>  KBUILD_CFLAGS += $(call cc-disable-warning, unused-value)
> -KBUILD_CFLAGS += $(call cc-disable-warning, format)
>  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
>  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
>  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> --
> 2.20.1.611.gfbb209baf1-goog
>


-- 
Best Regards
Masahiro Yamada
