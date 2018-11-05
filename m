Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:61253 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725737AbeKERQl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 12:16:41 -0500
MIME-Version: 1.0
References: <20181103201504.29413-1-ard.biesheuvel@linaro.org>
In-Reply-To: <20181103201504.29413-1-ard.biesheuvel@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 5 Nov 2018 16:57:19 +0900
Message-ID: <CAK7LNASzscQaUYh=ved3UHajsyOWHJwFp8fVS3aOQn_n+WBybg@mail.gmail.com>
Subject: Re: [PATCH] Revert "kbuild: add --include-dir flag only for
 out-of-tree build"
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Riku Voipio <riku.voipio@linaro.org>

Hi Ard,


On Sun, Nov 4, 2018 at 5:15 AM Ard Biesheuvel <ard.biesheuvel@linaro.org> w=
rote:
>
> This reverts commit 80463f1b7bf9f822fd3495139bcf3ef254fdca10, because
> it breaks the bindeb-pkg build target in the following way:
>
>   ...
>     LD [M]  sound/soc/rockchip/snd-soc-rk3399-gru-sound.ko
>     LD [M]  sound/soc/rockchip/snd-soc-rockchip-pcm.ko
>     LD [M]  sound/soc/rockchip/snd-soc-rockchip-rt5645.ko
>     LD [M]  sound/soc/rockchip/snd-soc-rockchip-spdif.ko
>     LD [M]  sound/soc/sh/rcar/snd-soc-rcar.ko
>    fakeroot -u debian/rules binary
>   make KERNELRELEASE=3D4.19.0-12677-g19beffaf7a99-dirty ARCH=3Darm64 KBUI=
LD_SRC=3D intdeb-pkg
>   /bin/bash /home/ard/linux/scripts/package/builddeb
>   Makefile:600: include/config/auto.conf: No such file or directory
>   ***
>   *** Configuration file ".config" not found!
>   ***
>   *** Please run some configurator (e.g. "make oldconfig" or
>   *** "make menuconfig" or "make xconfig").
>   ***
>   make[12]: *** [syncconfig] Error 1
>   make[11]: *** [syncconfig] Error 2
>   make[10]: *** [include/config/auto.conf] Error 2
>   make[9]: *** [__sub-make] Error 2
>   cp: cannot stat '/home/ard/linux/scripts/kconfig/Makefile:69: recipe fo=
r target '\''syncconfig'\'' failed'$'\n''/home/ard/linux/Makefile:544: reci=
pe for target '\''syncconfig'\'' failed'$'\n''Makefile:640: recipe for targ=
et '\''include/config/auto.conf'\'' failed'$'\n''Makefile:15: recipe for ta=
rget '\''__sub-make'\'' failed': No such file or directory
>   /home/ard/linux/scripts/package/Makefile:83: recipe for target 'intdeb-=
pkg' failed
>   make[8]: *** [intdeb-pkg] Error 1
>   /home/ard/linux/Makefile:1399: recipe for target 'intdeb-pkg' failed
>   make[7]: *** [intdeb-pkg] Error 2
>   Makefile:152: recipe for target 'sub-make' failed
>   make[6]: *** [sub-make] Error 2
>   Makefile:15: recipe for target '__sub-make' failed
>   make[5]: *** [__sub-make] Error 2
>   debian/rules:7: recipe for target 'binary-arch' failed
>   make[4]: *** [binary-arch] Error 2
>   dpkg-buildpackage: error: fakeroot -u debian/rules binary gave error ex=
it status 2
>   /home/ard/linux/scripts/package/Makefile:79: recipe for target 'bindeb-=
pkg' failed
>   make[3]: *** [bindeb-pkg] Error 2
>   /home/ard/linux/Makefile:1399: recipe for target 'bindeb-pkg' failed
>   make[2]: *** [bindeb-pkg] Error 2
>   Makefile:152: recipe for target 'sub-make' failed
>   make[1]: *** [sub-make] Error 2
>   Makefile:15: recipe for target '__sub-make' failed
>   make: *** [__sub-make] Error 2
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>



Sorry for the breakage, and thanks for your report.

I'd like to fix the root cause in the builddeb script
instead of the revert.

https://patchwork.kernel.org/patch/10667541/


Thanks.



--=20
Best Regards
Masahiro Yamada
