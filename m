Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:45014 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbeINSWC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Sep 2018 14:22:02 -0400
MIME-Version: 1.0
In-Reply-To: <1536734610-22173-2-git-send-email-yamada.masahiro@socionext.com>
References: <1536734610-22173-1-git-send-email-yamada.masahiro@socionext.com> <1536734610-22173-2-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 14 Sep 2018 22:06:33 +0900
Message-ID: <CAK7LNATHOOLA+Hje0VUsxNJWov_nDaBa90SwsKr=QSCa3LYYYQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: remove dead code in cmd_files calculation in
 top Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-09-12 15:43 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Nobody sets 'targets' in the top-level Makefile or arch/*/Makefile,
> hence $(targets) is empty.
>
> $(wildcard .*.cmd) will do for including the .vmlinux.cmd file.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 4b76e22..8f6dbfc 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1721,8 +1721,7 @@ cmd_crmodverdir = $(Q)mkdir -p $(MODVERDIR) \
>                    $(if $(KBUILD_MODULES),; rm -f $(MODVERDIR)/*)
>
>  # read all saved command lines
> -
> -cmd_files := $(wildcard .*.cmd $(foreach f,$(sort $(targets)),$(dir $(f)).$(notdir $(f)).cmd))
> +cmd_files := $(wildcard .*.cmd)
>
>  ifneq ($(cmd_files),)
>    $(cmd_files): ;      # Do not try to update included dependency files
> --
> 2.7.4
>



-- 
Best Regards
Masahiro Yamada
