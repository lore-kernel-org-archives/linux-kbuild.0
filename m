Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:37189 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfBNIMU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Feb 2019 03:12:20 -0500
MIME-Version: 1.0
References: <20190213174005.28785-1-hch@lst.de> <20190213174005.28785-10-hch@lst.de>
In-Reply-To: <20190213174005.28785-10-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Feb 2019 09:12:07 +0100
Message-ID: <CAMuHMdUX=dq49b08UUxkLCn+HikUBOEs29314fYbwregfrSEqg@mail.gmail.com>
Subject: Re: [PATCH 09/11] lib: consolidate the GENERIC_CSUM symbol
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, linux-s390 <linux-s390@vger.kernel.org>, linux-xtensa@linux-xtensa.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Feb 14, 2019 at 3:25 AM Christoph Hellwig <hch@lst.de> wrote:
> Add one definition to lib/Kconfig and let the architectures
> select if it supported.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/Kconfig       | 3 ---

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
