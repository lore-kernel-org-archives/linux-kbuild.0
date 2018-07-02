Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:43470 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752437AbeGBU6g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Jul 2018 16:58:36 -0400
Subject: Re: [PATCH 5/5] kconfig: move the "Executable file formats" menu to
 fs/Kconfig.binfmt
References: <20180702144711.22111-1-hch@lst.de>
 <20180702144711.22111-6-hch@lst.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fe9bf260-82f6-214f-08f9-a896e68af214@infradead.org>
Date: Mon, 2 Jul 2018 13:58:35 -0700
MIME-Version: 1.0
In-Reply-To: <20180702144711.22111-6-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/02/18 07:47, Christoph Hellwig wrote:
> No need to have this in the top-level Kconfig.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  Kconfig           | 2 --
>  fs/Kconfig.binfmt | 5 +++++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Kconfig b/Kconfig
> index 5f580c81d85d..f9969589a6b4 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -15,9 +15,7 @@ source "init/Kconfig"
>  
>  source "kernel/Kconfig.freezer"
>  
> -menu "Executable file formats"
>  source "fs/Kconfig.binfmt"
> -endmenu
>  
>  source "mm/Kconfig"
>  
> diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
> index 56df483de619..b795f8da81f3 100644
> --- a/fs/Kconfig.binfmt
> +++ b/fs/Kconfig.binfmt
> @@ -1,3 +1,6 @@
> +
> +menu "Executable file formats"
> +
>  config BINFMT_ELF
>  	bool "Kernel support for ELF binaries"
>  	depends on MMU
> @@ -187,3 +190,5 @@ config COREDUMP
>  	  This option enables support for performing core dumps. You almost
>  	  certainly want to say Y here. Not necessary on systems that never
>  	  need debugging or only ever run flawless code.
> +
> +endmenu
> 


-- 
~Randy
