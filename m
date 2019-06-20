Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:17720 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfFTP4e (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Jun 2019 11:56:34 -0400
MIME-Version: 1.0
References: <20190616174805.3069-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190616174805.3069-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 21 Jun 2019 00:55:30 +0900
Message-ID: <CAK7LNAQ9qmDu3NxM+unF4=EBy1Dt3gvYRGM3hLUAF3wGBqy8cA@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/raid6: remove duplicated CFLAGS_REMOVE_altivec8.o
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, Joel Stanley <joel@jms.id.au>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>

On Mon, Jun 17, 2019 at 2:50 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> No intended change in behavior.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  lib/raid6/Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
> index e723eacf7868..74004037033f 100644
> --- a/lib/raid6/Makefile
> +++ b/lib/raid6/Makefile
> @@ -26,7 +26,6 @@ CFLAGS_REMOVE_altivec1.o  += -msoft-float
>  CFLAGS_REMOVE_altivec2.o  += -msoft-float
>  CFLAGS_REMOVE_altivec4.o  += -msoft-float
>  CFLAGS_REMOVE_altivec8.o  += -msoft-float
> -CFLAGS_REMOVE_altivec8.o  += -msoft-float
>  CFLAGS_REMOVE_vpermxor1.o += -msoft-float
>  CFLAGS_REMOVE_vpermxor2.o += -msoft-float
>  CFLAGS_REMOVE_vpermxor4.o += -msoft-float
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
