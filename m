Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:61948 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751343AbdKMESP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Nov 2017 23:18:15 -0500
MIME-Version: 1.0
In-Reply-To: <20171110073504.13836-1-caoj.fnst@cn.fujitsu.com>
References: <20171110073504.13836-1-caoj.fnst@cn.fujitsu.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 13 Nov 2017 13:17:31 +0900
Message-ID: <CAK7LNARtLpJKHJ3-izJ3AWi7uFJfsQWpdw+=7NkFE7hnsnm_8A@mail.gmail.com>
Subject: Re: [PATCH RFC] kbuild: fixes in Makefile.lib
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

Hi Cao,


2017-11-10 16:35 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
> commit
>
>   cf4f21938e13e ("kbuild: Allow to specify composite modules with modname-m")
>
> add modname-m support, but miss to update the corresponding multi-objs-m
> defination.


Commit cf4f21938e13 ("kbuild: Allow to specify composite modules
with modname-m") added modname-m support, but missed to update the
corresponding multi-objs-m definition.

 - fix Commit ID style
 - Use past tense (added, missed)
 - Fix a typo (defination -> definition)






> commit 551559e13af1c ("kbuild: implement modules.order") miss to filter
> the subdir listed in obj-m. Except that the subdirs are totally identical
> between obj-y and obj-m, or else I think it will miss something.

modules.order is correct as-is
unless I am missing something.


> But until now, no one has complaining about it, so I guess it just no
> one has triggerred it.
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
> I found these 2 points which I think might be wrong during code
> inspection, but until now, they seems didn't do anything bad, so I am not
> sure this is a problem:)
>
>  scripts/Makefile.lib | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 580e605118e4..3209f303213b 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -22,7 +22,7 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
>  # Determine modorder.
>  # Unfortunately, we don't have information about ordering between -y
>  # and -m subdirs.  Just put -y's first.
> -modorder       := $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
> +modorder       := $(patsubst %/,%/modules.order, $(filter %/, $(obj-y) $(obj-m) $(obj-m:.o=.ko))


This change caused build error.

scripts/Makefile.lib:25: *** unterminated call to function 'patsubst':
missing ')'.  Stop.


And, this change is not necessary.

$(filter %/, $(obj-m)) is a subset of $(obj-m:.o=.ko)






>  # Handle objects in subdirs
>  # ---------------------------------------------------------------------------
> @@ -49,7 +49,7 @@ single-used-m := $(sort $(filter-out $(multi-used-m),$(obj-m)))
>  # Build list of the parts of our composite objects, our composite
>  # objects depend on those (obviously)
>  multi-objs-y := $(foreach m, $(multi-used-y), $($(m:.o=-objs)) $($(m:.o=-y)))
> -multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)))
> +multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))
>  multi-objs   := $(multi-objs-y) $(multi-objs-m)
>
>  # $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to


This is also build error.

scripts/Makefile.lib:52: *** unterminated call to function 'foreach':
missing ')'.  Stop.


Please test your patch before submitting.


Assuming the build error will be fixed, this change is correct.




Also, modname-multi should be fixed.

modname-multi = $(sort $(foreach m,$(multi-used),\
                $(if $(filter $(subst $(obj)/,,$*.o), $($(m:.o=-objs))
$($(m:.o=-y)) $($(m:.o=-m))),$(m:.o=))))



Thanks.




-- 
Best Regards
Masahiro Yamada
