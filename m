Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:50307 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbeKZTMh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Nov 2018 14:12:37 -0500
Date: Mon, 26 Nov 2018 09:19:15 +0100
From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] pcmcia: remove per-arch PCMCIA config entry
Message-ID: <20181126081915.GA1135@lst.de>
References: <1543220141-13744-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543220141-13744-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Jeff Dike <jdike@addtoit.com>

On Mon, Nov 26, 2018 at 05:15:41PM +0900, Masahiro Yamada wrote:
> Now that all architectures include drivers/pcmcia/Kconfig where
> the PCMCIA config is defined, the PCMCIA config entries in per-arch
> Kconfig files are redundant.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> I will queue this up to my kbuild tree
> along with Christoph's clean-up patch set.

Thanks a lot, not sure how I missed those.

Reviewed-by: Christoph Hellwig <hch@lst.de>
