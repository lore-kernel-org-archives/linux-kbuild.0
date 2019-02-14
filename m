Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:43474 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388915AbfBNIN1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Feb 2019 03:13:27 -0500
MIME-Version: 1.0
References: <20190213174005.28785-1-hch@lst.de> <20190213174005.28785-11-hch@lst.de>
In-Reply-To: <20190213174005.28785-11-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Feb 2019 09:13:13 +0100
Message-ID: <CAMuHMdXPF4ohqzEnT_rnwKWi6r13cDMTtEinh-TpZ6YpSaQ=WA@mail.gmail.com>
Subject: Re: [PATCH 10/11] lib: consolidate the GENERIC_HWEIGHT symbol
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, linux-s390 <linux-s390@vger.kernel.org>, linux-xtensa@linux-xtensa.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Feb 14, 2019 at 3:11 AM Christoph Hellwig <hch@lst.de> wrote:
> Introduce a new ARCH_HAS_HWEIGHT symbol for alpha and ia64, and just
> default to the generic version otherwise.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/Kconfig       | 4 ----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
