Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:34074 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727796AbfC0TU3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Mar 2019 15:20:29 -0400
Date: Wed, 27 Mar 2019 19:20:21 +0000
From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH] kbuild: do not overwrite .gitignore in output directory
Message-ID: <20190327192021.5d676019@donnerap.cambridge.arm.com>
In-Reply-To: <1553574418-21033-1-git-send-email-yamada.masahiro@socionext.com>
References: <1553574418-21033-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Tue, 26 Mar 2019 13:26:58 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

Masahiro,

> Commit 3a51ff344204 ("kbuild: gitignore output directory") seemed to
> bother people who version-control output directories.

Thanks a lot for the patch, that works for me.

> Andre Przywara says:
> "Unfortunately this breaks my setup, because I keep a totally separate
> git repository in my build directories to track (various versions of)
> .config. So .gitignore there is carefully crafted to ignore most build
> artefacts, but not .config, for instance."
> 
> Link: https://lkml.org/lkml/2019/3/22/1819
> Reported-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Tested-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre.

> ---
> 
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 5fe5431..70fc778 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -499,7 +499,8 @@ outputmakefile:
>  ifneq ($(KBUILD_SRC),)
>  	$(Q)ln -fsn $(srctree) source
>  	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile $(srctree)
> -	$(Q){ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
> +	$(Q)test -e .gitignore || \
> +	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
>  endif
>  
>  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
