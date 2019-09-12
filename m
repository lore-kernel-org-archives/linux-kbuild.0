Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:18090 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730680AbfILLtS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Sep 2019 07:49:18 -0400
MIME-Version: 1.0
References: <20190909105317.20473-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190909105317.20473-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 12 Sep 2019 20:48:28 +0900
Message-ID: <CAK7LNAQXRCYssihbriXjG4Y4GPnTShEw487qsb7VtjmyUHGGEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] export.h: remove defined(__KERNEL__)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Denis Efremov <efremov@linux.com>, Nicolas Pitre <nico@fluxnic.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Sep 9, 2019 at 7:53 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This line was touched by commit f235541699bc ("export.h: allow for
> per-symbol configurable EXPORT_SYMBOL()"), but the commit log did
> not explain why.
>
> CONFIG_TRIM_UNUSED_KSYMS works for me without defined(__KERNEL__).
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Both applied to linux-kbuild.


>  include/linux/export.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/export.h b/include/linux/export.h
> index fd8711ed9ac4..cdd98a0d918c 100644
> --- a/include/linux/export.h
> +++ b/include/linux/export.h
> @@ -20,7 +20,7 @@ extern struct module __this_module;
>
>  #ifdef CONFIG_MODULES
>
> -#if defined(__KERNEL__) && !defined(__GENKSYMS__)
> +#if !defined(__GENKSYMS__)
>  #ifdef CONFIG_MODVERSIONS
>  /* Mark the CRC weak since genksyms apparently decides not to
>   * generate a checksums for some symbols */
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
