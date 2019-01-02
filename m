Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:24173 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfABV3V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jan 2019 16:29:21 -0500
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x02LTGdg031204
        for <linux-kbuild@vger.kernel.org>; Thu, 3 Jan 2019 06:29:16 +0900
Received: by mail-ua1-f45.google.com with SMTP id c12so10340853uas.6
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Jan 2019 13:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20190102092304.27262-1-riku.voipio@linaro.org>
In-Reply-To: <20190102092304.27262-1-riku.voipio@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 3 Jan 2019 06:28:39 +0900
Message-ID: <CAK7LNARFAth+L_b7i4aR4mPtVTSfDgq2zvvMJah4WR0s97Ny2A@mail.gmail.com>
Subject: Re: [PATCH v2] deb-pkg: generate correct build dependencies
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, debian-kernel <debian-kernel@lists.debian.org>

Hi Riku,



On Wed, Jan 2, 2019 at 6:28 PM <riku.voipio@linaro.org> wrote:
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
> ---
> v2: commit message updated
> ---


$ make defconfig && make bindeb-pkg

worked for me, but

$ make allnoconfig && make bindeb-pkg

failed with

dpkg-checkbuilddeps: error: Unmet build dependencies: flex


I do not know why.



The relevant line in debian/control looks as follows,
but I am not sure if trailing commas are causing the problem.



Build-Depends: bc, kmod, cpio, bison, flex , ,















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
