Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:40702 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfB0LcB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Feb 2019 06:32:01 -0500
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/5] scripts/gdb: delay generation of gdb constants.py
References: <1550568787-18710-1-git-send-email-yamada.masahiro@socionext.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <67ed9090-2b9e-8e3f-e036-1e9f783cf523@ideasonboard.com>
Date: Wed, 27 Feb 2019 11:31:56 +0000
MIME-Version: 1.0
In-Reply-To: <1550568787-18710-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org

Hi Yamada-san

Thank you for the patch,

On 19/02/2019 09:33, Masahiro Yamada wrote:
> scripts/gdb/linux/constants.py is never used in the kernel build
> process. There is no good reason to create it so early.
> 

I agree, I originally put it here to ensure it was only built after
bounds.h (following the asm-offsets.h example I expect). It has no
requirement to be built in this stage itself.

Depending on the prepare stage instead sounds a lot more reasonable.

Thanks

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Get it out of the 'prepare' stage.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Kbuild   | 10 ----------
>  Makefile | 11 +++++++++++
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/Kbuild b/Kbuild
> index 65db5be..4cebcc7 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -6,7 +6,6 @@
>  # 2) Generate timeconst.h
>  # 3) Generate asm-offsets.h (may need bounds.h and timeconst.h)
>  # 4) Check for missing system calls
> -# 5) Generate constants.py (may need bounds.h)
>  
>  #####
>  # 1) Generate bounds.h
> @@ -58,14 +57,5 @@ quiet_cmd_syscalls = CALL    $<
>  missing-syscalls: scripts/checksyscalls.sh $(offsets-file) FORCE
>  	$(call cmd,syscalls)
>  
> -#####
> -# 5) Generate constants for Python GDB integration
> -#
> -
> -extra-$(CONFIG_GDB_SCRIPTS) += build_constants_py
> -
> -build_constants_py: $(timeconst-file) $(bounds-file)
> -	@$(MAKE) $(build)=scripts/gdb/linux $@
> -
>  # Keep these three files during make clean
>  no-clean-files := $(bounds-file) $(offsets-file) $(timeconst-file)
> diff --git a/Makefile b/Makefile
> index 88db36b..26dbcb7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1513,6 +1513,17 @@ PHONY += $(DOC_TARGETS)
>  $(DOC_TARGETS): scripts_basic FORCE
>  	$(Q)$(MAKE) $(build)=Documentation $@
>  
> +# Misc
> +# ---------------------------------------------------------------------------
> +
> +PHONY += scripts_gdb
> +scripts_gdb: prepare
> +	$(Q)$(MAKE) $(build)=scripts/gdb/linux build_constants_py
> +
> +ifdef CONFIG_GDB_SCRIPTS
> +all: scripts_gdb
> +endif
> +
>  else # KBUILD_EXTMOD
>  
>  ###
> 


-- 
Regards
--
Kieran
