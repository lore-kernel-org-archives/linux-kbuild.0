Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:45785 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbeKNJPY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Nov 2018 04:15:24 -0500
MIME-Version: 1.0
References: <1541995285-11144-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1541995285-11144-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 14 Nov 2018 08:13:54 +0900
Message-ID: <CAK7LNASevj4QQ5-J4QRbwS-vGkvb8VBrvzXVZDUhbHoA=auMxA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove 'prepare' and 'scripts' dummies for
 external module build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Nov 12, 2018 at 1:02 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Make is lenient enough to ignore missing rules as long as they are marked
> as PHONY. Remove dummy targets.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>
>  Makefile | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 766a64e..7508243 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1610,10 +1610,7 @@ help:
>         @echo  '  clean           - remove generated files in module directory only'
>         @echo  ''
>
> -# Dummies...
>  PHONY += prepare scripts
> -prepare: ;
> -scripts: ;
>  endif # KBUILD_EXTMOD
>
>  clean: $(clean-dirs)
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
