Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:45479 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755107AbeCHKZF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Mar 2018 05:25:05 -0500
MIME-Version: 1.0
In-Reply-To: <1520471103-10089-2-git-send-email-yamada.masahiro@socionext.com>
References: <1520471103-10089-1-git-send-email-yamada.masahiro@socionext.com> <1520471103-10089-2-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Mar 2018 19:24:10 +0900
Message-ID: <CAK7LNASpT5-f9kmxHTXCtxv+p-t8XT4j6SOHyiReXK6_5jwz8g@mail.gmail.com>
Subject: Re: [PATCH 1/5] kbuild: remove unnecessary $(subst $(obj)/,,...) in modname-multi
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Cao jin <caoj.fnst@cn.fujitsu.com>, Govind Singh <govinds@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-03-08 10:04 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> In the context ...
>
>     $(obj)/%.s: $(src)/%.c FORCE
>             $(call if_changed_dep,cc_s_c)
>
>     $(obj)/%.i: $(src)/%.c FORCE
>             $(call if_changed_dep,cpp_i_c)
>
>     $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
>             $(call cmd,force_checksrc)
>             $(call if_changed_rule,cc_o_c)
>
>     $(obj)/%.lst: $(src)/%.c FORCE
>             $(call if_changed_dep,cc_lst_c)
>
> '$*' returns the stem of the target (the part of '%'), so $(obj)/ has
> already been ripped off.
>
> $(subst $(obj)/,,$*.o) is the same as $(*.o)


Log fix-up:

 ... is the same as $*.o





> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 5589bae..a7e315f 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -175,7 +175,7 @@ dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
>
>  # Finds the multi-part object the current object will be linked into
>  modname-multi = $(sort $(foreach m,$(multi-used),\
> -               $(if $(filter $(subst $(obj)/,,$*.o), $($(m:.o=-objs)) $($(m:.o=-y))),$(m:.o=))))
> +               $(if $(filter $*.o, $($(m:.o=-objs)) $($(m:.o=-y))),$(m:.o=))))
>
>  # Useful for describing the dependency of composite objects
>  # Usage:
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
