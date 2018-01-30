Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35081 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752112AbeA3THm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jan 2018 14:07:42 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 07/10] MIPS: BCM63XX: kconfig: Remove empty help text
Date: Tue, 30 Jan 2018 20:05:29 +0100
Message-Id: <20180130190555.6577-8-ulfalizer@gmail.com>
In-Reply-To: <20180130190555.6577-1-ulfalizer@gmail.com>
References: <20180130190555.6577-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mcgrof@kernel.org, Ulf Magnusson <ulfalizer@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Thomas Gleixner <tglx@linutronix.de>, linux-mips@linux-mips.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

In preparation for adding a warning ("kconfig: Warn if help text is
blank"): https://lkml.org/lkml/2018/1/30/516

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 arch/mips/bcm63xx/boards/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/bcm63xx/boards/Kconfig b/arch/mips/bcm63xx/boards/Kconfig
index 6ff0a7481081..f60d96610ace 100644
--- a/arch/mips/bcm63xx/boards/Kconfig
+++ b/arch/mips/bcm63xx/boards/Kconfig
@@ -7,6 +7,5 @@ choice
 config BOARD_BCM963XX
        bool "Generic Broadcom 963xx boards"
 	select SSB
-       help
 
 endchoice
-- 
2.14.1

