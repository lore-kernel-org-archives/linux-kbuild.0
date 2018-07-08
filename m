Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:43828 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753825AbeGHQeb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Jul 2018 12:34:31 -0400
Subject: Re: [PATCH 5/9] Kconfig: consolidate the "Kernel hacking" menu
References: <20180708152004.21679-1-hch@lst.de>
 <20180708152004.21679-6-hch@lst.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fd8c89be-1270-a54e-a69b-350105a04eca@infradead.org>
Date: Sun, 8 Jul 2018 09:34:29 -0700
MIME-Version: 1.0
In-Reply-To: <20180708152004.21679-6-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Richard Weinberger <richard@nod.at>, linux-kbuild@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org

On 07/08/2018 08:20 AM, Christoph Hellwig wrote:
> Move the source of lib/Kconfig.debug and arch/$(ARCH)/Kconfig.debug to
> the top-level Kconfig.  For two architectures that means moving their
> arch-specific symbols in that menu into a new arch Kconfig.debug file,
> and for a few more creating a dummy file so that we can include it
> unconditionally.
> 
> Also move the actual 'Kernel hacking' menu to lib/Kconfig.debug, where
> it belongs.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  Kconfig                       |  2 ++
>  arch/alpha/Kconfig            |  2 --
>  arch/alpha/Kconfig.debug      |  5 ----
>  arch/arc/Kconfig              |  1 -
>  arch/arc/Kconfig.debug        |  5 ----
>  arch/arm/Kconfig              |  2 --
>  arch/arm/Kconfig.debug        |  5 ----
>  arch/arm64/Kconfig            |  2 --
>  arch/arm64/Kconfig.debug      |  5 ----
>  arch/c6x/Kconfig              | 15 ------------
>  arch/c6x/Kconfig.debug        | 11 +++++++++
>  arch/h8300/Kconfig            |  6 -----
>  arch/h8300/Kconfig.debug      |  1 +
>  arch/hexagon/Kconfig          |  4 ----
>  arch/hexagon/Kconfig.debug    |  1 +
>  arch/ia64/Kconfig             |  2 --
>  arch/ia64/Kconfig.debug       |  5 ----
>  arch/m68k/Kconfig             |  2 --
>  arch/m68k/Kconfig.debug       |  5 ----
>  arch/microblaze/Kconfig       |  2 --
>  arch/microblaze/Kconfig.debug |  6 -----
>  arch/mips/Kconfig             |  2 --
>  arch/mips/Kconfig.debug       |  5 ----
>  arch/nds32/Kconfig            |  4 ----
>  arch/nds32/Kconfig.debug      |  1 +
>  arch/nios2/Kconfig            |  2 --
>  arch/nios2/Kconfig.debug      |  5 ----
>  arch/openrisc/Kconfig         |  6 -----
>  arch/openrisc/Kconfig.debug   |  1 +
>  arch/parisc/Kconfig           |  2 --
>  arch/parisc/Kconfig.debug     |  5 ----
>  arch/powerpc/Kconfig          |  2 --
>  arch/powerpc/Kconfig.debug    |  5 ----
>  arch/riscv/Kconfig            | 45 -----------------------------------
>  arch/riscv/Kconfig.debug      | 37 ++++++++++++++++++++++++++++
>  arch/s390/Kconfig             |  2 --
>  arch/s390/Kconfig.debug       |  5 ----
>  arch/sh/Kconfig               |  2 --
>  arch/sh/Kconfig.debug         |  5 ----
>  arch/sparc/Kconfig            |  2 --
>  arch/sparc/Kconfig.debug      |  5 ----
>  arch/um/Kconfig               |  2 --
>  arch/um/Kconfig.debug         |  5 ----
>  arch/unicore32/Kconfig        |  2 --
>  arch/unicore32/Kconfig.debug  |  5 ----
>  arch/x86/Kconfig              |  2 --
>  arch/x86/Kconfig.debug        |  5 ----
>  arch/xtensa/Kconfig           |  2 --
>  arch/xtensa/Kconfig.debug     |  5 ----
>  lib/Kconfig.debug             |  6 +++++
>  50 files changed, 60 insertions(+), 206 deletions(-)
>  create mode 100644 arch/c6x/Kconfig.debug
>  create mode 100644 arch/h8300/Kconfig.debug
>  create mode 100644 arch/hexagon/Kconfig.debug
>  create mode 100644 arch/nds32/Kconfig.debug
>  create mode 100644 arch/openrisc/Kconfig.debug
>  create mode 100644 arch/riscv/Kconfig.debug


-- 
~Randy
