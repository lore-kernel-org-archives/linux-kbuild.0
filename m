Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:36159 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfGIFqI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 01:46:08 -0400
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x695jvQt011679
        for <linux-kbuild@vger.kernel.org>; Tue, 9 Jul 2019 14:45:57 +0900
Received: by mail-vk1-f180.google.com with SMTP id b200so2959080vkf.10
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jul 2019 22:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190708153436.19260-1-hws@denx.de>
In-Reply-To: <20190708153436.19260-1-hws@denx.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 9 Jul 2019 14:45:20 +0900
Message-ID: <CAK7LNAR+9ze8UY1_Di9evYLy=ngiVSsr4eqLPMGz_6EoV-fR8A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix compression errors getting ignored
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Harald Seiler <hws@denx.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Tue, Jul 9, 2019 at 12:35 AM Harald Seiler <hws@denx.de> wrote:
>
> A missing compression utility or other errors were not picked up by make
> and an empty kernel image was produced.  With the added "|| exit $?",
> the error is propagated outwards and will make the build fail.
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Signed-off-by: Harald Seiler <hws@denx.de>
> ---

Thanks for the report, but this patch is really ugly.

The following is much better:



diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index f1f38c8cdc74..768e697df304 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -331,19 +331,19 @@ printf "%08x\n" $$dec_size |
                         \
 )

 quiet_cmd_bzip2 = BZIP2   $@
-      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9 && $(size_append); } > $@
+      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9; $(size_append); } > $@

 # Lzma
 # ---------------------------------------------------------------------------

 quiet_cmd_lzma = LZMA    $@
-      cmd_lzma = { cat $(real-prereqs) | lzma -9 && $(size_append); } > $@
+      cmd_lzma = { cat $(real-prereqs) | lzma -9; $(size_append); } > $@

 quiet_cmd_lzo = LZO     $@
-      cmd_lzo = { cat $(real-prereqs) | lzop -9 && $(size_append); } > $@
+      cmd_lzo = { cat $(real-prereqs) | lzop -9; $(size_append); } > $@

 quiet_cmd_lz4 = LZ4     $@
-      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout && \
+      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout; \
                   $(size_append); } > $@

 # U-Boot mkimage
@@ -386,7 +386,7 @@ quiet_cmd_uimage = UIMAGE  $@
 # big dictionary would increase the memory usage too much in the multi-call
 # decompression mode. A BCJ filter isn't used either.
 quiet_cmd_xzkern = XZKERN  $@
-      cmd_xzkern = { cat $(real-prereqs) | sh
$(srctree)/scripts/xz_wrap.sh && \
+      cmd_xzkern = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh; \
                      $(size_append); } > $@

 quiet_cmd_xzmisc = XZMISC  $@




>  scripts/Makefile.lib | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index f1f38c8cdc74..4b374da065a3 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -331,19 +331,19 @@ printf "%08x\n" $$dec_size |                                              \
>  )
>
>  quiet_cmd_bzip2 = BZIP2   $@
> -      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9 && $(size_append); } > $@
> +      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9 || exit $$? && $(size_append); } > $@
>
>  # Lzma
>  # ---------------------------------------------------------------------------
>
>  quiet_cmd_lzma = LZMA    $@
> -      cmd_lzma = { cat $(real-prereqs) | lzma -9 && $(size_append); } > $@
> +      cmd_lzma = { cat $(real-prereqs) | lzma -9 || exit $$? && $(size_append); } > $@
>
>  quiet_cmd_lzo = LZO     $@
> -      cmd_lzo = { cat $(real-prereqs) | lzop -9 && $(size_append); } > $@
> +      cmd_lzo = { cat $(real-prereqs) | lzop -9 || exit $$? && $(size_append); } > $@
>
>  quiet_cmd_lz4 = LZ4     $@
> -      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout && \
> +      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout || exit $$? && \
>                    $(size_append); } > $@
>
>  # U-Boot mkimage
> @@ -386,8 +386,8 @@ quiet_cmd_uimage = UIMAGE  $@
>  # big dictionary would increase the memory usage too much in the multi-call
>  # decompression mode. A BCJ filter isn't used either.
>  quiet_cmd_xzkern = XZKERN  $@
> -      cmd_xzkern = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh && \
> -                     $(size_append); } > $@
> +      cmd_xzkern = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh || \
> +                     exit $$? && $(size_append); } > $@
>
>  quiet_cmd_xzmisc = XZMISC  $@
>        cmd_xzmisc = cat $(real-prereqs) | xz --check=crc32 --lzma2=dict=1MiB > $@
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
