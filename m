Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:43861 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752358AbbBRX7S (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Feb 2015 18:59:18 -0500
Date: Thu, 19 Feb 2015 00:59:13 +0100
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [RESEND Patch V2 1/4] xen: build infrastructure for generating
 hypercall depending symbols
Message-ID: <20150218235913.GA9843@gmail.com>
References: <1421826565-10826-1-git-send-email-jgross@suse.com>
 <1421826565-10826-2-git-send-email-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421826565-10826-2-git-send-email-jgross@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, xen-devel@lists.xensource.com, konrad.wilk@oracle.com, david.vrabel@citrix.com, boris.ostrovsky@oracle.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, mmarek@suse.cz, linux-kbuild@vger.kernel.org


* Juergen Gross <jgross@suse.com> wrote:

> Today there are several places in the kernel which build tables
> containing one entry for each possible Xen hypercall. Create an
> infrastructure to be able to generate these tables at build time.
> 
> Based-on-patch-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: David Vrabel <david.vrabel@citrix.com>
> ---
>  arch/x86/syscalls/Makefile |  9 +++++++++
>  scripts/xen-hypercalls.sh  | 12 ++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 scripts/xen-hypercalls.sh
> 
> diff --git a/arch/x86/syscalls/Makefile b/arch/x86/syscalls/Makefile
> index 3323c27..a55abb9 100644
> --- a/arch/x86/syscalls/Makefile
> +++ b/arch/x86/syscalls/Makefile
> @@ -19,6 +19,9 @@ quiet_cmd_syshdr = SYSHDR  $@
>  quiet_cmd_systbl = SYSTBL  $@
>        cmd_systbl = $(CONFIG_SHELL) '$(systbl)' $< $@
>  
> +quiet_cmd_hypercalls = HYPERCALLS $@
> +      cmd_hypercalls = $(CONFIG_SHELL) '$<' $@ $(filter-out $<,$^)
> +
>  syshdr_abi_unistd_32 := i386
>  $(uapi)/unistd_32.h: $(syscall32) $(syshdr)
>  	$(call if_changed,syshdr)
> @@ -47,10 +50,16 @@ $(out)/syscalls_32.h: $(syscall32) $(systbl)
>  $(out)/syscalls_64.h: $(syscall64) $(systbl)
>  	$(call if_changed,systbl)
>  
> +$(out)/xen-hypercalls.h: $(srctree)/scripts/xen-hypercalls.sh
> +	$(call if_changed,hypercalls)
> +
> +$(out)/xen-hypercalls.h: $(srctree)/include/xen/interface/xen*.h
> +
>  uapisyshdr-y			+= unistd_32.h unistd_64.h unistd_x32.h
>  syshdr-y			+= syscalls_32.h
>  syshdr-$(CONFIG_X86_64)		+= unistd_32_ia32.h unistd_64_x32.h
>  syshdr-$(CONFIG_X86_64)		+= syscalls_64.h
> +syshdr-$(CONFIG_XEN)		+= xen-hypercalls.h
>  
>  targets	+= $(uapisyshdr-y) $(syshdr-y)

From a core x86 perspective:

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
