Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:31458 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728453AbfJSAOg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Oct 2019 20:14:36 -0400
MIME-Version: 1.0
References: <20191018220753.10002-1-sashal@kernel.org> <20191018220753.10002-39-sashal@kernel.org>
In-Reply-To: <20191018220753.10002-39-sashal@kernel.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 19 Oct 2019 09:13:50 +0900
Message-ID: <CAK7LNASOb9RwtO-qV5Fh9ezA791Q8Jv8KU740dkzQVaht8fKzw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 4.14 39/56] kbuild: fix build error of 'make
 nsdeps' in clean tree
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Matthias Maennich <maennich@google.com>, Jessica Yu <jeyu@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Oct 19, 2019 at 7:15 AM Sasha Levin <sashal@kernel.org> wrote:
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
> index 93c3467eeb8c9..731a2ce8a749a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -554,7 +554,7 @@ endif
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
