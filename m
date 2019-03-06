Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:53931 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbfCFQDA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Mar 2019 11:03:00 -0500
MIME-Version: 1.0
References: <20190304125520.17794-1-luc.vanoostenryck@gmail.com>
In-Reply-To: <20190304125520.17794-1-luc.vanoostenryck@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 7 Mar 2019 01:01:58 +0900
Message-ID: <CAK7LNARMjdi5PxJ=RD19LKd_DrRpn-TXmy-9mZZcgNiU=hzizQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use -Werror=implicit-... instead of -Werror-implicit-...
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Mar 4, 2019 at 9:55 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> The flag '-Werror-implicit-function-declaration', present in GCC 2.95,
> stopped to be documented in GCC 4.3, replaced by the more generic
> '-Werror=...' form.
>
> So, use the equivalent '-Werror=implicit-function-declaration' instead.
>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---

Applied to linux-kbuild.
Thanks.



>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index d5713e7b1e50..253e5ede92e7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -429,7 +429,7 @@ LINUXINCLUDE    := \
>  KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
>  KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
>                    -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
> -                  -Werror-implicit-function-declaration -Werror=implicit-int \
> +                  -Werror=implicit-function-declaration -Werror=implicit-int \
>                    -Wno-format-security \
>                    -std=gnu89
>  KBUILD_CPPFLAGS := -D__KERNEL__
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
