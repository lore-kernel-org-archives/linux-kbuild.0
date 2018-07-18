Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59011 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730573AbeGSAAB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Jul 2018 20:00:01 -0400
MIME-Version: 1.0
In-Reply-To: <20180718171507.4837-1-major@redhat.com>
References: <20180718171507.4837-1-major@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 19 Jul 2018 08:19:03 +0900
Message-ID: <CAK7LNATTdQq4fT_jonzdkQ4rQQQC+zaE0c5gwmrfs3=PrUsNGA@mail.gmail.com>
Subject: Re: [PATCH] buildtar: Copy vmlinuz for arm64
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Major Hayden <major@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-19 2:15 GMT+09:00 Major Hayden <major@redhat.com>:
> Copy the architecture-specific compressed kernel image to the
> directory used to make the tar package.
>
> Signed-off-by: Major Hayden <major@redhat.com>
> ---


Thanks for the patch,
but I applied Olof's one, which copy more files.

https://patchwork.kernel.org/patch/10523811/



>  scripts/package/buildtar | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index e8cc72a51b32..a87c8cbc1ba3 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -80,6 +80,9 @@ case "${ARCH}" in
>         alpha)
>                 [ -f "${objtree}/arch/alpha/boot/vmlinux.gz" ] && cp -v -- "${objtree}/arch/alpha/boot/vmlinux.gz" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
>                 ;;
> +       arm64)
> +               [ -f "${objtree}/arch/arm64/boot/Image.gz" ] && cp -v -- "${objtree}/arch/arm64/boot/Image.gz" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
> +               ;;
>         parisc*)
>                 [ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
>                 [ -f "${objtree}/lifimage" ] && cp -v -- "${objtree}/lifimage" "${tmpdir}/boot/lifimage-${KERNELRELEASE}"
> --
> 2.17.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
