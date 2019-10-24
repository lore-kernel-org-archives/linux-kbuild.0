Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:33047 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfJXRVH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Oct 2019 13:21:07 -0400
MIME-Version: 1.0
References: <20191016051547.11399-1-yamada.masahiro@socionext.com>
In-Reply-To: <20191016051547.11399-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 25 Oct 2019 02:20:17 +0900
Message-ID: <CAK7LNAQM9eR5ZJXhUi-YDFAdMm82NFZKXuXFJ3OP7EsdwLnkNQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: reduce KBUILD_SINGLE_TARGETS as descending
 into subdirectories
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Oct 16, 2019 at 2:17 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> KBUILD_SINGLE_TARGETS does not need to contain all the targets.
> Change it to keep track the targets only from the current directory
> and its subdirectories.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild.


>
>  scripts/Makefile.build | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index a9e47953ca53..dcbb0124dac4 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -469,15 +469,15 @@ targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
>
>  ifdef single-build
>
> +KBUILD_SINGLE_TARGETS := $(filter $(obj)/%, $(KBUILD_SINGLE_TARGETS))
> +
>  curdir-single := $(sort $(foreach x, $(KBUILD_SINGLE_TARGETS), \
>                         $(if $(filter $(x) $(basename $(x)).o, $(targets)), $(x))))
>
>  # Handle single targets without any rule: show "Nothing to be done for ..." or
>  # "No rule to make target ..." depending on whether the target exists.
>  unknown-single := $(filter-out $(addsuffix /%, $(subdir-ym)), \
> -                       $(filter $(obj)/%, \
> -                               $(filter-out $(curdir-single), \
> -                                       $(KBUILD_SINGLE_TARGETS))))
> +                       $(filter-out $(curdir-single), $(KBUILD_SINGLE_TARGETS)))
>
>  __build: $(curdir-single) $(subdir-ym)
>  ifneq ($(unknown-single),)
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
