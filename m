Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:23522 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751391AbeAYNQl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jan 2018 08:16:41 -0500
MIME-Version: 1.0
In-Reply-To: <20180125014119.31219-1-jakub.kicinski@netronome.com>
References: <20180125014119.31219-1-jakub.kicinski@netronome.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 25 Jan 2018 22:15:47 +0900
Message-ID: <CAK7LNARzBkLWFYEvVrXvT+YrivKuVGraKWTexVWyqTxxFWPG+A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make Makefile|Kbuild in each directory optional
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jakub Kicinski <jakub.kicinski@netronome.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, oss-drivers@netronome.com

2018-01-25 10:41 GMT+09:00 Jakub Kicinski <jakub.kicinski@netronome.com>:
> It is useful to be able to build single object files, e.g.:
> $ make net/sched/cls_flower.o W=1 C=2
>
> Currently kbuild does a hard include of a Kbuild or Makefile
> for directory where that object would reside.  Kbuild doesn't
> cater too well to multi-directory drivers, meaning such drivers
> will usually only use a single central Makefile.  This in turn
> means it will be impossible to build most of object files
> individually for such drivers.
>
> Make the include of $dir/{Makefile,Kbuild} optional.
>
> Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
> Reviewed-by: Dirk van der Merwe <dirk.vandermerwe@netronome.com>
> ---
> I must admit I have no idea whose tree I should send this to :(
> Could it go via net-next if no one on linux-kbuild objects?

This should be taken care of by linux-kbuild (and me).

For your specific problem, please fix netronome/nfp/Makefile


I'd like to take my time to think about this patch.

The single target is a bit compromised implementation
(it cannot handle subdir-ccflags-y correctly, for example)
I wonder if we should do this just for single target...





>  scripts/Makefile.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 47cddf32aeba..178864f877d5 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -42,7 +42,7 @@ save-cflags := $(CFLAGS)
>  # The filename Kbuild has precedence over Makefile
>  kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
>  kbuild-file := $(if $(wildcard $(kbuild-dir)/Kbuild),$(kbuild-dir)/Kbuild,$(kbuild-dir)/Makefile)
> -include $(kbuild-file)
> +-include $(kbuild-file)
>
>  # If the save-* variables changed error out
>  ifeq ($(KBUILD_NOPEDANTIC),)
> --
> 2.15.1
>



-- 
Best Regards
Masahiro Yamada
