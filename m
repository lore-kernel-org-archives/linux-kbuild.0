Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:61157 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfEaQDe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 May 2019 12:03:34 -0400
MIME-Version: 1.0
References: <1559316388-19565-1-git-send-email-george_davis@mentor.com>
In-Reply-To: <1559316388-19565-1-git-send-email-george_davis@mentor.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 1 Jun 2019 01:02:37 +0900
Message-ID: <CAK7LNATXzLzttF_gLA4wdfE1ue+bLPhvDZVsTKbB5K3nrN3jng@mail.gmail.com>
Subject: Re: [RFC][PATCH] Makefile: Fix checkstack.pl arm64 wrong or unknown architecture
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "George G. Davis" <george_davis@mentor.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Sat, Jun 1, 2019 at 12:27 AM George G. Davis <george_davis@mentor.com> wrote:
>
> The following error occurs for the `make ARCH=arm64 checkstack` case:
>
> aarch64-linux-gnu-objdump -d vmlinux $(find . -name '*.ko') | \
> perl ./scripts/checkstack.pl arm64
> wrong or unknown architecture "arm64"
>
> Fix the above error by setting `CHECKSTACK_ARCH := aarch64` for the
> ARCH=arm64 case.
>
> Signed-off-by: George G. Davis <george_davis@mentor.com>


Why don't you fix scripts/checkstack.pl ?



> ---
>  Makefile | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 11358153d8f2..3e615e8553c0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1695,7 +1695,11 @@ PHONY += checkstack kernelrelease kernelversion image_name
>  ifeq ($(ARCH), um)
>  CHECKSTACK_ARCH := $(SUBARCH)
>  else
> -CHECKSTACK_ARCH := $(ARCH)
> +       ifeq ($(ARCH), arm64)
> +               CHECKSTACK_ARCH := aarch64
> +       else
> +               CHECKSTACK_ARCH := $(ARCH)
> +       endif
>  endif
>  checkstack:
>         $(OBJDUMP) -d vmlinux $$(find . -name '*.ko') | \
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
