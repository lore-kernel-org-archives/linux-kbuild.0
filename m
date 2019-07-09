Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:56538 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfGIOyI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 10:54:08 -0400
Subject: Re: [PATCH 1/4] Makefile: rules for printing kernel architecture and
 localversion
References: <1562664759-16009-1-git-send-email-info@metux.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3d4da301-618e-e348-2a6a-144b802d240f@infradead.org>
Date: Tue, 9 Jul 2019 07:54:06 -0700
MIME-Version: 1.0
In-Reply-To: <1562664759-16009-1-git-send-email-info@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, apw@canonical.com, joe@perches.com, linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com

On 7/9/19 2:32 AM, Enrico Weigelt, metux IT consult wrote:
> trivial rule to print out the kernel arch and localversion, so
> external tools, like distro packagers, can easily get it.
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Hi,
If accepted, these targets should be added to the top level Makefile's
"make help" output also.

Thanks.

> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 3e4868a..5afc3de 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1706,6 +1706,12 @@ kernelrelease:
>  kernelversion:
>  	@echo $(KERNELVERSION)
>  
> +kernellocalversion:
> +	@$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree) | sed -e 's~^\-~~'
> +
> +kernelarch:
> +	@echo $(ARCH)
> +
>  image_name:
>  	@echo $(KBUILD_IMAGE)
>  
> 


-- 
~Randy
