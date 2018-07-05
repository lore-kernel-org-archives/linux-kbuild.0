Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:60028 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750884AbeGEFlU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 01:41:20 -0400
MIME-Version: 1.0
In-Reply-To: <20180702144711.22111-3-hch@lst.de>
References: <20180702144711.22111-1-hch@lst.de> <20180702144711.22111-3-hch@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 5 Jul 2018 14:40:15 +0900
Message-ID: <CAK7LNAT-hR1OtB4K53EeYoJEXY6kP8OjpFDt6Kpasw2fzQKPYw@mail.gmail.com>
Subject: Re: [PATCH 2/5] Kconfig: consolidate the "Kernel hacking menu"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-02 23:47 GMT+09:00 Christoph Hellwig <hch@lst.de>:
> Move the source of lib/Kconfig.debug and arch/$(ARCH)/Kconfig.debug to
> the top-level Kconfig.  For two architectures that means moving their
> arch-specific symbols in that menu into a new arch Kconfig.debug file,
> and for a few more creating a dummy file so that we can include it
> unconditionally.
>
> Also move the actual 'Kernel hacking' menu to lib/Kconfig.debug, where
> it belongs.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---




> diff --git a/arch/c6x/Kconfig.debug b/arch/c6x/Kconfig.debug
> new file mode 100644
> index 000000000000..49edf08813eb
> --- /dev/null
> +++ b/arch/c6x/Kconfig.debug
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config ACCESS_CHECK
> +       bool "Check the user pointer address"
> +       default y
> +       help
> +         Usually the pointer transfer from user space is checked to see if its
> +         address is in the kernel space.
> +
> +         Say N here to disable that check to improve the performance.
> +

Just a nit:

When I ran 'git am', it complained about a blank line at the end of file.

.git/rebase-apply/patch:229: new blank line at EOF.






-- 
Best Regards
Masahiro Yamada
