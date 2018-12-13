Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:36374 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbeLMKsK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Dec 2018 05:48:10 -0500
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id wBDAlna6005879
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Dec 2018 19:47:49 +0900
Received: by mail-vk1-f172.google.com with SMTP id n126so329906vke.12
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Dec 2018 02:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20181213080711.8907-1-riku.voipio@linaro.org>
In-Reply-To: <20181213080711.8907-1-riku.voipio@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 13 Dec 2018 19:47:12 +0900
Message-ID: <CAK7LNAT9DMyLRfYSb8MZdubFoQVSwY0PuqCncuiEp-K3t8uOUg@mail.gmail.com>
Subject: Re: [PATCH] deb-pkg: generate correct build dependencies
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, manivannan.sadhasivam@linaro.org, debian-kernel <debian-kernel@lists.debian.org>

On Thu, Dec 13, 2018 at 5:07 PM <riku.voipio@linaro.org> wrote:
>
> From: Riku Voipio <riku.voipio@linaro.org>


The code looks good to me.

Just a comment about the commit log.


> bison/flex is now needed always for building since genksyms is always
> generated.

I do not think this is true.

genksyms is built when CONFIG_MODVERSIONS=y
(See scripts/Makefile)

Rather, bison/flex is always needed for kconfig.





> Some build dependencies depend on kernel configuration,
> enable them as needed:
>
> - libelf-dev when UNWINDER_ORC is set
> - libssl-dev for SYSTEM_TRUSTED_KEYRING
>
> Since the libssl-dev is needed for extract_cert binary, denote with
> :native to install the libssl-dev for the build machines architecture,
> rather than for the architecture of the kernel being built.
>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  scripts/package/mkdebian | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index edcad61fe3cd..c858abf4569e 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -134,6 +134,8 @@ fi
>
>  mkdir -p debian/
>  echo $debarch > debian/arch
> +extra_build_depends=", $(if_enabled_echo UNWINDER_ORC libelf-dev)"
> +extra_build_depends="$extra_build_depends, $(if_enabled_echo SYSTEM_TRUSTED_KEYRING libssl-dev:native)"
>
>  # Generate a simple changelog template
>  cat <<EOF > debian/changelog
> @@ -170,7 +172,7 @@ Source: $sourcename
>  Section: kernel
>  Priority: optional
>  Maintainer: $maintainer
> -Build-Depends: bc, kmod, cpio
> +Build-Depends: bc, kmod, cpio, bison, flex $extra_build_depends
>  Homepage: http://www.kernel.org/
>
>  Package: $packagename
> --
> 2.19.2
>


-- 
Best Regards
Masahiro Yamada
