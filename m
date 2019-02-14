Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:51900 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732912AbfBNRFL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Feb 2019 12:05:11 -0500
Date: Thu, 14 Feb 2019 18:05:10 +0100
From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/11] powerpc: remove dead ifdefs in <asm/checksum.h>
Message-ID: <20190214170510.GC32441@lst.de>
References: <20190213174005.28785-1-hch@lst.de> <20190213174005.28785-2-hch@lst.de> <e7a2efe3-f56c-7dfd-6613-dc9229556673@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7a2efe3-f56c-7dfd-6613-dc9229556673@c-s.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-xtensa@linux-xtensa.org, linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org

On Thu, Feb 14, 2019 at 09:26:19AM +0100, Christophe Leroy wrote:
> Could you also remove the 'config GENERIC_CSUM' item in 
> arch/powerpc/Kconfig ?

All the separate declarations go away later in this series.
