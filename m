Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:41589 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932091AbcDVSWR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Apr 2016 14:22:17 -0400
Subject: Re: linux-next: Tree for Apr 22 (adjust_autoksyms.sh)
References: <20160422153503.24aa389e@canb.auug.org.au>
 <571A56C4.7030907@infradead.org>
 <alpine.LFD.2.20.1604221345340.27452@knanqh.ubzr>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <571A6BCE.9040904@infradead.org>
Date: Fri, 22 Apr 2016 11:22:06 -0700
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1604221345340.27452@knanqh.ubzr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On 04/22/16 10:48, Nicolas Pitre wrote:
> On Fri, 22 Apr 2016, Randy Dunlap wrote:
> 
>> on x86_64:
>>
>> I'm seeing:
>>
>> /bin/sh: scripts/adjust_autoksyms.sh: No such file or directory
>> /local/lnx/next/linux-next-20160422/Makefile:937: recipe for target 'vmlinux' failed
>>
>> when using O=subdir for the build output directory.
>>
>>
>> Is there a missing $(objtree) somewhere?
> 
> Rather a $(srctree).  Please try the patch below.

Hi,

Yes, this patch helps, but I think there is still a problem.
I think that trim needs to be done after CONFIG_BUILD_DOCSRC and possibly
after CONFIG_SAMPLES are built.  At least CONFIG_BUILD_DOCSRC seems to
cause this error:

Setup is 16508 bytes (padded to 16896 bytes).
System is 6125 kB
CRC 8aa70f94
Kernel: arch/x86/boot/bzImage is ready  (#9)
ERROR: "cn_del_callback" [Documentation/connector/cn_test.ko] undefined!
ERROR: "cn_add_callback" [Documentation/connector/cn_test.ko] undefined!
ERROR: "cn_netlink_send" [Documentation/connector/cn_test.ko] undefined!
../scripts/Makefile.modpost:91: recipe for target '__modpost' failed
make[2]: *** [__modpost] Error 1



If I'm reading it incorrectly, just yell at me. :)


> ----- >8
> 
> Subject: [PATCH] kbuild: fix CONFIG_TRIM_UNUSED_KSYMS=y with a separate output  directory
> 
> This fixes the following:
> 
> /bin/sh: scripts/adjust_autoksyms.sh: No such file or directory
> 
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> 
> diff --git a/Makefile b/Makefile
> index e3af48068c..e9ad498238 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -934,7 +934,7 @@ quiet_cmd_link-vmlinux = LINK    $@
>  # execute if the rest of the kernel build went well.
>  vmlinux: scripts/link-vmlinux.sh $(vmlinux-deps) FORCE
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
> -	$(Q)$(CONFIG_SHELL) scripts/adjust_autoksyms.sh \
> +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
>  	  "$(MAKE) KBUILD_MODULES=1 -f $(srctree)/Makefile autoksyms_recursive"
>  endif
>  ifdef CONFIG_HEADERS_CHECK
> @@ -949,13 +949,13 @@ endif
>  	+$(call if_changed,link-vmlinux)
>  
>  autoksyms_recursive: $(vmlinux-deps)
> -	$(Q)$(CONFIG_SHELL) scripts/adjust_autoksyms.sh \
> +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
>  	  "$(MAKE) KBUILD_MODULES=1 -f $(srctree)/Makefile autoksyms_recursive"
>  PHONY += autoksyms_recursive
>  
>  # standalone target for easier testing
>  include/generated/autoksyms.h: FORCE
> -	$(Q)$(CONFIG_SHELL) scripts/adjust_autoksyms.sh true
> +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh true
>  
>  # Build samples along the rest of the kernel
>  ifdef CONFIG_SAMPLES
> --


-- 
~Randy
