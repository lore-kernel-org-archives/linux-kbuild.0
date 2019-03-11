Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:18779 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbfCKRRI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Mar 2019 13:17:08 -0400
MIME-Version: 1.0
References: <20190304165732.24043-1-ar@cs.msu.ru> <20190304165732.24043-2-ar@cs.msu.ru>
In-Reply-To: <20190304165732.24043-2-ar@cs.msu.ru>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 12 Mar 2019 02:16:13 +0900
Message-ID: <CAK7LNARThXJ_+uL-oQN7YAL2ODpfo5kx09WwrTvxa1wdM4VV3w@mail.gmail.com>
Subject: Re: [PATCH 1/3] kconfig/Makefile: localmodconfig: use KCONFIG_CONFIG
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arseny Maslennikov <ar@cs.msu.ru>
Cc: Michal Marek <michal.lkml@markovi.net>, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-um@lists.infradead.org

On Tue, Mar 5, 2019 at 1:58 AM Arseny Maslennikov <ar@cs.msu.ru> wrote:
>
> If the config file is reassigned through the KCONFIG_CONFIG
> makeflag/envvar, this rule still attempts to use the wrong, possibly
> nonexistent file.
> Let's fix that.


Are you just replacing .config with KCONFIG_CONFIG at random?

scripts/kconfig/streamline_config.pl
hard-codes the .config path,
so this does not work anyway.




> Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>
> ---
>  scripts/kconfig/Makefile | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 1c7ac07def4d..28be91964a20 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -44,14 +44,14 @@ build_xconfig: $(obj)/qconf
>
>  localyesconfig localmodconfig: $(obj)/conf
>         $(Q)perl $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
> -       $(Q)if [ -f .config ]; then                                     \
> -                       cmp -s .tmp.config .config ||                   \
> -                       (mv -f .config .config.old.1;                   \
> -                        mv -f .tmp.config .config;                     \
> +       $(Q)if [ -f $(KCONFIG_CONFIG) ]; then                           \
> +                       cmp -s .tmp.config $(KCONFIG_CONFIG) ||         \
> +                       (mv -f $(KCONFIG_CONFIG) .tmp.config.old.1;     \
> +                        mv -f .tmp.config $(KCONFIG_CONFIG);           \
>                          $< $(silent) --oldconfig $(Kconfig);           \
> -                        mv -f .config.old.1 .config.old)               \
> +                        mv -f .tmp.config.old.1 $(KCONFIG_CONFIG).old) \
>         else                                                            \
> -                       mv -f .tmp.config .config;                      \
> +                       mv -f .tmp.config $(KCONFIG_CONFIG);            \
>                         $< $(silent) --oldconfig $(Kconfig);            \
>         fi
>         $(Q)rm -f .tmp.config
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
