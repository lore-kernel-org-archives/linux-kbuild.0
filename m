Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:35718 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbdCKFrd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Mar 2017 00:47:33 -0500
MIME-Version: 1.0
In-Reply-To: <1489111260-5458-1-git-send-email-sw0312.kim@samsung.com>
References: <CGME20170310020057epcas5p228e45982244ea0d7fd1e36a0620d0768@epcas5p2.samsung.com>
 <1489111260-5458-1-git-send-email-sw0312.kim@samsung.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 11 Mar 2017 14:47:12 +0900
Message-ID: <CAK7LNATonsaOgd_ufgn2qocESk2LN0h9ZgMcEikWCCCwW0j3ag@mail.gmail.com>
Subject: Re: [RESEND][PATCH] Kbuild: fix file name in comment about extra gcc checks
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

2017-03-10 11:01 GMT+09:00 Seung-Woo Kim <sw0312.kim@samsung.com>:
> Extra gcc checks like W=1 were moved to scripts/Makefile.exrawarn,
> so the file name in comment needs to be fixed.
>
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> ---
>  Makefile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 165cf97..faa9d26 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -707,7 +707,7 @@ KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
>  else
>
>  # These warnings generated too much noise in a regular build.
> -# Use make W=1 to enable them (see scripts/Makefile.build)
> +# Use make W=1 to enable them (see scripts/Makefile.extrawarn)
>  KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
>  KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
>  endif



Applied to linux-kbuild/kbuild.


Thanks!




-- 
Best Regards
Masahiro Yamada
