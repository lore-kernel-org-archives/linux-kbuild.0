Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:43416 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753209AbeGBU5r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Jul 2018 16:57:47 -0400
Subject: Re: [PATCH 4/5] kconfig: add a Memory Management options" menu
References: <20180702144711.22111-1-hch@lst.de>
 <20180702144711.22111-5-hch@lst.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a9b9964f-c4c0-5b82-269b-32aada44cf0d@infradead.org>
Date: Mon, 2 Jul 2018 13:57:46 -0700
MIME-Version: 1.0
In-Reply-To: <20180702144711.22111-5-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/02/18 07:47, Christoph Hellwig wrote:
> This moves all the options under a proper menu.
> 
> Based on a patch from Randy Dunlap.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  mm/Kconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index ce95491abd6a..9ae1b6a8e30f 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1,3 +1,6 @@
> +
> +menu "Memory Management options"
> +
>  config SELECT_MEMORY_MODEL
>  	def_bool y
>  	depends on ARCH_SELECT_MEMORY_MODEL
> @@ -762,3 +765,5 @@ config GUP_BENCHMARK
>  
>  config ARCH_HAS_PTE_SPECIAL
>  	bool
> +
> +endmenu
> 


-- 
~Randy
