Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:25066 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbfJLDgv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 23:36:51 -0400
MIME-Version: 1.0
References: <20191010151443.7399-1-maennich@google.com> <20191010151443.7399-4-maennich@google.com>
In-Reply-To: <20191010151443.7399-4-maennich@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 12 Oct 2019 12:35:47 +0900
Message-ID: <CAK7LNASMn9GY2dzVvouDW5MfqR3M1pEkWM73quh1HKb_XW1L4g@mail.gmail.com>
Subject: Re: [PATCH 3/4] symbol namespaces: revert to previous __ksymtab name scheme
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Maennich <maennich@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Cc: Android Kernel" <kernel-team@android.com>, Jessica Yu <jeyu@kernel.org>, Martijn Coenen <maco@android.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Shaun Ruffell <sruffell@sruffell.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-modules <linux-modules@vger.kernel.org>

On Fri, Oct 11, 2019 at 12:16 AM Matthias Maennich <maennich@google.com> wrote:
>
> The introduction Symbol Namespaces changed the naming schema of the
> __ksymtab entries from __kysmtab__symbol to __ksymtab_NAMESPACE.symbol.
>
> That caused some breakages in tools that depend on the name layout in
> either the binaries(vmlinux,*.ko) or in System.map. E.g. kmod's depmod
> would not be able to read System.map without a patch to support symbol
> namespaces. A warning reported by depmod for namespaced symbols would
> look like
>
>   depmod: WARNING: [...]/uas.ko needs unknown symbol usb_stor_adjust_quirks
>
> In order to address this issue, revert to the original naming scheme and
> rather read the __kstrtabns_<symbol> entries and their corresponding
> values from __ksymtab_strings to update the namespace values for
> symbols. After having read all symbols and handled them in
> handle_modversions(), the symbols are created. In a second pass, read
> the __kstrtabns_ entries and update the namespaces accordingly.
>
> Suggested-by: Jessica Yu <jeyu@kernel.org>
> Fixes: 8651ec01daed ("module: add support for symbol namespaces.")
> Signed-off-by: Matthias Maennich <maennich@google.com>


According to https://lore.kernel.org/patchwork/patch/1135222/
was this problem reported by Stefan?
Reported-by: Stefan Wahren <stefan.wahren@i2se.com>


BTW, I initially suggested this way of fixing.
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>



> @@ -74,9 +72,8 @@ struct kernel_symbol {
>         int namespace_offset;
>  };
>  #else
> -#define __KSYMTAB_ENTRY_NS(sym, sec, ns)                               \
> -       static const struct kernel_symbol __ksymtab_##sym##__##ns       \
> -       asm("__ksymtab_" #ns NS_SEPARATOR #sym)                         \


For consistency, you could also delete   asm("__ksymtab_" #sym)
by this patch instead of by 4/4.

Not a big deal, though.


Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>



-- 
Best Regards
Masahiro Yamada
