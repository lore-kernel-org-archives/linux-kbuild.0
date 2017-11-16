Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:57411 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754185AbdKPAgd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 19:36:33 -0500
MIME-Version: 1.0
In-Reply-To: <20171113104159.30409-1-caoj.fnst@cn.fujitsu.com>
References: <20171113104159.30409-1-caoj.fnst@cn.fujitsu.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 Nov 2017 09:35:44 +0900
Message-ID: <CAK7LNAQrpyZLhXWdi2AG7Oss-BrQyZOKSrH3t+OaqQYyJxcV1w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fixes in Makefile.lib
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

2017-11-13 19:41 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
> Commit cf4f21938e13 ("kbuild: Allow to specify composite modules
> with modname-m") added modname-m support, but missed to update the
> corresponding multi-objs-m & modname-multi definition.
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
> Addressed the all comments of Masahiro-san from RFC version, and TESTed it.
>
>  scripts/Makefile.lib | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 580e605118e4..a9d54b1fa017 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -49,7 +49,7 @@ single-used-m := $(sort $(filter-out $(multi-used-m),$(obj-m)))
>  # Build list of the parts of our composite objects, our composite
>  # objects depend on those (obviously)
>  multi-objs-y := $(foreach m, $(multi-used-y), $($(m:.o=-objs)) $($(m:.o=-y)))
> -multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)))
> +multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)))
>  multi-objs   := $(multi-objs-y) $(multi-objs-m)
>
>  # $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
> @@ -174,7 +174,7 @@ dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
>
>  # Finds the multi-part object the current object will be linked into
>  modname-multi = $(sort $(foreach m,$(multi-used),\
> -               $(if $(filter $(subst $(obj)/,,$*.o), $($(m:.o=-objs)) $($(m:.o=-y))),$(m:.o=))))
> +               $(if $(filter $(subst $(obj)/,,$*.o), $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$(m:.o=))))
>
>  # Useful for describing the dependency of composite objects
>  # Usage:
> --


Applied to linux-kbuild/kbuild,
but I like more descriptive commit subject.

This time, I changed it as follows:

kbuild: fix modname for composite modules




-- 
Best Regards
Masahiro Yamada
