Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:48439 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758106AbYKVLmH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 22 Nov 2008 06:42:07 -0500
Date: Sat, 22 Nov 2008 12:43:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Kbuild: generate debug info in building
Message-ID: <20081122114329.GB24848@uranus.ravnborg.org>
References: <4922238C.40807@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4922238C.40807@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wenji Huang <wenji.huang@oracle.com>
Cc: linux-kbuild@vger.kernel.org

On Tue, Nov 18, 2008 at 10:08:12AM +0800, Wenji Huang wrote:
> This patch will generate kernel debuginfo in Kbuild when invoking "make
> debug_info". The separate debug files are in .debug under building tree.
> They can help the cases of requiring debug info for tracing/debug tools,
> especially cross-compilation. Moreover, it can simplify or standardize
> the packaging process for the distributions those will provide
> kernel-debuginfo.
> 
> Signed-off-by: Wenji Huang <wenji.huang@oracle.com>

Hi Wenji.

Can you tell a bit more why we need this?
I do not see anyone really asking for this.

Apart form the rationale why this is needed I have a few
comments to your patch.

Why do we need to hide this in a hidden directory?

> ---
>  Makefile                 |   14 ++++++++++++++
>  scripts/Makefile.modpost |   14 ++++++++++++++
>  2 files changed, 28 insertions(+), 0 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 7f9ff9b..eed7510 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -814,6 +814,20 @@ define rule_vmlinux-modpost
>  	$(Q)echo 'cmd_$@ := $(cmd_vmlinux-modpost)' > $(dot-target).cmd
>  endef
> 
> +ifdef CONFIG_DEBUG_INFO
> +quiet_cmd_vmlinux_debug = GEN     $<.debug
> +      cmd_vmlinux_debug = mkdir -p .debug;                          \
> +                          $(OBJCOPY) --only-keep-debug              \
> +                                     $< .debug/$<.debug
> +targets += vmlinux.debug
> +endif

There is no reason to use ifdef around the above definitions.
They are harmless is DEBUG_INFO is not defined and the ifdef makes
this file even less reaable.

> +
> +debug_info: vmlinux FORCE
> +ifdef CONFIG_DEBUG_INFO
> +	$(call if_changed,vmlinux_debug)
> +	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost $@
> +endif

You need to add a
PHONY += debug_info


> +
>  # vmlinux image - including updated kernel symbols
>  vmlinux: $(vmlinux-lds) $(vmlinux-init) $(vmlinux-main) vmlinux.o
> $(kallsyms.o) FORCE
>  ifdef CONFIG_HEADERS_CHECK
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index f4053dc..0df73b2 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -137,6 +137,20 @@ $(modules): %.ko :%.o %.mod.o FORCE
> 
>  targets += $(modules)
> 
> +modules-debug := $(modules:.ko=.ko.debug)
> +ifdef CONFIG_DEBUG_INFO
> +quiet_cmd_debug_ko = GEN     $@
> +      cmd_debug_ko = mkdir -p .debug/`dirname $@`;			\
> +		     $(OBJCOPY) --only-keep-debug $< .debug/$@
> +targets += $(modules-debug)
> +endif

drop ifdef/endif
please see if you can use $(dir $@) instead of `dirname $@`

> +
> +debug_info: $(modules-debug) FORCE
> +
> +$(modules-debug): $(modules) FORCE
> +ifdef CONFIG_DEBUG_INFO
> +	$(call if_changed,debug_ko)
> +endif

Why is only half of this block ifdeffed out?

> 
>  # Add FORCE to the prequisites of a target to force it to be always
> rebuilt.
>  #

	Sam
