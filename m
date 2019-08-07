Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59102 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387815AbfHGPXs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Aug 2019 11:23:48 -0400
MIME-Version: 1.0
References: <20190806100323.22919-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190806100323.22919-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Aug 2019 00:22:57 +0900
Message-ID: <CAK7LNASUNw8pdg3WYmoZzpz=9tu0c=O+Fyzu228kSLYOhUq81g@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: fix false-positive need-builtin
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Tue, Aug 6, 2019 at 7:03 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The current implementation of need-builtin is false-positive,
> for example, in the following Makefile:
>
>   obj-m := foo/
>   obj-y := foo/bar/
>
> ..., where foo/built-in.a is not required.
>
> Fixes: f7adc3124da0 ("kbuild: create built-in.o automatically if parent directory wants it")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild.


>
>  scripts/Makefile.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 0d434d0afc0b..3fe0c73e002c 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -487,7 +487,8 @@ targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
>
>  PHONY += $(subdir-ym)
>  $(subdir-ym):
> -       $(Q)$(MAKE) $(build)=$@ need-builtin=$(if $(findstring $@,$(subdir-obj-y)),1)
> +       $(Q)$(MAKE) $(build)=$@ \
> +       need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1)
>
>  # Add FORCE to the prequisites of a target to force it to be always rebuilt.
>  # ---------------------------------------------------------------------------
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
