Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:24433 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbgACPDp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 10:03:45 -0500
MIME-Version: 1.0
References: <20191230140747.50415-1-ardb@kernel.org>
In-Reply-To: <20191230140747.50415-1-ardb@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 4 Jan 2020 00:03:03 +0900
Message-ID: <CAK7LNASVcLMPVECckdeGKgtgNy=48ONUDyKcbEF6wtvzaQ+jEQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild/deb-pkg: annotate libelf-dev dependency as :native
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Riku Voipio <riku.voipio@linaro.org>

On Mon, Dec 30, 2019 at 11:07 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Cross compiling the x86 kernel on a non-x86 build machine produces
> the following error when CONFIG_UNWINDER_ORC is enabled, regardless
> of whether libelf-dev is installed or not.
>
>   dpkg-checkbuilddeps: error: Unmet build dependencies: libelf-dev
>   dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
>   dpkg-buildpackage: warning: (Use -d flag to override.)
>
> Since this is a build time dependency for a build tool, we need to
> depend on the native version of libelf-dev so add the appropriate
> annotation.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Applied to linux-kbuild/fixes.
Thanks.


> ---
>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 7c230016b08d..357dc56bcf30 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -136,7 +136,7 @@ mkdir -p debian/source/
>  echo "1.0" > debian/source/format
>
>  echo $debarch > debian/arch
> -extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev)"
> +extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev:native)"
>  extra_build_depends="$extra_build_depends, $(if_enabled_echo CONFIG_SYSTEM_TRUSTED_KEYRING libssl-dev:native)"
>
>  # Generate a simple changelog template
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
