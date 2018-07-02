Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:50392 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752049AbeGBOrO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Jul 2018 10:47:14 -0400
From: Christoph Hellwig <hch@lst.de>
Subject: include architecture Kconfig files from top-level Kconfig
Date: Mon,  2 Jul 2018 08:47:06 -0600
Message-Id: <20180702144711.22111-1-hch@lst.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Masahiro,

what do you think about the series below, which moves the includes
of all the architecture independ Kconfig files to the top-level
Kconfig instead of duplicating the includes in all architectures?

Note that this only handles the low-hanging fruite, there are a lot
of other bits that should probably be cleaned up to be common,
but those will be not entirely trivial.
