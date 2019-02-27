Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:41172 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfB0Lsh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Feb 2019 06:48:37 -0500
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 4/5] kbuild: create symlink to vmlinux-gdb.py in
 scripts_gdb target
References: <1550568787-18710-1-git-send-email-yamada.masahiro@socionext.com>
 <1550568787-18710-4-git-send-email-yamada.masahiro@socionext.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <d438549c-91f2-593a-bfa3-4b93bb312a90@ideasonboard.com>
Date: Wed, 27 Feb 2019 11:48:32 +0000
MIME-Version: 1.0
In-Reply-To: <1550568787-18710-4-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Hi Yamada-san,

On 19/02/2019 09:33, Masahiro Yamada wrote:
> It is weird to create gdb stuff as a side-effect of vmlinux.
> 
> Move it to a more relevant place.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Makefile | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index a5762c6..0459260 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1015,9 +1015,6 @@ cmd_link-vmlinux =                                                 \
>  	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>  
>  vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE
> -ifdef CONFIG_GDB_SCRIPTS
> -	$(Q)ln -fsn $(abspath $(srctree)/scripts/gdb/vmlinux-gdb.py)
> -endif

My initial thought was, doesn't this have a dependency on the vmlinux
... but of course it doesn't. It's not symlinking to the output binary -
it's creating a helper link for GDB to know how to tie in the
scripts-gdb package. It doesn't require vmlinux to exist at all.

So yes, I agree this is fine.


>  	+$(call if_changed,link-vmlinux)
>  
>  targets := vmlinux
> @@ -1519,6 +1516,7 @@ $(DOC_TARGETS): scripts_basic FORCE
>  PHONY += scripts_gdb
>  scripts_gdb: prepare
>  	$(Q)$(MAKE) $(build)=scripts/gdb
> +	$(Q)ln -fsn $(abspath $(srctree)/scripts/gdb/vmlinux-gdb.py)

and especially as we now have this convenient location for it.
This looks much better.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>  
>  ifdef CONFIG_GDB_SCRIPTS
>  all: scripts_gdb
> 


-- 
Regards
--
Kieran
