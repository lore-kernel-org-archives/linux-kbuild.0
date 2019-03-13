Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49036 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbfCMRmV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 13:42:21 -0400
MIME-Version: 1.0
References: <1552023035-29826-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1552023035-29826-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 14 Mar 2019 02:41:39 +0900
Message-ID: <CAK7LNATpy6aAKqhM3ef05Oi2zYHVM2A+7x5y7tx-Z1q6BA=bvg@mail.gmail.com>
Subject: Re: [PATCH] unicore32: simplify linker script generation for decompressor
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guan Xuetao <gxt@pku.edu.cn>

On Fri, Mar 8, 2019 at 2:31 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> When I was searching for unneeded $(KCONFIG_CONFIG) usages, I noticed
> this strange build dependency.
>
> It can use $(call if_changed,...) in case ZTEXTADDR and ZBSSADDR are
> changed, but even a simpler way is to use the pattern rule in
> scripts/Makefile.build. This is what arch/arm/boot/compressed/Makefile
> does.
>
> I did only build test. I confirmed equivalent vmlinux.lds was generated.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


Applied to linux-kbuild.



>  arch/unicore32/boot/compressed/Makefile                          | 5 +----
>  arch/unicore32/boot/compressed/{vmlinux.lds.in => vmlinux.lds.S} | 0
>  2 files changed, 1 insertion(+), 4 deletions(-)
>  rename arch/unicore32/boot/compressed/{vmlinux.lds.in => vmlinux.lds.S} (100%)
>
> diff --git a/arch/unicore32/boot/compressed/Makefile b/arch/unicore32/boot/compressed/Makefile
> index 9aecdd3..150fafc 100644
> --- a/arch/unicore32/boot/compressed/Makefile
> +++ b/arch/unicore32/boot/compressed/Makefile
> @@ -61,7 +61,4 @@ $(obj)/vmlinux: $(obj)/vmlinux.lds $(obj)/head.o $(obj)/piggy.o \
>  ZTEXTADDR      := 0x03000000
>  ZBSSADDR       := ALIGN(4)
>
> -SEDFLAGS_lds   = s/TEXT_START/$(ZTEXTADDR)/;s/BSS_START/$(ZBSSADDR)/
> -$(obj)/vmlinux.lds: $(obj)/vmlinux.lds.in arch/unicore32/boot/Makefile $(KCONFIG_CONFIG)
> -       @sed "$(SEDFLAGS_lds)" < $< > $@
> -
> +CPPFLAGS_vmlinux.lds = -DTEXT_START="$(ZTEXTADDR)" -DBSS_START="$(ZBSSADDR)"
> diff --git a/arch/unicore32/boot/compressed/vmlinux.lds.in b/arch/unicore32/boot/compressed/vmlinux.lds.S
> similarity index 100%
> rename from arch/unicore32/boot/compressed/vmlinux.lds.in
> rename to arch/unicore32/boot/compressed/vmlinux.lds.S
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
