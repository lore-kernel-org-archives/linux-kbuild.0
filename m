Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:26389 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751909AbeF0FxY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jun 2018 01:53:24 -0400
MIME-Version: 1.0
In-Reply-To: <152929772052.17463.10728056000221362647.stgit@noble>
References: <152929708853.17463.17302660556961083137.stgit@noble> <152929772052.17463.10728056000221362647.stgit@noble>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 27 Jun 2018 14:52:33 +0900
Message-ID: <CAK7LNAR2n_Kf7HEwWgLwH8sjyVAiJUWkvV7ZAbkNn0KgVTUx1Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] kbuild: disable KBUILD_MODNAME when building for mod.a
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: NeilBrown <neilb@suse.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-06-18 13:55 GMT+09:00 NeilBrown <neilb@suse.com>:
> When building an object to be included in mod.a we
> cannot know the name of the module.  So don't define
> KBUILD_MODNAME.  This will ensure attempt to use
> that macro when the module name isn't know will
> trigger an error.

Honestly, I hate KBUILD_MODNAME.

If KBUILD_MODNAME is undefined,
you cannot call pr_debug() in the sub-directory for example.

CONFIG_DYNAMIC_DEBUG requires KBUILD_MODNAME,
but people often miss to notice that, then cause build errors.





> Signed-off-by: NeilBrown <neilb@suse.com>
> ---
>  scripts/Makefile.lib |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index c84167169a59..d09246474f2e 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -96,7 +96,7 @@ subdir-ym     := $(addprefix $(obj)/,$(subdir-ym))
>  # Finds the multi-part object the current object will be linked into.
>  # If the object belongs to two or more multi-part objects, all of them are
>  # concatenated with a colon separator.
> -modname-multi = $(subst $(space),:,$(sort $(foreach m,$(multi-used),\
> +modname-multi = $(subst $(space),:,$(sort $(foreach m,$(multi-used) modobj.o,\
>                 $(if $(filter $*.o, $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$(m:.o=)))))
>
>  modname = $(if $(modname-multi),$(modname-multi),$(basetarget))
> @@ -106,7 +106,7 @@ modname = $(if $(modname-multi),$(modname-multi),$(basetarget))
>  # end up in (or would, if it gets compiled in)
>  name-fix = $(squote)$(quote)$(subst $(comma),_,$(subst -,_,$1))$(quote)$(squote)
>  basename_flags = -DKBUILD_BASENAME=$(call name-fix,$(basetarget))
> -modname_flags  = -DKBUILD_MODNAME=$(call name-fix,$(modname))
> +modname_flags  = $(if $(filter-out modobj,$(modname)),-DKBUILD_MODNAME=$(call name-fix,$(modname)))
>
>  orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) \
>                   $(ccflags-y) $(CFLAGS_$(basetarget).o)
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
