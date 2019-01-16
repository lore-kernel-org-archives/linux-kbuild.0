Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:64705 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387533AbfAPOfV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Jan 2019 09:35:21 -0500
MIME-Version: 1.0
References: <1547454569-27319-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547454569-27319-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 16 Jan 2019 23:34:32 +0900
Message-ID: <CAK7LNASKFbynGoie6Pox8nZhikeobMDBk-V8gz=Z6cj3_ieKCQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unused archmrproper
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, Yoshinori Sato <ysato@users.sourceforge.jp>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Mon, Jan 14, 2019 at 5:30 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> No one uses archmrproper.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


Applied to linux-kbuild/fixes.

>
>  Makefile            | 4 ++--
>  arch/h8300/Makefile | 2 --
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 68898cc..a9c54e1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1360,11 +1360,11 @@ mrproper: rm-dirs  := $(wildcard $(MRPROPER_DIRS))
>  mrproper: rm-files := $(wildcard $(MRPROPER_FILES))
>  mrproper-dirs      := $(addprefix _mrproper_,scripts)
>
> -PHONY += $(mrproper-dirs) mrproper archmrproper
> +PHONY += $(mrproper-dirs) mrproper
>  $(mrproper-dirs):
>         $(Q)$(MAKE) $(clean)=$(patsubst _mrproper_%,%,$@)
>
> -mrproper: clean archmrproper $(mrproper-dirs)
> +mrproper: clean $(mrproper-dirs)
>         $(call cmd,rmdirs)
>         $(call cmd,rmfiles)
>
> diff --git a/arch/h8300/Makefile b/arch/h8300/Makefile
> index 4003ddc..f801f37 100644
> --- a/arch/h8300/Makefile
> +++ b/arch/h8300/Makefile
> @@ -37,8 +37,6 @@ libs-y        += arch/$(ARCH)/lib/
>
>  boot := arch/h8300/boot
>
> -archmrproper:
> -
>  archclean:
>         $(Q)$(MAKE) $(clean)=$(boot)
>
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
