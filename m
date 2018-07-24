Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:41742 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388386AbeGXTEf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jul 2018 15:04:35 -0400
From: Christoph Hellwig <hch@lst.de>
Subject: include architecture Kconfig files from top-level Kconfig v3
Date: Tue, 24 Jul 2018 19:56:36 +0200
Message-Id: <20180724175646.3621-1-hch@lst.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, Ley Foon Tan <lftan@altera.com>, Michal Simek <monstr@monstr.eu>, linux-kbuild@vger.kernel.org, linux-um@lists.infradead.org, linux-arch@lists.infradead.org, linux-kernel@vger.kernel.org

Hi Masahiro,

what do you think about the series below, which moves the includes
of all the architecture independ Kconfig files to the top-level
Kconfig instead of duplicating the includes in all architectures?

Note that this only handles the low-hanging fruite, there are a lot
of other bits that should probably be cleaned up to be common,
but those will be not entirely trivial.

Changes since v2:
 - fix the missing sh conversion
 - handle the lack of CONFIG_SWAP support in microblaze and nios2 properly

Changes since v1:
 - add back a remove source statement from arch/arm/Kconfig
 - various fixes from Randy
 - various UML patches to be able to use the common Kconfig
