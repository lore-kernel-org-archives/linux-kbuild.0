Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:32920 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbfHJHwa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 03:52:30 -0400
Date: Sat, 10 Aug 2019 09:52:26 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: can we use mandatory-y for non-uapi headers?
Message-ID: <20190810075226.GA24085@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Masahiro,

what is the reason that the documentation says mandatory-y should only
be used for uapi headers?  If would also be very useful for normal
asm-generic headers where most people use the generic version and we
only have a few overrides.  Two headers that immediately come to mind
are dma-mapping.h, or msi.h.
