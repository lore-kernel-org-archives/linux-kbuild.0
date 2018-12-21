Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43099 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730712AbeLUHr4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Dec 2018 02:47:56 -0500
Received: by mail-pl1-f195.google.com with SMTP id gn14so2128768plb.10
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Dec 2018 23:47:56 -0800 (PST)
Date: Fri, 21 Dec 2018 13:17:49 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] deb-pkg: generate correct build dependencies
Message-ID: <20181221074749.GA11848@Mani-XPS-13-9360>
References: <20181213080711.8907-1-riku.voipio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213080711.8907-1-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, debian-kernel@lists.debian.org

On Thu, Dec 13, 2018 at 10:07:11AM +0200, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
> 
> bison/flex is now needed always for building since genksyms is always
> generated. Some build dependencies depend on kernel configuration,
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

Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Regards,
Mani

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
