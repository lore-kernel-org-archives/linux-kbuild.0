Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:30736 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbeGRXzr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Jul 2018 19:55:47 -0400
MIME-Version: 1.0
In-Reply-To: <20180713162458.22154-1-olof@lixom.net>
References: <20180713162458.22154-1-olof@lixom.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 19 Jul 2018 08:14:42 +0900
Message-ID: <CAK7LNAT-xU_YOw2ox8iZvguj8w6yVZmiG560rPxnVh2DyDjvCg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: buildtar: remove crufty vax pieces
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-14 1:24 GMT+09:00 Olof Johansson <olof@lixom.net>:
> ARCH=vax isn't in mainline; it can be added back if/when it shows up.
>
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---

Applied to linux-kbuild. Thanks!


>  scripts/package/buildtar | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index e8cc72a51b32..55887ac84ee4 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -84,10 +84,6 @@ case "${ARCH}" in
>                 [ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
>                 [ -f "${objtree}/lifimage" ] && cp -v -- "${objtree}/lifimage" "${tmpdir}/boot/lifimage-${KERNELRELEASE}"
>                 ;;
> -       vax)
> -               [ -f "${objtree}/vmlinux.SYS" ] && cp -v -- "${objtree}/vmlinux.SYS" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}.SYS"
> -               [ -f "${objtree}/vmlinux.dsk" ] && cp -v -- "${objtree}/vmlinux.dsk" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}.dsk"
> -               ;;
>         mips)
>                 if [ -f "${objtree}/arch/mips/boot/compressed/vmlinux.bin" ]; then
>                         cp -v -- "${objtree}/arch/mips/boot/compressed/vmlinux.bin" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
