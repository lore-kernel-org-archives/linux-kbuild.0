Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:27793 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbeKJB7p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Nov 2018 20:59:45 -0500
MIME-Version: 1.0
References: <1541404354-30331-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1541404354-30331-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 10 Nov 2018 01:17:46 +0900
Message-ID: <CAK7LNARSHRhWM3X2kUe9KOvZMNxndSD3Hx+awOOEV_MMXT2tqw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: fix bindeb-pkg breakage when O= is used
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Nov 5, 2018 at 4:53 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
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
> ---

Applied to linux-kbuild/fixes.


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


-- 
Best Regards
Masahiro Yamada
