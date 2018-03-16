Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:41465 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932868AbeCPCh3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Mar 2018 22:37:29 -0400
Received: by mail-qk0-f195.google.com with SMTP id s78so9588654qkl.8
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Mar 2018 19:37:29 -0700 (PDT)
Date: Thu, 15 Mar 2018 22:37:27 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v2 1/7] kbuild: clear LDFLAGS in the top Makefile
In-Reply-To: <1521166725-24157-2-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <nycvar.YSQ.7.76.1803152237070.28583@knanqh.ubzr>
References: <1521166725-24157-1-git-send-email-yamada.masahiro@socionext.com> <1521166725-24157-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Fri, 16 Mar 2018, Masahiro Yamada wrote:

> Currently LDFLAGS is not cleared, so same flags are accumulated in
> LDFLAGS when the top Makefile is recursively invoked.
> 
> I found unneeded rebuild for ARCH=arm64 when CONFIG_TRIM_UNUSED_KSYMS
> is enabled.  If include/generated/autoksyms.h is updated, the top
> Makefile is recursively invoked, then arch/arm64/Makefile adds one
> more '-maarch64linux'.  Due to the command line change, modules are
> rebuilt needlessly.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Nicolas Pitre <nico@linaro.org>


> ---
> 
> Changes in v2: None
> 
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index d9bb6dd6..ac8755d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -437,6 +437,7 @@ KBUILD_CFLAGS_KERNEL :=
>  KBUILD_AFLAGS_MODULE  := -DMODULE
>  KBUILD_CFLAGS_MODULE  := -DMODULE
>  KBUILD_LDFLAGS_MODULE := -T $(srctree)/scripts/module-common.lds
> +LDFLAGS :=
>  GCC_PLUGINS_CFLAGS :=
>  
>  export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
> -- 
> 2.7.4
> 
> 
