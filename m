Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:50060 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731594AbfHFGem (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 02:34:42 -0400
MIME-Version: 1.0
References: <20190806062316.30784-1-ice_yangxiao@163.com>
In-Reply-To: <20190806062316.30784-1-ice_yangxiao@163.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 6 Aug 2019 15:33:42 +0900
Message-ID: <CAK7LNARVrBf2imEOdYv0zZxDZaQ2z83qKr=xSbrHHGEYHgRLuA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Remove unused variable TMPO of ld-option
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Xiao Yang <ice_yangxiao@163.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, yangx.jy@cn.fujitsu.com

On Tue, Aug 6, 2019 at 3:23 PM Xiao Yang <ice_yangxiao@163.com> wrote:
>
> ld-option implementation has been simplified so variable TMPO
> is no longer needed.
>
> Fixes: Commit 0294e6f4a000 ("kbuild: simplify ld-option implementation")
> Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
> ---
>  scripts/Kbuild.include | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 4b0432e095ae..13a6f627351d 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -91,12 +91,11 @@ TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
>  # automatically cleaned up.
>  try-run = $(shell set -e;              \
>         TMP="$(TMPOUT).$$$$.tmp";       \
> -       TMPO="$(TMPOUT).$$$$.o";        \
>         if ($(1)) >/dev/null 2>&1;      \
>         then echo "$(2)";               \
>         else echo "$(3)";               \
>         fi;                             \
> -       rm -f "$$TMP" "$$TMPO")
> +       rm -f "$$TMP")
>
>  # as-option
>  # Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
> --
> 2.21.0
>
>

Unfortunately, there is a user in arch/x86/Makefile.

masahiro@pug:~/ref/linux$ git grep TMPO
arch/x86/Makefile:                      $(OBJCOPY) -O elf32-x86-64
"$$TMP" "$$TMPO" && \
arch/x86/Makefile:                      $(LD) -m elf32_x86_64 "$$TMPO"
-o "$$TMP",y,n)
scripts/Kbuild.include:TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword
$(KBUILD_EXTMOD))/)
scripts/Kbuild.include: TMP="$(TMPOUT).$$$$.tmp";       \
scripts/Kbuild.include: TMPO="$(TMPOUT).$$$$.o";        \
scripts/Kbuild.include: rm -f "$$TMP" "$$TMPO")




-- 
Best Regards
Masahiro Yamada
