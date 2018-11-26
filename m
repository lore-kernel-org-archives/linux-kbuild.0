Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:48914 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbeKZTKD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Nov 2018 14:10:03 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pcmcia: remove per-arch PCMCIA config entry
Date: Mon, 26 Nov 2018 17:15:41 +0900
Message-Id: <1543220141-13744-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-s390@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Jeff Dike <jdike@addtoit.com>

Now that all architectures include drivers/pcmcia/Kconfig where
the PCMCIA config is defined, the PCMCIA config entries in per-arch
Kconfig files are redundant.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I will queue this up to my kbuild tree
along with Christoph's clean-up patch set.


 arch/s390/Kconfig | 3 ---
 arch/um/Kconfig   | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 5173366..b212c59 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -837,9 +837,6 @@ source "kernel/power/Kconfig"
 
 endmenu
 
-config PCMCIA
-	def_bool n
-
 config CCW
 	def_bool y
 
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index 6b99389..a7d09a7 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -34,9 +34,6 @@ config SBUS
 config PCI
 	bool
 
-config PCMCIA
-	bool
-
 config TRACE_IRQFLAGS_SUPPORT
 	bool
 	default y
-- 
2.7.4
