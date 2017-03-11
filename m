Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:56843 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750928AbdCKFlh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Mar 2017 00:41:37 -0500
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com [209.85.161.178]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id v2B5fMfw005087
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Mar 2017 14:41:22 +0900
Received: by mail-yw0-f178.google.com with SMTP id o4so35587173ywd.3
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Mar 2017 21:41:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170206065724.3937-1-matti.aaltonen@darkmatter.ae>
References: <20170206065724.3937-1-matti.aaltonen@darkmatter.ae>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 11 Mar 2017 14:41:21 +0900
Message-ID: <CAK7LNAQhwRAOTxo6vz+VmhJEMSG8VTtgwLAb9VHG=yWu8HPn7w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add the source tree path to the
 Makefile.gcc-plugins path
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matti Aaltonen <matti.aaltonen@unikie.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Matti Aaltonen <matti.aaltonen@darkmatter.ae>

Hi Matti,


2017-02-06 15:57 GMT+09:00 Matti Aaltonen <matti.aaltonen@unikie.com>:
> Make sure that the Makefile.gcc-plugins is found also when
> the build is not started from the kernel root directory.
>
> Signed-off-by: Matti Aaltonen <matti.aaltonen@darkmatter.ae>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 96b27a8..d085504 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -651,7 +651,7 @@ KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0409, \
>  # Tell gcc to never replace conditional load with a non-conditional one
>  KBUILD_CFLAGS  += $(call cc-option,--param=allow-store-data-races=0)
>
> -include scripts/Makefile.gcc-plugins
> +include $(srctree)/scripts/Makefile.gcc-plugins
>
>  ifdef CONFIG_READABLE_ASM
>  # Disable optimizations that make assembler listings hard to read.
> --


Kbuild does not require $(srctree) for include directives.


Please see the following line in the top-level Makefile.

# o Look for make include files relative to root of kernel src
MAKEFLAGS += -rR --include-dir=$(CURDIR)



Or, do you have any problem without this patch?



-- 
Best Regards
Masahiro Yamada
