Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:64822 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfHGPLF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Aug 2019 11:11:05 -0400
MIME-Version: 1.0
References: <20190731061358.30117-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190731061358.30117-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Aug 2019 00:10:19 +0900
Message-ID: <CAK7LNAQPezQovn6Lnw1Zgz7Y2xz7_XXaccyZ-79zSYXAVSE6jQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add [M] marker for build log of *.mod.o
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jul 31, 2019 at 3:14 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This builds module objects, so [M] makes sense.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to linux-kbuild.


> ---
>
>  scripts/Makefile.modpost | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index 6e328190d609..6c237af41417 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -112,7 +112,7 @@ $(modules:.ko=.mod.c): modules-modpost ;
>  # modname is set to make c_flags define KBUILD_MODNAME
>  modname = $(notdir $(@:.mod.o=))
>
> -quiet_cmd_cc_o_c = CC      $@
> +quiet_cmd_cc_o_c = CC [M]  $@
>        cmd_cc_o_c = $(CC) $(c_flags) $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE) \
>                    -c -o $@ $<
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
