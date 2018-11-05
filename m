Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f194.google.com ([209.85.166.194]:36418 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728827AbeKEUZn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 15:25:43 -0500
Received: by mail-it1-f194.google.com with SMTP id w7-v6so11982936itd.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Nov 2018 03:06:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1541404354-30331-1-git-send-email-yamada.masahiro@socionext.com>
References: <1541404354-30331-1-git-send-email-yamada.masahiro@socionext.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 5 Nov 2018 12:06:32 +0100
Message-ID: <CAKv+Gu9wH0DwyuXa6ev+omrmRu09f_N88mcz443oky=ha76Z-A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: fix bindeb-pkg breakage when O= is used
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 5 November 2018 at 08:52, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Ard Biesheuvel reports bindeb-pkg with O= option is broken in the
> following way:
>
>   ...
>     LD [M]  sound/soc/rockchip/snd-soc-rk3399-gru-sound.ko
>     LD [M]  sound/soc/rockchip/snd-soc-rockchip-pcm.ko
>     LD [M]  sound/soc/rockchip/snd-soc-rockchip-rt5645.ko
>     LD [M]  sound/soc/rockchip/snd-soc-rockchip-spdif.ko
>     LD [M]  sound/soc/sh/rcar/snd-soc-rcar.ko
>    fakeroot -u debian/rules binary
>   make KERNELRELEASE=4.19.0-12677-g19beffaf7a99-dirty ARCH=arm64 KBUILD_SRC= intdeb-pkg
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
>   ...
>
> Prior to commit 80463f1b7bf9 ("kbuild: add --include-dir flag only
> for out-of-tree build"), both objtree and srctree were added to
> --include-dir, and the wrong code '$MAKE image_name' was working
> relying on that. Now, the potential issue that had previously been
> hidden just showed up.
>
> '$MAKE image_name' recurses to the generated $(objtree)/Makefile and
> ends up with running in srctree, which is incorrect. It should be
> invoked with '-f $srctree/Makefile' (or KBUILD_SRC=) to be executed
> in objtree.
>
> Fixes: 80463f1b7bf9 ("kbuild: add --include-dir flag only for out-of-tree build")
> Reported-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

This fixes the issue I was seeing

Tested-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Thanks.

> ---
>
>  scripts/package/builddeb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 90c9a8a..0b31f4f 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -81,7 +81,7 @@ else
>         cp System.map "$tmpdir/boot/System.map-$version"
>         cp $KCONFIG_CONFIG "$tmpdir/boot/config-$version"
>  fi
> -cp "$($MAKE -s image_name)" "$tmpdir/$installed_image_path"
> +cp "$($MAKE -s -f $srctree/Makefile image_name)" "$tmpdir/$installed_image_path"
>
>  if grep -q "^CONFIG_OF=y" $KCONFIG_CONFIG ; then
>         # Only some architectures with OF support have this target
> --
> 2.7.4
>
