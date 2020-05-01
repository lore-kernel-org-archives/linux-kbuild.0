Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:42442 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgEAFhY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 01:37:24 -0400
MIME-Version: 1.0
References: <20200425131810.991717-1-masahiroy@kernel.org>
In-Reply-To: <20200425131810.991717-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 May 2020 14:36:14 +0900
Message-ID: <CAK7LNASYYcBRt3n6oQF_jWDEh8ZGiUfmog-v-KK+f6ZRPr828w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove '/' target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Apr 25, 2020 at 10:18 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This notice has been here for a while. Remove it entirely now.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>



Applied to linux-kbuild.


>  Makefile | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 49b2709ff44e..95c2d8c2dfe8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1650,10 +1650,6 @@ _emodinst_post: _emodinst_
>  clean-dirs := $(KBUILD_EXTMOD)
>  clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps
>
> -PHONY += /
> -/:
> -       @echo >&2 '"$(MAKE) /" is no longer supported. Please use "$(MAKE) ./" instead.'
> -
>  PHONY += help
>  help:
>         @echo  '  Building external modules.'
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
