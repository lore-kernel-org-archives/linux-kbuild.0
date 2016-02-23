Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:39116 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751119AbcBWOeN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Feb 2016 09:34:13 -0500
Subject: Re: [PATCH v4 2/2] Makefile: add kselftest-merge
References: <1452238054-15482-1-git-send-email-bamvor.zhangjian@linaro.org>
 <1452238054-15482-3-git-send-email-bamvor.zhangjian@linaro.org>
From: Shuah Khan <shuahkh@osg.samsung.com>
Message-ID: <56CC6DDD.9080803@osg.samsung.com>
Date: Tue, 23 Feb 2016 07:34:05 -0700
MIME-Version: 1.0
In-Reply-To: <1452238054-15482-3-git-send-email-bamvor.zhangjian@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, mmarek@suse.com, Shuah Khan <shuahkh@osg.samsung.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr, khilman@linaro.org, tyler.baker@linaro.org, broonie@kernel.org, mpe@ellerman.id.au, dvhart@infradead.org

On 01/08/2016 12:27 AM, Bamvor Jian Zhang wrote:
> Add kselftest-merge to enable the dependencies of kernel config
> for all the kselftest testcases. User should call it after create
> the kernel configuration(.config), eg:
> 
> $ make kselftest-merge
> 
> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Could you please ACK this patch if you are okay
with the changes? I will take this through ksleftest
tree.

thanks,
-- Shuah

> ---
>  Makefile | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index cd40956..bfb9faa 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1104,6 +1104,14 @@ kselftest:
>  kselftest-clean:
>  	$(Q)$(MAKE) -C tools/testing/selftests clean
>  
> +PHONY += kselftest-merge
> +kselftest-merge:
> +	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
> +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
> +		-m $(objtree)/.config \
> +		$(srctree)/tools/testing/selftests/*/config
> +	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
> +
>  # ---------------------------------------------------------------------------
>  # Modules
>  
> @@ -1312,6 +1320,8 @@ help:
>  	@echo  '                    Build, install, and boot kernel before'
>  	@echo  '                    running kselftest on it'
>  	@echo  '  kselftest-clean - Remove all generated kselftest files'
> +	@echo  '  kselftest-merge - Merge all the config dependencies of kselftest to existed'
> +	@echo  '                    .config.'
>  	@echo  ''
>  	@echo  'Kernel packaging:'
>  	@$(MAKE) $(build)=$(package-dir) help
> 


-- 
Shuah Khan
Sr. Linux Kernel Developer
Open Source Innovation Group
Samsung Research America (Silicon Valley)
shuahkh@osg.samsung.com | (970) 217-8978
