Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:27635 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753458AbeGFAou (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 20:44:50 -0400
MIME-Version: 1.0
In-Reply-To: <9a4b8d07-b9cc-4843-a74c-7f40ebc4c9af@infradead.org>
References: <9a4b8d07-b9cc-4843-a74c-7f40ebc4c9af@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 6 Jul 2018 09:43:49 +0900
Message-ID: <CAK7LNATqeD8dcjHFHd8rFcyyyihQC4=CRBx0_LH6GCq6HDeW-g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: update kbuild.txt ARCH alias list
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2018-07-05 4:57 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> In Kbuild documentation, add alias for 64-bit sh ARCH ("sh64")
> to the list of ARCH aliases.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>  Documentation/kbuild/kbuild.txt |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20180704.orig/Documentation/kbuild/kbuild.txt
> +++ linux-next-20180704/Documentation/kbuild/kbuild.txt
> @@ -88,6 +88,7 @@ In most cases the name of the architectu
>  directory name found in the arch/ directory.
>  But some architectures such as x86 and sparc have aliases.
>  x86: i386 for 32 bit, x86_64 for 64 bit
> +sh: sh for 32 bit, sh64 for 64 bit
>  sparc: sparc for 32 bit, sparc64 for 64 bit
>
>  CROSS_COMPILE
>


Looks good.


I will change the subject to

kbuild: update kbuild.txt ARCH alias info for sh


I see another patch "for sparc".

https://patchwork.kernel.org/patch/10510213/


> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
