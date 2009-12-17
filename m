Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60228 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935878AbZLQWeX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Dec 2009 17:34:23 -0500
Message-ID: <4B2AB1F8.8090100@suse.cz>
Date: Thu, 17 Dec 2009 23:34:32 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Makefile.build: Fix built-in.o linking errors
References: <20091216170114.0b50c25debf12a9aa545bf810459b532.5b12d5606d.wbe@email.secureserver.net>
In-Reply-To: <20091216170114.0b50c25debf12a9aa545bf810459b532.5b12d5606d.wbe@email.secureserver.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiafu He <jay@goldhive.com>
Cc: linux-kbuild@vger.kernel.org

Jiafu He napsal(a):
> This patch fixes two linking errors regarding the empty built-in.o:
> - Error "...built-in.o: no such file or directory" happens if
> "dirx/Makefile" contains only "obj-m += diry/ dirz/" and the empty
> "dirx/built-in.o" is missing. Adding $(subdir-m) into check for
> builtin-target fixes this error.
> - Linking the child builtin.o's using arm-xscale-linux-gnueabi linker
> fails with an EABI version mismatch error "... has EABI version 0, but
> ... has EABI verion 4". The cause is built-in.o created by $(AR) has
> EABI verison 0, while the non-empty built-in.o's have EABI version 4.
> The fix is to use $(CC) to create the empty built-in.o.
> 
> The fixes have been tested with x86/x86_64 native platforms and the
> arm-xscale-linux-gnueabi cross-compiler.
> 
> Signed-off-by: Jiafu He <jay@goldhive.com>
> -----
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 341b589..c8c8c81 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -82,7 +82,7 @@ ifneq ($(strip $(lib-y) $(lib-m) $(lib-n) $(lib-)),)
>  lib-target := $(obj)/lib.a
>  endif
>  
> -ifneq ($(strip $(obj-y) $(obj-m) $(obj-n) $(obj-) $(lib-target)),)
> +ifneq ($(strip $(obj-y) $(obj-m) $(obj-n) $(obj-) $(subdir-m)
> $(lib-target)),)
>  builtin-target := $(obj)/built-in.o
>  endif

Ack on this part, I need to think a bit more about the second part :).
Could you please send two separate patches, they fix two independent
issues after all.

Thanks,
Michal

>  
> @@ -291,7 +291,7 @@ quiet_cmd_link_o_target = LD      $@
>  cmd_link_o_target = $(if $(strip $(obj-y)),\
>                       $(LD) $(ld_flags) -r -o $@ $(filter $(obj-y), $^)
> \
>                       $(cmd_secanalysis),\
> -                     rm -f $@; $(AR) rcs $@)
> +                     rm -f $@; $(CC) -c -xassembler /dev/null -o $@)
>  
>  $(builtin-target): $(obj-y) FORCE
>         $(call if_changed,link_o_target)
> -----
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

