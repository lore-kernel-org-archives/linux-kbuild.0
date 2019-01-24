Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:48722 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbfAXE0W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Jan 2019 23:26:22 -0500
MIME-Version: 1.0
References: <1547799412-20120-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547799412-20120-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 24 Jan 2019 13:25:36 +0900
Message-ID: <CAK7LNATiQFTwyZsy-Hw1e8S=HBzT_tzjEkBwivQD+o=Cga1Yhw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: descend to scripts/kconfig/ directly when
 syncconfig is needed
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 18, 2019 at 5:17 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The recursion of the top Makefile is inefficient.
> Just descend to scripts/kconfig/.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 9851a44..d5f0ac4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -631,7 +631,7 @@ $(KCONFIG_CONFIG) include/config/auto.conf.cmd: ;
>  # include/generated/ and include/config/. Update them if .config is newer than
>  # include/config/auto.conf (which mirrors .config).
>  include/config/%.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
> -       $(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
> +       $(Q)$(MAKE) $(build)=scripts/kconfig syncconfig
>  else
>  # External modules and some install targets need include/generated/autoconf.h
>  # and include/config/auto.conf but do not care if they are up-to-date.
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
