Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:57852 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbeJKLwj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Oct 2018 07:52:39 -0400
MIME-Version: 1.0
References: <20181010222333.17794-1-bp@alien8.de>
In-Reply-To: <20181010222333.17794-1-bp@alien8.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 11 Oct 2018 13:26:23 +0900
Message-ID: <CAK7LNAT2KpYkn=hj=h1XmbMJRdtgCQ__xP0X+Rpwm3e_Xs1brQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fail the build early when no lz4 present
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Borislav,

On Thu, Oct 11, 2018 at 7:23 AM Borislav Petkov <bp@alien8.de> wrote:
>
> From: Borislav Petkov <bp@suse.de>
>
> When building randconfigs, the build fails at kernel compression stage
> due to missing lz4 on the system but CONFIG_KERNEL_LZ4 has been selected
> by randconfig. The result looks somethins like this:
>
>     (cat arch/x86/boot/compressed/vmlinux.bin arch/x86/boot/compressed/vmlinux.relocs | lz4c -l -c1 stdin stdout && printf \334\141\301\001) > arch/x86/boot/compressed/vmlinux.bin.lz4 || (rm -f arch/x86/boot/compressed/vmlinux.bin.lz4 ; false)
>   /bin/sh: 1: lz4c: not found


So, the cause of the failure is clear enough
from the build log.



It is weird to check only lz4c.
If CONFIG_KERNEL_LZO is enabled, but lzop is not installed,
I see this log

  LZO     arch/x86/boot/compressed/vmlinux.bin.lzo
/bin/sh: 1: lzop: not found

It is still clear what to do, though.




>   make[2]: *** [arch/x86/boot/compressed/Makefile:143: arch/x86/boot/compressed/vmlinux.bin.lz4] Error 1
>   make[1]: *** [arch/x86/boot/Makefile:112: arch/x86/boot/compressed/vmlinux] Error 2
>   make: *** [arch/x86/Makefile:290: bzImage] Error 2
>
> Fail the build much earlier by checking for lz4c presence before doing
> anything else.


Is it necessary to check this earlier?

If you get this error, you just need to install the tool.
Then, you can re-run the incremental build.


BTW, this patch has a drawback.

[1] Enable CONFIG_KERNEL_LZ4 on the system
    without lz4c installed

[2] Run 'make' and you will get the error
    "lz4 tool not found on this system but CONFIG_KERNEL_LZ4 enabled"

[3] Run 'make menuconfig' and
    switch from CONFIG_KERNEL_LZ4 to CONFIG_KERNEL_GZIP

[4] Run 'make' and you will still get the same error
    even after you have chosen to use GZIP instead of LZ4.




> Signed-off-by: Borislav Petkov <bp@suse.de>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index a0c32de80482..f91de649234b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -788,6 +788,12 @@ KBUILD_CFLAGS_KERNEL += -ffunction-sections -fdata-sections
>  LDFLAGS_vmlinux += --gc-sections
>  endif
>
> +ifdef CONFIG_KERNEL_LZ4
> +ifeq ($(CONFIG_SHELL which lz4c),)
> +$(error "lz4 tool not found on this system but CONFIG_KERNEL_LZ4 enabled")
> +endif
> +endif
> +
>  # arch Makefile may override CC so keep this after arch Makefile is included
>  NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>
> --
> 2.19.0.271.gfe8321ec057f
>


-- 
Best Regards
Masahiro Yamada
