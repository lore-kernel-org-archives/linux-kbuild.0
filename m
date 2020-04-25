Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:43909 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgDYLdy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Apr 2020 07:33:54 -0400
MIME-Version: 1.0
References: <1587794858-938-1-git-send-email-pi3orama@163.com>
In-Reply-To: <1587794858-938-1-git-send-email-pi3orama@163.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 25 Apr 2020 20:33:01 +0900
Message-ID: <CAK7LNAQbUeH4jcQHnsp=6fYLoLpCqyMVJg+rN-6P2aO+a-UGYw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add $(strip ...) before compare make variable
 with string
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wang Nan <pi3orama@163.com>
Cc: Wang Nan <wangnan0@huawei.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Apr 25, 2020 at 3:09 PM Wang Nan <pi3orama@163.com> wrote:
>
> Some of ifneq in Makefile.build works improperly:
>
>  ifneq ($(a)$(b)$(c),)
>  ...
>  endif
>
> Because some make vairable contains unintended spaces introduced by:
>
>  a := $(x) $(y)


Right.
I made a mistake in commit 5f2fb52fac15a

$(hostprogs) always contains a space due to this line:

hostprogs  += $(hostprogs-y) $(hostprogs-m)


This line will go away soon, though.



>
> This commit adds $(strip ...) to some potentially buggy ifneq.
>
> Signed-off-by: Wang Nan <pi3orama@163.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> ---
>  scripts/Makefile.build | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 9fcbfac..b2bc0db 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -46,7 +46,7 @@ include $(kbuild-file)
>  include scripts/Makefile.lib
>
>  # Do not include host rules unless needed
> -ifneq ($(hostprogs)$(hostcxxlibs-y)$(hostcxxlibs-m),)
> +ifneq ($(strip $(hostprogs) $(hostcxxlibs-y) $(hostcxxlibs-m)),)

Only this one is correct.


>  include scripts/Makefile.host
>  endif
>
> @@ -55,7 +55,7 @@ $(warning kbuild: Makefile.build is included improperly)
>  endif
>
>  ifeq ($(need-modorder),)
> -ifneq ($(obj-m),)
> +ifneq ($(strip $(obj-m)),)


obj-m           := $(addprefix $(obj)/,$(obj-m))

has always stripped away spaces.



>  $(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
>  $(warning You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.)
>  endif
> @@ -512,7 +512,7 @@ obj-dirs := $(sort $(obj) $(patsubst %/,%, $(dir $(targets))))
>  # If targets exist, their directories apparently exist. Skip mkdir.
>  existing-dirs := $(sort $(patsubst %/,%, $(dir $(existing-targets))))
>  obj-dirs := $(strip $(filter-out $(existing-dirs), $(obj-dirs)))
> -ifneq ($(obj-dirs),)


The previous line has $(strip )



> +ifneq ($(strip $(obj-dirs)),)
>  $(shell mkdir -p $(obj-dirs))
>  endif
>  endif
> --
> 2.7.4
>
>


-- 
Best Regards
Masahiro Yamada
