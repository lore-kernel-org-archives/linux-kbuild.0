Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:36749 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752366AbeBEBXn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Feb 2018 20:23:43 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 04/20] misc: atmel: Remove CPU_AT32AP700X (AVR32) reference
Date: Mon,  5 Feb 2018 02:21:16 +0100
Message-Id: <20180205012146.23981-5-ulfalizer@gmail.com>
In-Reply-To: <20180205012146.23981-1-ulfalizer@gmail.com>
References: <20180205012146.23981-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, tfiga@chromium.org, paul.burton@mips.com, m.szyprowski@samsung.com, egtvedt@samfundet.no, linus.walleij@linaro.org, vgupta@synopsys.com, mgorman@techsingularity.net, hch@lst.de, mina86@mina86.com, robh@kernel.org, sboyd@codeaurora.org, paulus@ozlabs.org, will.deacon@arm.com, tony@atomide.com, npiggin@gmail.com, yamada.masahiro@socionext.com, Ulf Magnusson <ulfalizer@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

The CPU_AT32AP700X symbol symbol went away when when AVR32 was removed
in commit 26202873bb51 ("avr32: remove support for AVR32 architecture")

Remove the prompt from ATMEL_TCB_CLKSRC_BLOCK. The prompt condition
could never be satisfied now.

Discovered with the
https://github.com/ulfalizer/Kconfiglib/blob/master/examples/list_undefined.py
script.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 drivers/misc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 03605f8fc0dc..5d713008749b 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -75,7 +75,6 @@ config ATMEL_TCB_CLKSRC
 config ATMEL_TCB_CLKSRC_BLOCK
 	int
 	depends on ATMEL_TCB_CLKSRC
-	prompt "TC Block" if CPU_AT32AP700X
 	default 0
 	range 0 1
 	help
-- 
2.14.1

