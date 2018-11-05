Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f67.google.com ([209.85.166.67]:39522 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbeKETn5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 14:43:57 -0500
Received: by mail-io1-f67.google.com with SMTP id n11-v6so6087447iob.6
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Nov 2018 02:24:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNASzscQaUYh=ved3UHajsyOWHJwFp8fVS3aOQn_n+WBybg@mail.gmail.com>
References: <20181103201504.29413-1-ard.biesheuvel@linaro.org> <CAK7LNASzscQaUYh=ved3UHajsyOWHJwFp8fVS3aOQn_n+WBybg@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 5 Nov 2018 11:24:55 +0100
Message-ID: <CAKv+Gu-k7Qy-HuEb9jGuC-Aq1TO7aO8NCwMDLgpK99uaah-msQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "kbuild: add --include-dir flag only for
 out-of-tree build"
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Riku Voipio <riku.voipio@linaro.org>

On 5 November 2018 at 08:57, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi Ard,
>
>
> On Sun, Nov 4, 2018 at 5:15 AM Ard Biesheuvel <ard.biesheuvel@linaro.org>=
 wrote:
>>
>> This reverts commit 80463f1b7bf9f822fd3495139bcf3ef254fdca10, because
>> it breaks the bindeb-pkg build target in the following way:
>>
>>   ...
>>     LD [M]  sound/soc/rockchip/snd-soc-rk3399-gru-sound.ko
>>     LD [M]  sound/soc/rockchip/snd-soc-rockchip-pcm.ko
>>     LD [M]  sound/soc/rockchip/snd-soc-rockchip-rt5645.ko
>>     LD [M]  sound/soc/rockchip/snd-soc-rockchip-spdif.ko
>>     LD [M]  sound/soc/sh/rcar/snd-soc-rcar.ko
>>    fakeroot -u debian/rules binary
>>   make KERNELRELEASE=3D4.19.0-12677-g19beffaf7a99-dirty ARCH=3Darm64 KBU=
ILD_SRC=3D intdeb-pkg
>>   /bin/bash /home/ard/linux/scripts/package/builddeb
>>   Makefile:600: include/config/auto.conf: No such file or directory
>>   ***
>>   *** Configuration file ".config" not found!
>>   ***
>>   *** Please run some configurator (e.g. "make oldconfig" or
>>   *** "make menuconfig" or "make xconfig").
>>   ***
>>   make[12]: *** [syncconfig] Error 1
>>   make[11]: *** [syncconfig] Error 2
>>   make[10]: *** [include/config/auto.conf] Error 2
>>   make[9]: *** [__sub-make] Error 2
>>   cp: cannot stat '/home/ard/linux/scripts/kconfig/Makefile:69: recipe f=
or target '\''syncconfig'\'' failed'$'\n''/home/ard/linux/Makefile:544: rec=
ipe for target '\''syncconfig'\'' failed'$'\n''Makefile:640: recipe for tar=
get '\''include/config/auto.conf'\'' failed'$'\n''Makefile:15: recipe for t=
arget '\''__sub-make'\'' failed': No such file or directory
>>   /home/ard/linux/scripts/package/Makefile:83: recipe for target 'intdeb=
-pkg' failed
>>   make[8]: *** [intdeb-pkg] Error 1
>>   /home/ard/linux/Makefile:1399: recipe for target 'intdeb-pkg' failed
>>   make[7]: *** [intdeb-pkg] Error 2
>>   Makefile:152: recipe for target 'sub-make' failed
>>   make[6]: *** [sub-make] Error 2
>>   Makefile:15: recipe for target '__sub-make' failed
>>   make[5]: *** [__sub-make] Error 2
>>   debian/rules:7: recipe for target 'binary-arch' failed
>>   make[4]: *** [binary-arch] Error 2
>>   dpkg-buildpackage: error: fakeroot -u debian/rules binary gave error e=
xit status 2
>>   /home/ard/linux/scripts/package/Makefile:79: recipe for target 'bindeb=
-pkg' failed
>>   make[3]: *** [bindeb-pkg] Error 2
>>   /home/ard/linux/Makefile:1399: recipe for target 'bindeb-pkg' failed
>>   make[2]: *** [bindeb-pkg] Error 2
>>   Makefile:152: recipe for target 'sub-make' failed
>>   make[1]: *** [sub-make] Error 2
>>   Makefile:15: recipe for target '__sub-make' failed
>>   make: *** [__sub-make] Error 2
>>
>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>
>
>
> Sorry for the breakage, and thanks for your report.
>
> I'd like to fix the root cause in the builddeb script
> instead of the revert.
>

Sure, that makes sense. I don't understand Kbuild well enough to argue
that, it's just that the reverted patch stated that the --include-dir
argument was apparently unneeded, and I concluded that perhaps that
statement was inaccurate.
