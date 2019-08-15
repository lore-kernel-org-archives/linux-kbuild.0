Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37562 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731281AbfHOXER (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 19:04:17 -0400
Received: by mail-pf1-f194.google.com with SMTP id 129so2083639pfa.4
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2019 16:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdk+NQCKZ4EXAukaKYK4R9CDaNWVY_aDxXaeQrLfo_Z=nw@mail.gmail.com>
 <20190815225844.145726-1-nhuck@google.com>
In-Reply-To: <20190815225844.145726-1-nhuck@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 15 Aug 2019 16:04:04 -0700
Message-ID: <CAKwvOdmu_=CM-8LOfi556t=ZPi+p2WVYcZ6Sk+ru+EfzPCb-JA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Joe Perches <joe@perches.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Nathan Chancellor <natechancellor@gmail.com>

On Thu, Aug 15, 2019 at 3:59 PM 'Nathan Huckleberry' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> Clang is updating to support -Wimplicit-fallthrough on C
> https://reviews.llvm.org/D64838. Since clang does not
> support the comment version of fallthrough annotations
> this update causes an additional 50k warnings. Most
> of these warnings (>49k) are duplicates from header files.
>
> This patch is intended to be reverted after the warnings
> have been cleaned up.
>
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
> Changes v1->v2
> * Move code to preexisting ifdef
>  scripts/Makefile.extrawarn | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index a74ce2e3c33e..95973a1ee999 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -70,5 +70,6 @@ KBUILD_CFLAGS += -Wno-initializer-overrides
>  KBUILD_CFLAGS += -Wno-format
>  KBUILD_CFLAGS += -Wno-sign-compare
>  KBUILD_CFLAGS += -Wno-format-zero-length
> +KBUILD_CFLAGS += $(call cc-option,-Wno-implicit-fallthrough)

Clang seems to support -Wno-implicit-fallthrough since 3.2.  You can
remove the cc-option, since you'll need a newer clang than that to
build the kernel.
-- 
Thanks,
~Nick Desaulniers
