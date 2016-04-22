Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:41844 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751975AbcDVWzU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Apr 2016 18:55:20 -0400
Subject: Re: linux-next: Tree for Apr 22 (adjust_autoksyms.sh)
References: <20160422153503.24aa389e@canb.auug.org.au>
 <571A56C4.7030907@infradead.org>
 <alpine.LFD.2.20.1604221345340.27452@knanqh.ubzr>
 <571A6BCE.9040904@infradead.org>
 <alpine.LFD.2.20.1604221423300.27452@knanqh.ubzr>
 <alpine.LFD.2.20.1604221542270.27452@knanqh.ubzr>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <571AABCF.4050609@infradead.org>
Date: Fri, 22 Apr 2016 15:55:11 -0700
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1604221542270.27452@knanqh.ubzr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On 04/22/16 12:44, Nicolas Pitre wrote:
> On Fri, 22 Apr 2016, Nicolas Pitre wrote:
> 
>> On Fri, 22 Apr 2016, Randy Dunlap wrote:
>>
>>> Yes, this patch helps, but I think there is still a problem.
>>> I think that trim needs to be done after CONFIG_BUILD_DOCSRC and possibly
>>> after CONFIG_SAMPLES are built.
>>
>> The later is already taken care of with commit dd92478a15.
>>
>>> At least CONFIG_BUILD_DOCSRC seems to
>>> cause this error:
>>>
>>> Setup is 16508 bytes (padded to 16896 bytes).
>>> System is 6125 kB
>>> CRC 8aa70f94
>>> Kernel: arch/x86/boot/bzImage is ready  (#9)
>>> ERROR: "cn_del_callback" [Documentation/connector/cn_test.ko] undefined!
>>> ERROR: "cn_add_callback" [Documentation/connector/cn_test.ko] undefined!
>>> ERROR: "cn_netlink_send" [Documentation/connector/cn_test.ko] undefined!
>>> ../scripts/Makefile.modpost:91: recipe for target '__modpost' failed
>>> make[2]: *** [__modpost] Error 1
>>
>> This one is indeed a problem.
> 
> Please try the following:

Yes, this works.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>


> ----- >8
> Subject: [PATCH] kbuild: better abstract vmlinux sequential prerequisites
> 
> When CONFIG_TRIM_UNUSED_KSYMS=y and CONFIG_BUILD_DOCSRC=y it is possible
> to get the following error:
> 
> ERROR: "cn_del_callback" [Documentation/connector/cn_test.ko] undefined!
> ERROR: "cn_add_callback" [Documentation/connector/cn_test.ko] undefined!
> ERROR: "cn_netlink_send" [Documentation/connector/cn_test.ko] undefined!
> ../scripts/Makefile.modpost:91: recipe for target '__modpost' failed
> 
> It is not sufficient to do "vmlinux-dirs += Documentation" as this also
> depends on the headers_check target, and all of this needs to be done
> before adjust_autoksyms.sh is executed.
> 
> Let's sort this out by gathering those sequential prerequisites in a make
> target of their own, separate from the vmlinux target. And by doing so,
> the special autoksyms_recursive target is no longer needed.
> 
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> 
> diff --git a/Makefile b/Makefile
> index e9ad498238..3f1eb6a1bf 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -926,17 +926,11 @@ export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) arch Doc
>  
>  vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_INIT) $(KBUILD_VMLINUX_MAIN)
>  
> -# Final link of vmlinux
> -      cmd_link-vmlinux = $(CONFIG_SHELL) $< $(LD) $(LDFLAGS) $(LDFLAGS_vmlinux)
> -quiet_cmd_link-vmlinux = LINK    $@
> -
> -# Include targets which we want to
> -# execute if the rest of the kernel build went well.
> -vmlinux: scripts/link-vmlinux.sh $(vmlinux-deps) FORCE
> -ifdef CONFIG_TRIM_UNUSED_KSYMS
> -	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
> -	  "$(MAKE) KBUILD_MODULES=1 -f $(srctree)/Makefile autoksyms_recursive"
> -endif
> +# Include targets which we want to execute sequentially if the rest of the
> +# kernel build went well. If CONFIG_TRIM_UNUSED_KSYMS is set, this might be
> +# evaluated more than once.
> +PHONY += vmlinux_prereq
> +vmlinux_prereq: $(vmlinux-deps) FORCE
>  ifdef CONFIG_HEADERS_CHECK
>  	$(Q)$(MAKE) -f $(srctree)/Makefile headers_check
>  endif
> @@ -946,17 +940,22 @@ endif
>  ifdef CONFIG_GDB_SCRIPTS
>  	$(Q)ln -fsn `cd $(srctree) && /bin/pwd`/scripts/gdb/vmlinux-gdb.py
>  endif
> -	+$(call if_changed,link-vmlinux)
> -
> -autoksyms_recursive: $(vmlinux-deps)
> +ifdef CONFIG_TRIM_UNUSED_KSYMS
>  	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
> -	  "$(MAKE) KBUILD_MODULES=1 -f $(srctree)/Makefile autoksyms_recursive"
> -PHONY += autoksyms_recursive
> +	  "$(MAKE) KBUILD_MODULES=1 -f $(srctree)/Makefile vmlinux_prereq"
> +endif
>  
>  # standalone target for easier testing
>  include/generated/autoksyms.h: FORCE
>  	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh true
>  
> +# Final link of vmlinux
> +      cmd_link-vmlinux = $(CONFIG_SHELL) $< $(LD) $(LDFLAGS) $(LDFLAGS_vmlinux)
> +quiet_cmd_link-vmlinux = LINK    $@
> +
> +vmlinux: scripts/link-vmlinux.sh vmlinux_prereq FORCE
> +	+$(call if_changed,link-vmlinux)
> +
>  # Build samples along the rest of the kernel
>  ifdef CONFIG_SAMPLES
>  vmlinux-dirs += samples
> --


-- 
~Randy
