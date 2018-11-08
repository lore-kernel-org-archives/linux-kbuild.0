Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:45045 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbeKHL56 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Nov 2018 06:57:58 -0500
MIME-Version: 1.0
References: <CA+7wUsw9a3ecPHtPsMF71zjzmNqyASFP-X6Z_DVa108akVcN-g@mail.gmail.com>
In-Reply-To: <CA+7wUsw9a3ecPHtPsMF71zjzmNqyASFP-X6Z_DVa108akVcN-g@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Nov 2018 11:24:01 +0900
Message-ID: <CAK7LNASUbPF+QB7zjEjc2q=UQp4NGxrh3O33ML=bdtziER2gmA@mail.gmail.com>
Subject: Re: Makefile:611: include/config/auto.conf: No such file or directory
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mathieu Malaterre <malat@debian.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Mathieu,

On Thu, Nov 8, 2018 at 4:48 AM Mathieu Malaterre <malat@debian.org> wrote:
>
> Hi Yamada-san,
>
> Since commit:
>
> 80463f1b7bf9 kbuild: add --include-dir flag only for out-of-tree build
>
> I can no longer run the bindeb-pkg rule. For example:
>
> $ make O=wii ARCH=powerpc wii_defconfig
> $ make -j8 O=wii ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- bindeb-pkg
> ...
>   WRAP    arch/powerpc/boot/dtbImage.wii
> INFO: Uncompressed kernel (size 0x89aa8c) overlaps the address of the
> wrapper(0x600000)
> INFO: Fixing the link_address of wrapper to (0x900000)
> rm arch/powerpc/boot/wii.dtb
>  fakeroot -u debian/rules binary
> make KERNELRELEASE=4.19.0-rc3-wii+ ARCH=powerpc KBUILD_SRC= intdeb-pkg
> /bin/bash ../scripts/package/builddeb
> Makefile:611: include/config/auto.conf: No such file or directory
> ***
> *** Configuration file ".config" not found!
> ***
> *** Please run some configurator (e.g. "make oldconfig" or
> *** "make menuconfig" or "make xconfig").
> ***
> make[11]: *** [syncconfig] Error 1
> make[10]: *** [syncconfig] Error 2
> make[9]: *** [include/config/auto.conf] Error 2
> make[8]: *** [__sub-make] Error 2
> cp: cannot stat '/tmp/linux/scripts/kconfig/Makefile:69: recipe for
> target '\''syncconfig'\'' failed'$'\n''/tmp/linux/Makefile:555: recipe
> for target '\''syncconfig'\'' failed'$'\n''Makefile:646: recipe for
> target '\''include/config/auto.conf'\'' failed'$'\n''Makefile:24:
> recipe for target '\''__sub-make'\'' failed': No such file or
> directory
>
> Would you be able to provide a patch to fix this ?


This is the one:
https://patchwork.kernel.org/patch/10667541/


It is already sitting in linux-next,
and I will also send a pull request to Linus shortly.




-- 
Best Regards
Masahiro Yamada
