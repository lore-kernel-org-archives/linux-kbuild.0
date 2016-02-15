Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e06smtp15.uk.ibm.com ([195.75.94.111]:47448 "EHLO
	e06smtp15.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753330AbcBOOf0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Feb 2016 09:35:26 -0500
Received: from localhost
	by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <oberpar@linux.vnet.ibm.com>;
	Mon, 15 Feb 2016 14:35:24 -0000
Subject: Re: [PATCH 5/5] gcov: disable -Wmaybe-uninitialized warning
References: <1455293187-179811-1-git-send-email-arnd@arndb.de>
 <1455293187-179811-6-git-send-email-arnd@arndb.de>
From: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
Message-ID: <56C1E229.4050308@linux.vnet.ibm.com>
Date: Mon, 15 Feb 2016 15:35:21 +0100
MIME-Version: 1.0
In-Reply-To: <1455293187-179811-6-git-send-email-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 12.02.2016 17:06, Arnd Bergmann wrote:
> When gcov profiling is enabled, we see a lot of spurious warnings about
> possibly uninitialized variables being used:
> 
> arch/arm/mm/dma-mapping.c: In function 'arm_coherent_iommu_map_page':
> arch/arm/mm/dma-mapping.c:1085:16: warning: 'start' may be used uninitialized in this function [-Wmaybe-uninitialized]
> drivers/clk/st/clk-flexgen.c: In function 'st_of_flexgen_setup':
> drivers/clk/st/clk-flexgen.c:323:9: warning: 'num_parents' may be used uninitialized in this function [-Wmaybe-uninitialized]
> kernel/cgroup.c: In function 'cgroup_mount':
> kernel/cgroup.c:2119:11: warning: 'root' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 
> All of these are false positives, so it seems better to just disable
> the warnings whenever GCOV is enabled. Most users don't enable GCOV,
> and based on a prior patch, it is now also disabled for 'allmodconfig'
> builds, so there should be no downsides of doing this.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Sounds sane.

Acked-by: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 6bb89728a9d1..7b6900931a47 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -364,7 +364,7 @@ AFLAGS_MODULE   =
>  LDFLAGS_MODULE  =
>  CFLAGS_KERNEL	=
>  AFLAGS_KERNEL	=
> -CFLAGS_GCOV	= -fprofile-arcs -ftest-coverage -fno-tree-loop-im
> +CFLAGS_GCOV	= -fprofile-arcs -ftest-coverage -fno-tree-loop-im -Wno-maybe-uninitialized
>  CFLAGS_KCOV	= -fsanitize-coverage=trace-pc
> 
> 


-- 
Peter Oberparleiter
Linux on z Systems Development - IBM Germany

