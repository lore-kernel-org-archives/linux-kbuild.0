Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:16449 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbfHGPQG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Aug 2019 11:16:06 -0400
MIME-Version: 1.0
References: <20190802102358.28408-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190802102358.28408-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Aug 2019 00:15:13 +0900
Message-ID: <CAK7LNASfBWBqmBtA9kpbFDJD21HZfoHYexwA25jaJgn5CpPw=A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: revive single target %.ko
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Don Brace <don.brace@microsemi.com>, Arend Van Spriel <arend.vanspriel@broadcom.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Aug 2, 2019 at 7:24 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I removed the single target %.ko in commit ff9b45c55b26 ("kbuild:
> modpost: read modules.order instead of $(MODVERDIR)/*.mod") because
> the modpost stage does not work reliably. For instance, the module
> dependency, modversion, etc. do not work if we lack symbol information
> from the other modules.
>
> Yet, some people still want to build only one module in their interest,
> and it may be still useful if it is used within those limitations.
>
> Fixes: ff9b45c55b26 ("kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod")
> Reported-by: Don Brace <don.brace@microsemi.com>
> Reported-by: Arend Van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild/fixes.

>
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 571cf862d7a4..e4c7211f5a3b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -997,6 +997,8 @@ endif
>
>  PHONY += prepare0
>
> +export MODORDER := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)modules.order
> +
>  ifeq ($(KBUILD_EXTMOD),)
>  core-y         += kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
>
> @@ -1766,6 +1768,10 @@ build-dir = $(patsubst %/,%,$(dir $(build-target)))
>         $(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
>  %.symtypes: prepare FORCE
>         $(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
> +%.ko: prepare FORCE
> +       $(Q)$(MAKE) $(build)=$(build-dir) $(build-target:.ko=.mod)
> +       $(Q)echo $(build-target) > $(MODORDER)
> +       $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost || { rm -f $(MODORDER); false; }
>
>  # Modules
>  PHONY += /
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
