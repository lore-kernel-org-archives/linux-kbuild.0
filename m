Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:21809 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfCMRoW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 13:44:22 -0400
MIME-Version: 1.0
References: <1552411404-32271-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1552411404-32271-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 14 Mar 2019 02:43:32 +0900
Message-ID: <CAK7LNARXpg-LwbNnZMySGJHFFjUKes5tCcKx1=mpygpyX3GEJQ@mail.gmail.com>
Subject: Re: [PATCH] deb-pkg: generate correct build dependencies
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Mar 13, 2019 at 2:24 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> From: Riku Voipio <riku.voipio@linaro.org>
>
> bison/flex is now needed always for building for kconfig. Some build
> dependencies depend on kernel configuration, enable them as needed:
>
> - libelf-dev when UNWINDER_ORC is set
> - libssl-dev for SYSTEM_TRUSTED_KEYRING
>
> Since the libssl-dev is needed for extract_cert binary, denote with
> :native to install the libssl-dev for the build machines architecture,
> rather than for the architecture of the kernel being built.
>
> Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
> Acked-by: maximilian attems <maks@stro.at>
> [masahiro.yamada: add change 'flex' to 'flex | flex:native' ]
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>


Applied to linux-kbuild.


> Hi Riku,
>
> I did not get your update, but anyway I changed
> 'flex' to 'flex | flex:native'.
>
> With this change, now I am able to cross-compile deb-pkg.
>
>
>  scripts/package/mkdebian | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index f030961..110cd8d 100755
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
> +Build-Depends: bc, kmod, cpio, bison, flex | flex:native $extra_build_depends
>  Homepage: http://www.kernel.org/
>
>  Package: $packagename
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
