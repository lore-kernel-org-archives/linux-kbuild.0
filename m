Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:64903 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750737AbdECELI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 May 2017 00:11:08 -0400
MIME-Version: 1.0
In-Reply-To: <20170414215450.18307-3-sthemmin@microsoft.com>
References: <20170414215450.18307-1-sthemmin@microsoft.com> <20170414215450.18307-3-sthemmin@microsoft.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 3 May 2017 13:10:52 +0900
Message-ID: <CAK7LNATjXkvuRO7iF7uAa1WwWSAH-JxGv6-ksVrdTaMJOhgbKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: remove initramfs cpio with mrproper
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>

Hi Stephen,


2017-04-15 6:54 GMT+09:00 Stephen Hemminger <stephen@networkplumber.org>:
> When 'make mrproper' is done, it should also remove the initramfs cpio
> file. I ran into this while doing test build on one machine, followed
> by make mrproper and rsync to a target machine. The build on the target
> machine would succeed but be unbootable because of the bad initramfs.


I think initramfs_data.cpio.* is unneeded for external modules.

So, shouldn't it removed by 'make clean', instead of 'make mrproper'?




> Signed-off-by: Stephen Hemminger <sthemmin@microsoft.com>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 04ca211552f7..954292695bf6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1276,7 +1276,8 @@ MRPROPER_FILES += .config .config.old .version .old_version \
>                   Module.symvers tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS \
>                   certs/signing_key.pem certs/signing_key.priv certs/signing_key.x509   \
>                   certs/x509.genkey certs/extra_certificates certs/signing_key.x509.keyid \
> -                 certs/signing_key.x509.signer vmlinux-gdb.py
> +                 certs/signing_key.x509.signer vmlinux-gdb.py \
> +                 usr/initramfs_data.cpio.gz
>

As you see usr/Makefile,
datafile_y = initramfs_data.cpio$(suffix_y)

The suffix could be .gz, .bz2, .xz, etc.


Why only initramfs_data.cpio.gz?



-- 
Best Regards
Masahiro Yamada
