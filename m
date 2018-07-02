Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:58334 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752069AbeGBU2d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Jul 2018 16:28:33 -0400
Subject: Re: [PATCH 2/5] Kconfig: consolidate the "Kernel hacking menu"
References: <20180702144711.22111-1-hch@lst.de>
 <20180702144711.22111-3-hch@lst.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5b408924-f7d6-24f6-b214-0778550e22d9@infradead.org>
Date: Mon, 2 Jul 2018 13:28:32 -0700
MIME-Version: 1.0
In-Reply-To: <20180702144711.22111-3-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/02/18 07:47, Christoph Hellwig wrote:
> diff --git a/Kconfig b/Kconfig
> index 5499b1273ba5..5f580c81d85d 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -32,3 +32,5 @@ source "security/Kconfig"
>  source "crypto/Kconfig"
>  
>  source "lib/Kconfig"
> +
> +source "lib/Kconfig.debug"

Ack having Kernel hacking menu at the end.
I've been wanting to do that as well.

thanks,

-- 
~Randy
