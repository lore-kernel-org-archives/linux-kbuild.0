Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:31846 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725727AbeGRGEu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Jul 2018 02:04:50 -0400
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com [209.85.213.46]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w6I5Shwv002433
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Jul 2018 14:28:43 +0900
Received: by mail-vk0-f46.google.com with SMTP id b14-v6so1834904vke.13
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Jul 2018 22:28:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180712221749.GL14131@decadent.org.uk>
References: <20180712221619.GH14131@decadent.org.uk> <20180712221749.GL14131@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 18 Jul 2018 14:28:02 +0900
Message-ID: <CAK7LNAT+wv-re08J87_Q9My2dmjgqM1U4Onh65bKw-fdPR8GjQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] kbuild: Move final argument to modpost into $(cmd_modpost)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-07-13 7:17 GMT+09:00 Ben Hutchings <ben@decadent.org.uk>:
> The following changes to the definition of $(cmd) will require that it
> is given a complete command line, and no additional arguments can be
> appended..

Nit:  is only one period enough?


Otherwise, looks good to me.



> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
>  scripts/Makefile.modpost | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index df4174405feb..4e56df933b79 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -85,11 +85,11 @@ MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
>
>  # We can go over command line length here, so be careful.
>  quiet_cmd_modpost = MODPOST $(words $(filter-out vmlinux FORCE, $^)) modules
> -      cmd_modpost = $(MODLISTCMD) | sed 's/\.ko$$/.o/' | $(modpost) $(MODPOST_OPT) -s -T -
> +      cmd_modpost = $(MODLISTCMD) | sed 's/\.ko$$/.o/' | $(modpost) $(MODPOST_OPT) -s -T - $(wildcard vmlinux)
>
>  PHONY += __modpost
>  __modpost: $(modules:.ko=.o) FORCE
> -       $(call cmd,modpost) $(wildcard vmlinux)
> +       $(call cmd,modpost)
>
>  quiet_cmd_kernel-mod = MODPOST $@
>        cmd_kernel-mod = $(modpost) $@
>



-- 
Best Regards
Masahiro Yamada
