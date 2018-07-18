Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:31021 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbeGRX4F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Jul 2018 19:56:05 -0400
MIME-Version: 1.0
In-Reply-To: <20180713162458.22154-2-olof@lixom.net>
References: <20180713162458.22154-1-olof@lixom.net> <20180713162458.22154-2-olof@lixom.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 19 Jul 2018 08:14:58 +0900
Message-ID: <CAK7LNATV78V6EVxAZGsSypD4KrqbkfO2++GP2dMXZ-agzbMMXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: buildtar: add arm64 support
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>

2018-07-14 1:24 GMT+09:00 Olof Johansson <olof@lixom.net>:
> Make 'make tar-pkg' work on arm64.
>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---

Applied to linux-kbuild. Thanks!



>  scripts/package/buildtar | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 55887ac84ee4..d624a07a4e77 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -105,6 +105,14 @@ case "${ARCH}" in
>                         cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
>                 fi
>                 ;;
> +       arm64)
> +               for i in Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo ; do
> +                       if [ -f "${objtree}/arch/arm64/boot/${i}" ] ; then
> +                               cp -v -- "${objtree}/arch/arm64/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
> +                               break
> +                       fi
> +               done
> +               ;;
>         *)
>                 [ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
>                 echo "" >&2
> --
> 2.11.0
>



-- 
Best Regards
Masahiro Yamada
