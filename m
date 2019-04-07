Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:46794 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbfDGJWJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Apr 2019 05:22:09 -0400
MIME-Version: 1.0
References: <1553947458-8311-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1553947458-8311-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 7 Apr 2019 18:21:20 +0900
Message-ID: <CAK7LNATLHaS-i0D61+ZFP-4CsCeyf8qZsetofw8eyf=eaP3-tQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] kbuild: pass $(MAKECMDGOALS) to sub-make as is
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Mar 30, 2019 at 9:04 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Manipulating $(MAKECMDGOALS) for sub-make seems odd to me.
>
> [1] 'make O=foo sub-make' is turned into 'make O=foo', which builds
> the default targets. It would make sense to terminate the build with:
>
>   *** No rule to make target 'sub-make'.  Stop.
>
> [2] 'make O=foo defconfig _all' is turned into 'make O=foo defconfig',
> which changes the behavior.
>
> Let's pass $(MAKECMDGOALS) as is.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild.


>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 92ad066..9cbd367 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -168,7 +168,7 @@ $(filter-out _all sub-make $(lastword $(MAKEFILE_LIST)), $(MAKECMDGOALS)) _all:
>  sub-make:
>         $(Q)$(MAKE) \
>         $(if $(KBUILD_OUTPUT),-C $(KBUILD_OUTPUT) KBUILD_SRC=$(CURDIR)) \
> -       -f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDGOALS))
> +       -f $(CURDIR)/Makefile $(MAKECMDGOALS)
>
>  endif # need-sub-make
>  endif # sub_make_done
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
