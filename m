Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:52138 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932121AbeGHPUK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Jul 2018 11:20:10 -0400
From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 7/9] arch/Kconfig: use a menu to reduce clutter
Date: Sun,  8 Jul 2018 08:20:02 -0700
Message-Id: <20180708152004.21679-8-hch@lst.de>
In-Reply-To: <20180708152004.21679-1-hch@lst.de>
References: <20180708152004.21679-1-hch@lst.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, linux-kbuild@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Put everything in arch/Kconfig into a General options menu
so that they don't clutter up the main/major/primary list of
menu options.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index cddd0faae4cb..6cf1b17a8df2 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -9,6 +9,8 @@
 #
 source "arch/$(SRCARCH)/Kconfig"
 
+menu "General architecture-dependent options"
+
 config CRASH_CORE
 	bool
 
@@ -981,3 +983,5 @@ config REFCOUNT_FULL
 	  security flaw exploits.
 
 source "kernel/gcov/Kconfig"
+
+endmenu
-- 
2.18.0

