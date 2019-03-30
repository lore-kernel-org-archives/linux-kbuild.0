Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:39161 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfC3FNP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Mar 2019 01:13:15 -0400
MIME-Version: 1.0
References: <1553581936-6476-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1553581936-6476-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 30 Mar 2019 14:12:32 +0900
Message-ID: <CAK7LNARSXgBOPiSNm6mByTWhijTaxq=Omo5FsEju-_Fbe0uLKw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix warning "overriding recipe for target 'Makefile'"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Mar 26, 2019 at 3:46 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> If you do "make Makefile" with GNU Make 3.x, the following warning
> is displayed:
>
>   $ make Makefile
>   Makefile:165: warning: overriding recipe for target 'Makefile'
>   Makefile:51: warning: ignoring old recipe for target 'Makefile'
>   make[1]: Nothing to be done for 'Makefile'.
>   make: Nothing to be done for 'Makefile'.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.



>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 70fc778..1b361bd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -161,7 +161,7 @@ ifeq ($(need-sub-make),1)
>
>  PHONY += $(MAKECMDGOALS) sub-make
>
> -$(filter-out _all sub-make $(CURDIR)/Makefile, $(MAKECMDGOALS)) _all: sub-make
> +$(filter-out _all sub-make $(lastword $(MAKEFILE_LIST)), $(MAKECMDGOALS)) _all: sub-make
>         @:
>
>  # Invoke a second make in the output directory, passing relevant variables
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
