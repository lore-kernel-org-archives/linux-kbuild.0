Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32540 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752774AbdHXQUe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Aug 2017 12:20:34 -0400
MIME-Version: 1.0
In-Reply-To: <20170803100924.8791-1-jthumshirn@suse.de>
References: <20170803100924.8791-1-jthumshirn@suse.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 25 Aug 2017 01:19:39 +0900
Message-ID: <CAK7LNATUHBZYMA7Bv4T4bM2ygzCZ5v2yLtyWYLATvR+hLCKAdg@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: enable -Wunused-macros warning for "make W=1"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Johannes Thumshirn <jthumshirn@suse.de>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Johannes,

2017-08-03 19:09 GMT+09:00 Johannes Thumshirn <jthumshirn@suse.de>:
> We have lots of dead defines and macros in drivers, lets offer users a way
> to detect and eventually remove them.
>
> Signed-off-by: Johannes Thumshirn <jthumshirn@suse.de>
> ---
>  scripts/Makefile.extrawarn | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index fb3522fd8702..8ab8bc91da55 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -25,6 +25,7 @@ warning-1 += -Wold-style-definition
>  warning-1 += $(call cc-option, -Wmissing-include-dirs)
>  warning-1 += $(call cc-option, -Wunused-but-set-variable)
>  warning-1 += $(call cc-option, -Wunused-const-variable)
> +warning-1 += $(call cc-option, -Wunused-macros)
>  warning-1 += $(call cc-disable-warning, missing-field-initializers)
>  warning-1 += $(call cc-disable-warning, sign-compare)


This makes W=1 too noisy.

For example, drivers often define unused register macros
for completeness.  I do not think it is too bad in my opinion.

Perhaps, should it be moved to warning-2 ?






-- 
Best Regards
Masahiro Yamada
