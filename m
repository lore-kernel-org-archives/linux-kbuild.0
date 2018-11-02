Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1044 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbeKBSvO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Nov 2018 14:51:14 -0400
Subject: Re: [PATCH] kbuild: consolidate single targets
References: <1540873965-31342-1-git-send-email-yamada.masahiro@socionext.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <945484cd-50b4-74df-f091-d796264e5643@nvidia.com>
Date: Fri, 2 Nov 2018 09:44:36 +0000
MIME-Version: 1.0
In-Reply-To: <1540873965-31342-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org


On 30/10/2018 04:32, Masahiro Yamada wrote:
> Instead of specifying target/source pairs, let's list patterns that we
> want to handle as single targets. This slightly changes the behavior;
> the top Makefile previously checked the presence of a source file,
> now Kbuild will descend into a subdirectory anyway to find out what to
> do there.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Makefile | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index be76e6e..7d13add 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1713,21 +1713,7 @@ else
>          target-dir = $(if $(KBUILD_EXTMOD),$(dir $<),$(dir $@))
>  endif
>  
> -%.s: %.c prepare scripts FORCE
> -	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> -%.i: %.c prepare scripts FORCE
> -	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> -%.o: %.c prepare scripts FORCE
> -	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> -%.lst: %.c prepare scripts FORCE
> -	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> -%.s: %.S prepare scripts FORCE
> -	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> -%.o: %.S prepare scripts FORCE
> -	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> -%.symtypes: %.c prepare scripts FORCE
> -	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> -%.ll: %.c prepare scripts FORCE
> +%.i %.ll %.lst %.o %.s %.symtypes: prepare scripts FORCE
>  	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>  
>  # Modules

On one of my build machines (an older ubuntu 14.04 machine), this is
commit is causing 'make mrproper' or 'make distclean' to fail. Reverting
this commit fixes the problem.

$ make mrproper
Error: kernelrelease not valid - run 'make prepare' to update it
  CC      kernel/bounds.s
In file included from <command-line>:0:0:
././include/linux/kconfig.h:5:32: fatal error: generated/autoconf.h: No
such file or directory
 #include <generated/autoconf.h>
                                ^
compilation terminated.
make[1]: *** [kernel/bounds.s] Error 1
make: *** [prepare0] Error 2

FWIW, this machine has ...

$ make --version
GNU Make 3.81

Cheers
Jon

-- 
nvpublic
