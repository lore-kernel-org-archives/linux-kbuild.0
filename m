Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:26571 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754934AbeAMNTm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Jan 2018 08:19:42 -0500
MIME-Version: 1.0
In-Reply-To: <20180112064747.22854-1-ulfalizer@gmail.com>
References: <20180112064747.22854-1-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 13 Jan 2018 22:18:57 +0900
Message-ID: <CAK7LNAT0jJ7mj6_ZWCprK5wHp5-FRoBhaUxxwO_x23PO+XU-gQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Warn if there is more than one help text
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-01-12 15:47 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> Avoids mistakes like in the following real-world example, where only the
> final help string ("Say Y...") was used. This particular example was
> fixed in commit 561b29e4ec8d ("media: fix media Kconfig help syntax
> issues").
>
>   config DVB_NETUP_UNIDVB
>         ...
>         select DVB_CXD2841ER if MEDIA_SUBDRV_AUTOSELECT
>         ---help---
>           Support for NetUP PCI express Universal DVB card.
>        help
>         Say Y when you want to support NetUP Dual Universal DVB card
>         ...
>
> This now prints the following warning:
>
>   drivers/media/pci/netup_unidvb:13: warning: 'DVB_NETUP_UNIDVB' defined with more than one help text -- only the last one will be used
>
> Also free() any extra help strings.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---

Applied to linux-kbuild/kconfig
replacing "kconfig: Don't leak help strings during parsing"

Thanks!

-- 
Best Regards
Masahiro Yamada
