Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:33941 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfDGJFg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Apr 2019 05:05:36 -0400
MIME-Version: 1.0
References: <HE1PR0701MB2652FC3F5D8E46EA93AF033AFA5F0@HE1PR0701MB2652.eurprd07.prod.outlook.com>
In-Reply-To: <HE1PR0701MB2652FC3F5D8E46EA93AF033AFA5F0@HE1PR0701MB2652.eurprd07.prod.outlook.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 7 Apr 2019 18:04:51 +0900
Message-ID: <CAK7LNAQEQyEyj_ozkARj8xjDf7EncHeBv0GY8xoP8e_Fn-qaag@mail.gmail.com>
Subject: Re: [PATCH] modpost: make KBUILD_MODPOST_WARN also configurable for
 external modules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>
Cc: "michal.lkml@markovi.net" <michal.lkml@markovi.net>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Gorski <jonas.gorski@gmail.com>

(+CC Jonas Gorski)


On Tue, Mar 26, 2019 at 6:58 PM Wiebe, Wladislav (Nokia - DE/Ulm)
<wladislav.wiebe@nokia.com> wrote:
>
> Commit ea837f1c0503 ("kbuild: make modpost processing configurable")
> was intended to give KBUILD_MODPOST_WARN flexibility to be configurable.
> Right now KBUILD_MODPOST_WARN gets just ignored when KBUILD_EXTMOD is
> set which happens per default when building modules out of the tree.
>
> This change gives the opportunity to define module build behaving also
> in case of out of tree builds and default will become exit on error.
> Errors which can be detected by the build should be trapped out of the box
> there, unless somebody wants to notice broken stuff later at runtime.

If an external module refers to a symbol
provided by another external module,
this patch will turn the warning into the error by default,
which is probably a bad idea.


I suggested a desired change in the following.
https://patchwork.kernel.org/patch/9980691/

I am poking Jonas Gorski
if he plans to send v2.


> Signed-off-by: Wladislav Wiebe <wladislav.wiebe@nokia.com>
> ---
>  scripts/Makefile.modpost | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index 6b7f354f189a..fec6ec2ffa47 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -78,7 +78,7 @@ modpost = scripts/mod/modpost                    \
>   $(if $(KBUILD_EXTRA_SYMBOLS), $(patsubst %, -e %,$(KBUILD_EXTRA_SYMBOLS))) \
>   $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
>   $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)  \
> - $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w)
> + $(if $(KBUILD_MODPOST_WARN),-w)
>
>  MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
>
> --
> 2.19.2



-- 
Best Regards
Masahiro Yamada
