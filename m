Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e06smtp13.uk.ibm.com ([195.75.94.109]:42669 "EHLO
	e06smtp13.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751471AbcBOOXZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Feb 2016 09:23:25 -0500
Received: from localhost
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <oberpar@linux.vnet.ibm.com>;
	Mon, 15 Feb 2016 14:23:24 -0000
Subject: Re: [PATCH 3/5] gcov: disable for COMPILE_TEST
References: <1455293187-179811-1-git-send-email-arnd@arndb.de>
 <1455293187-179811-4-git-send-email-arnd@arndb.de>
From: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
Message-ID: <56C1DF57.50601@linux.vnet.ibm.com>
Date: Mon, 15 Feb 2016 15:23:19 +0100
MIME-Version: 1.0
In-Reply-To: <1455293187-179811-4-git-send-email-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 12.02.2016 17:06, Arnd Bergmann wrote:
> Enabling gcov is counterproductive to compile testing: it significantly
> increases the kernel image size, compile time, and it produces lots
> of false positive "may be used uninitialized" warnings as the result
> of missed optimizations.
> 
> This is in line with how UBSAN_SANITIZE_ALL and PROFILE_ALL_BRANCHES
> work, both of which have similar problems.
> 
> With an ARM allmodconfig kernel, I see the build time drop from
> 283 minutes CPU time to 225 minutes, and the vmlinux size drops
> from 43MB to 26MB.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Agreed that COMPILE_TEST + GCOV_PROFILE_ALL is a very exotic combination
with little added use.

Acked-by: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>

> ---
>  kernel/gcov/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
> index c92e44855ddd..1276aabaab55 100644
> --- a/kernel/gcov/Kconfig
> +++ b/kernel/gcov/Kconfig
> @@ -37,6 +37,7 @@ config ARCH_HAS_GCOV_PROFILE_ALL
> 
>  config GCOV_PROFILE_ALL
>  	bool "Profile entire Kernel"
> +	depends on !COMPILE_TEST
>  	depends on GCOV_KERNEL
>  	depends on ARCH_HAS_GCOV_PROFILE_ALL
>  	default n
> 


-- 
Peter Oberparleiter
Linux on z Systems Development - IBM Germany

