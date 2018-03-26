Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:48490 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751907AbeCZPjE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Mar 2018 11:39:04 -0400
MIME-Version: 1.0
In-Reply-To: <1521810279-6282-9-git-send-email-yamada.masahiro@socionext.com>
References: <1521810279-6282-1-git-send-email-yamada.masahiro@socionext.com> <1521810279-6282-9-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 27 Mar 2018 00:38:11 +0900
Message-ID: <CAK7LNARX3yxR1E93z=_HqaihgJedidt0rvPH_e1KvAqbw2FBuw@mail.gmail.com>
Subject: Re: [PATCH 09/10] kbuild: add *.asn1.[ch] to 'targets' automatically
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank Rowand <frank.rowand@sony.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

2018-03-23 22:04 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Use $(call if_changed,...) instead of $(call cmd,...) in case the
> build command is changed in the future.  Add intermediate files to
> 'targets' automatically to include *.cmd files.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


I will drop this patch.
This change is not necessary for using .SECONDARY.



>  scripts/Makefile.build | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 8c3ca61..cc081af 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -432,8 +432,9 @@ quiet_cmd_asn1_compiler = ASN.1   $@
>
>  .PRECIOUS: $(objtree)/$(obj)/%.asn1.c $(objtree)/$(obj)/%.asn1.h
>
> -$(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
> -       $(call cmd,asn1_compiler)
> +$(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 \
> +                                       $(objtree)/scripts/asn1_compiler FORCE
> +       $(call if_changed,asn1_compiler)
>
>  # Build the compiled-in targets
>  # ---------------------------------------------------------------------------
> @@ -544,10 +545,12 @@ targets := $(filter-out $(PHONY), $(targets))
>  intermediate_targets = $(foreach sfx, $(2), \
>                                 $(patsubst %$(strip $(1)),%$(sfx), \
>                                         $(filter %$(strip $(1)), $(targets))))
> +# %.asn1.o <- %.asn1.[ch] <- %.asn1
>  # %.dtb.o <- %.dtb.S <- %.dtb <- %.dts
>  # %.lex.o <- %.lex.c <- %.l
>  # %.tab.o <- %.tab.[ch] <- %.y
> -targets += $(call intermediate_targets, .dtb.o, .dtb.S .dtb) \
> +targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
> +          $(call intermediate_targets, .dtb.o, .dtb.S .dtb) \
>            $(call intermediate_targets, .lex.o, .lex.c) \
>            $(call intermediate_targets, .tab.o, .tab.c .tab.h)
>
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
