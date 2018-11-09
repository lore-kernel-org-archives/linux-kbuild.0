Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:51611 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbeKJAow (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Nov 2018 19:44:52 -0500
MIME-Version: 1.0
References: <20181105151719.4552-1-changbin.du@gmail.com>
In-Reply-To: <20181105151719.4552-1-changbin.du@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 10 Nov 2018 00:03:13 +0900
Message-ID: <CAK7LNARFMPn2SN5vShCWX94UbTGF5WY6fjnVnS8ZFmFpXj-TpQ@mail.gmail.com>
Subject: Re: [PATCH] init/Kconfig: make CC_OPTIMIZE_FOR_DEBUGGING visible only
 for GCC
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Changbin Du <changbin.du@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Nov 6, 2018 at 12:18 AM Changbin Du <changbin.du@gmail.com> wrote:
>
> Currently CC_OPTIMIZE_FOR_DEBUGGING is only able to build with GCC.
> For clang, -Og optimization level could break kernel build. So make
> CC_OPTIMIZE_FOR_DEBUGGING visible only for GCC.
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---

I squashed this into the previous patch in the kbuild tree.

Thanks!


>  init/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 0fb9c0b5f1a1..d5fb0ee1400a 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1107,6 +1107,7 @@ config CC_OPTIMIZE_FOR_SIZE
>
>  config CC_OPTIMIZE_FOR_DEBUGGING
>         bool "Optimize for better debugging experience (-Og)"
> +       depends on CC_IS_GCC
>         depends on $(cc-option,-Og)
>         select NO_AUTO_INLINE
>         help
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
