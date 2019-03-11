Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:30244 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbfCKR0I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Mar 2019 13:26:08 -0400
MIME-Version: 1.0
References: <20190304165732.24043-1-ar@cs.msu.ru> <20190304165732.24043-3-ar@cs.msu.ru>
In-Reply-To: <20190304165732.24043-3-ar@cs.msu.ru>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 12 Mar 2019 02:25:13 +0900
Message-ID: <CAK7LNATzyyga_jbd_9BbEqws9PE-19L3FSxxoPwbC7ieic0yQg@mail.gmail.com>
Subject: Re: [PATCH 2/3] Makefile: kselftest: use KCONFIG_CONFIG
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
>
> Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index d5713e7b1e50..4d8760166a47 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1199,9 +1199,9 @@ kselftest-clean:
>
>  PHONY += kselftest-merge
>  kselftest-merge:
> -       $(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
> +       $(if $(wildcard $(objtree)/$(KCONFIG_CONFIG)),, $(error No $(KCONFIG_CONFIG) exists, config your kernel first!))
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
> -               -m $(objtree)/.config \
> +               -m $(objtree)/$(KCONFIG_CONFIG) \


You are blindly replacing .config with $(KCONFIG_CONFIG).


What kind of usage do you assume for KCONFIG_CONFIG ?

$(objtree)/$(KCONFIG_CONFIG) means
$(KCONFIG_CONFIG) never becomes an absolute path.








>                 $(srctree)/tools/testing/selftests/*/config
>         +$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>
> --
> 2.20.1
>


--
Best Regards
Masahiro Yamada
