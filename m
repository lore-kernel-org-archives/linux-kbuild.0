Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:32685 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfHRQoQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Aug 2019 12:44:16 -0400
MIME-Version: 1.0
References: <CAKwvOdk+NQCKZ4EXAukaKYK4R9CDaNWVY_aDxXaeQrLfo_Z=nw@mail.gmail.com>
 <20190815225844.145726-1-nhuck@google.com>
In-Reply-To: <20190815225844.145726-1-nhuck@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 19 Aug 2019 01:43:08 +0900
Message-ID: <CAK7LNATsA0foyeaE2W3xe=_Hkf9S=q0eD5WHqwPXkMw8udkDPg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Joe Perches <joe@perches.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Nathan Chancellor <natechancellor@gmail.com>

Hi.

On Fri, Aug 16, 2019 at 7:59 AM Nathan Huckleberry <nhuck@google.com> wrote:
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
>  endif
>  endif
> --
> 2.23.0.rc1.153.gdeed80330f-goog
>


Perhaps, is the following even cleaner?



diff --git a/Makefile b/Makefile
index 1b23f95db176..cebc6bf5372e 100644
--- a/Makefile
+++ b/Makefile
@@ -751,6 +751,9 @@ else
 # These warnings generated too much noise in a regular build.
 # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
 KBUILD_CFLAGS += -Wno-unused-but-set-variable
+
+# Warn about unmarked fall-throughs in switch statement.
+KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
 endif

 KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
@@ -845,9 +848,6 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC)
-print-file-name=include)
 # warn about C99 declaration after statement
 KBUILD_CFLAGS += -Wdeclaration-after-statement

-# Warn about unmarked fall-throughs in switch statement.
-KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
-
 # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
 KBUILD_CFLAGS += -Wvla



-- 
Best Regards
Masahiro Yamada
