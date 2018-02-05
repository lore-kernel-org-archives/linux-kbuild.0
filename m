Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35791 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752166AbeBEBZf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Feb 2018 20:25:35 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 19/20] ARC: Fix malformed ARC_EMUL_UNALIGNED default
Date: Mon,  5 Feb 2018 02:21:31 +0100
Message-Id: <20180205012146.23981-20-ulfalizer@gmail.com>
In-Reply-To: <20180205012146.23981-1-ulfalizer@gmail.com>
References: <20180205012146.23981-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, tfiga@chromium.org, paul.burton@mips.com, m.szyprowski@samsung.com, egtvedt@samfundet.no, linus.walleij@linaro.org, vgupta@synopsys.com, mgorman@techsingularity.net, hch@lst.de, mina86@mina86.com, robh@kernel.org, sboyd@codeaurora.org, paulus@ozlabs.org, will.deacon@arm.com, tony@atomide.com, npiggin@gmail.com, yamada.masahiro@socionext.com, Ulf Magnusson <ulfalizer@gmail.com>, linux-snps-arc@lists.infradead.org

'default N' should be 'default n', though they happen to have the same
effect here, due to undefined symbols (N in this case) evaluating to n
in a tristate sense.

Remove the default from ARC_EMUL_UNALIGNED instead of changing it. bool
and tristate symbols implicitly default to n.

Discovered with the
https://github.com/ulfalizer/Kconfiglib/blob/master/examples/list_undefined.py
script.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 arch/arc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index f3a80cf164cc..d76bf4a83740 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -484,7 +484,6 @@ config ARC_CURR_IN_REG
 
 config ARC_EMUL_UNALIGNED
 	bool "Emulate unaligned memory access (userspace only)"
-	default N
 	select SYSCTL_ARCH_UNALIGN_NO_WARN
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	depends on ISA_ARCOMPACT
-- 
2.14.1

