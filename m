Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:44450 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752556AbeBEBYh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Feb 2018 20:24:37 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 10/20] lib/Kconfig: Remove leftover select of GENERIC_IO
Date: Mon,  5 Feb 2018 02:21:22 +0100
Message-Id: <20180205012146.23981-11-ulfalizer@gmail.com>
In-Reply-To: <20180205012146.23981-1-ulfalizer@gmail.com>
References: <20180205012146.23981-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, tfiga@chromium.org, paul.burton@mips.com, m.szyprowski@samsung.com, egtvedt@samfundet.no, linus.walleij@linaro.org, vgupta@synopsys.com, mgorman@techsingularity.net, hch@lst.de, mina86@mina86.com, robh@kernel.org, sboyd@codeaurora.org, paulus@ozlabs.org, will.deacon@arm.com, tony@atomide.com, npiggin@gmail.com, yamada.masahiro@socionext.com, Ulf Magnusson <ulfalizer@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Nick Terrell <terrelln@fb.com>, Dan Williams <dan.j.williams@intel.com>, "David S. Miller" <davem@davemloft.net>, Matthew Wilcox <mawilcox@microsoft.com>, Palmer Dabbelt <palmer@dabbelt.com>, Dave Airlie <airlied@redhat.com>, Jeremy Kerr <jk@ozlabs.org>, Bart Van Assche <bart.vanassche@wdc.com>, Robin Murphy <robin.murphy@arm.com>

GENERIC_IO was removed by commit 9de8da47742b ("kconfig: kill off
GENERIC_IO option"), but HAS_IOMEM still selects it.

Remove the select of GENERIC_IO from HAS_IOMEM.

Discovered with the
https://github.com/ulfalizer/Kconfiglib/blob/master/examples/list_undefined.py
script.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 lib/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/Kconfig b/lib/Kconfig
index e96089499371..8ce8bcad6eff 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -396,7 +396,6 @@ config ASSOCIATIVE_ARRAY
 config HAS_IOMEM
 	bool
 	depends on !NO_IOMEM
-	select GENERIC_IO
 	default y
 
 config HAS_IOPORT_MAP
-- 
2.14.1

