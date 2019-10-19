Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:46420 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728453AbfJSAPD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Oct 2019 20:15:03 -0400
MIME-Version: 1.0
References: <20191018220324.8165-1-sashal@kernel.org> <20191018220324.8165-50-sashal@kernel.org>
In-Reply-To: <20191018220324.8165-50-sashal@kernel.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 19 Oct 2019 09:14:13 +0900
Message-ID: <CAK7LNARovn6jNGUBQbn-0KbwsCfC6GHE-ybqHDvRUXiCCDuMZA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.3 50/89] kbuild: fix build error of 'make
 nsdeps' in clean tree
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Matthias Maennich <maennich@google.com>, Jessica Yu <jeyu@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Oct 19, 2019 at 7:04 AM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> [ Upstream commit d85103ac78a6d8573b21348b36f4cca2e1839a31 ]
>
> Running 'make nsdeps' in a clean source tree fails as follows:
>
> $ make -s clean; make -s defconfig; make nsdeps
>    [ snip ]
> awk: fatal: cannot open file `init/modules.order' for reading (No such file or directory)
> make: *** [Makefile;1307: modules.order] Error 2
> make: *** Deleting file 'modules.order'
> make: *** Waiting for unfinished jobs....
>
> The cause of the error is 'make nsdeps' does not build modules at all.
> Set KBUILD_MODULES to fix it.
>
> Reviewed-by: Matthias Maennich <maennich@google.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Jessica Yu <jeyu@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

nsdeps was introduced in v5.4

Please do not backport this commit.



>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index d7469f0926a67..62b9640d007a0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -594,7 +594,7 @@ endif
>  # in addition to whatever we do anyway.
>  # Just "make" or "make all" shall build modules as well
>
> -ifneq ($(filter all _all modules,$(MAKECMDGOALS)),)
> +ifneq ($(filter all _all modules nsdeps,$(MAKECMDGOALS)),)
>    KBUILD_MODULES := 1
>  endif
>
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
