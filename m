Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:64966 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfDKOYC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 10:24:02 -0400
MIME-Version: 1.0
References: <HE1PR0701MB2652279C2863E22F19B871FCFA2F0@HE1PR0701MB2652.eurprd07.prod.outlook.com>
In-Reply-To: <HE1PR0701MB2652279C2863E22F19B871FCFA2F0@HE1PR0701MB2652.eurprd07.prod.outlook.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 11 Apr 2019 23:23:21 +0900
Message-ID: <CAK7LNAQ1CMjggTc8whn2-NWtjXasnq-HjnaOOxVsDczSJZBotA@mail.gmail.com>
Subject: Re: [PATCH v3] modpost: make KBUILD_MODPOST_WARN also configurable
 for external modules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>
Cc: "michal.lkml@markovi.net" <michal.lkml@markovi.net>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Jonas Gorski <jonas.gorski@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Apr 11, 2019 at 6:25 PM Wiebe, Wladislav (Nokia - DE/Ulm)
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
>
> As this patch changes the default behaving from warning to error,
> users can consider to fix it for external module builds by:
> - providing module symbol table via KBUILD_EXTRA_SYMBOLS for
>   modules which are dependent
> - OR getting old behaving back by passing KBUILD_MODPOST_WARN to the build
>
> Signed-off-by: Wladislav Wiebe <wladislav.wiebe@nokia.com>


Applied to linux-kbuild.
Thanks.


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
