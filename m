Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:47582 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbfGIMr0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 08:47:26 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x69ClLlx023238
        for <linux-kbuild@vger.kernel.org>; Tue, 9 Jul 2019 21:47:22 +0900
Received: by mail-ua1-f50.google.com with SMTP id g11so2831087uak.0
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jul 2019 05:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190709105048.4608-1-hws@denx.de>
In-Reply-To: <20190709105048.4608-1-hws@denx.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 9 Jul 2019 21:46:44 +0900
Message-ID: <CAK7LNATg=dqbpo8PNvtLE7x8QDm0LrU=BQ_POfdFFGkJ_fU=9A@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: fix compression errors getting ignored
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Harald Seiler <hws@denx.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Tue, Jul 9, 2019 at 7:52 PM Harald Seiler <hws@denx.de> wrote:
>
> A missing compression utility or other errors were not picked up by make
> and an empty kernel image was produced.  By removing the &&, errors will
> no longer be ignored.
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Signed-off-by: Harald Seiler <hws@denx.de>
> ---

Applied to linux-kbuild. Thanks.


> Changes in v2:
>   - Use a much simpler fix for this problem
>
> Thanks!  Somehow I totally missed doing it this way ...
>
>  scripts/Makefile.lib | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index f1f38c8cdc74..768e697df304 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -331,19 +331,19 @@ printf "%08x\n" $$dec_size |                                              \
>  )
>
>  quiet_cmd_bzip2 = BZIP2   $@
> -      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9 && $(size_append); } > $@
> +      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9; $(size_append); } > $@
>
>  # Lzma
>  # ---------------------------------------------------------------------------
>
>  quiet_cmd_lzma = LZMA    $@
> -      cmd_lzma = { cat $(real-prereqs) | lzma -9 && $(size_append); } > $@
> +      cmd_lzma = { cat $(real-prereqs) | lzma -9; $(size_append); } > $@
>
>  quiet_cmd_lzo = LZO     $@
> -      cmd_lzo = { cat $(real-prereqs) | lzop -9 && $(size_append); } > $@
> +      cmd_lzo = { cat $(real-prereqs) | lzop -9; $(size_append); } > $@
>
>  quiet_cmd_lz4 = LZ4     $@
> -      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout && \
> +      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout; \
>                    $(size_append); } > $@
>
>  # U-Boot mkimage
> @@ -386,7 +386,7 @@ quiet_cmd_uimage = UIMAGE  $@
>  # big dictionary would increase the memory usage too much in the multi-call
>  # decompression mode. A BCJ filter isn't used either.
>  quiet_cmd_xzkern = XZKERN  $@
> -      cmd_xzkern = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh && \
> +      cmd_xzkern = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh; \
>                       $(size_append); } > $@
>
>  quiet_cmd_xzmisc = XZMISC  $@
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
