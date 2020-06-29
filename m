Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730134AbgF2S5n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 14:57:43 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65F7C031C5A
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jun 2020 10:39:07 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y18so7372897plr.4
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jun 2020 10:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200629085911.1676554-1-masahiroy@kernel.org>
In-Reply-To: <20200629085911.1676554-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 29 Jun 2020 10:38:56 -0700
Message-ID: <CAKwvOd=qe5KE1vdUYQmpsW2zmDbk5i-MgRujs9B7wqnAj+af0w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make Clang build userprogs for target architecture
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Mon, Jun 29, 2020 at 1:59 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Programs added 'userprogs' should be compiled for the target
> architecture i.e. the same architecture as the kernel.
>
> GCC does this correctly since the target architecture is implied
> by the toolchain prefix.
>
> Clang builds standalone programs always for the host architecture
> because the target triple is currently missing.
>
> Fix this.
>
> Fixes: 7f3a59db274c ("kbuild: add infrastructure to build userspace programs")

This is a neat feature I didn't know about; looks relatively new.
What's the test case command line invocation to test this with Clang?

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 73948798ce3f..cac29cc2ec25 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -970,8 +970,8 @@ LDFLAGS_vmlinux     += --pack-dyn-relocs=relr
>  endif
>
>  # Align the bit size of userspace programs with the kernel
> -KBUILD_USERCFLAGS  += $(filter -m32 -m64, $(KBUILD_CFLAGS))
> -KBUILD_USERLDFLAGS += $(filter -m32 -m64, $(KBUILD_CFLAGS))
> +KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
> +KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))

That should be fine.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
https://www.gnu.org/software/make/manual/html_node/Text-Functions.html

>
>  # make the checker run with the right architecture
>  CHECKFLAGS += --arch=$(ARCH)
> --


-- 
Thanks,
~Nick Desaulniers
