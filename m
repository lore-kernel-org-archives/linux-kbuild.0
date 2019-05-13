Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:29424 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbfEMC07 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:26:59 -0400
MIME-Version: 1.0
References: <1557363481-27178-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1557363481-27178-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 13 May 2019 11:26:12 +0900
Message-ID: <CAK7LNARrrJD-7j-P8===Y4ZG5_--=35QQ4R1HALkvUZE_BO1Ow@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: re-enable int-in-bool-context warning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, May 9, 2019 at 9:58 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This warning was disabled by commit bd664f6b3e37 ("disable new
> gcc-7.1.1 warnings for now") just because it was too noisy.
>
> Thanks to Arnd Bergmann, all warnings have been fixed. Now, we are
> ready to re-enable it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to linux-kbuild.



> Changes in v2:
>   - rebase
>
>  Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index a61a95b..2896518 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -692,7 +692,6 @@ KBUILD_CFLAGS       += $(call cc-option,-fno-delete-null-pointer-checks,)
>  KBUILD_CFLAGS  += $(call cc-disable-warning,frame-address,)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, format-truncation)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, format-overflow)
> -KBUILD_CFLAGS  += $(call cc-disable-warning, int-in-bool-context)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, address-of-packed-member)
>
>  ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
