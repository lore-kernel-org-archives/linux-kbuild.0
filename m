Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:50406 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752049AbeGBOrR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Jul 2018 10:47:17 -0400
From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 4/5] kconfig: add a Memory Management options" menu
Date: Mon,  2 Jul 2018 08:47:10 -0600
Message-Id: <20180702144711.22111-5-hch@lst.de>
In-Reply-To: <20180702144711.22111-1-hch@lst.de>
References: <20180702144711.22111-1-hch@lst.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This moves all the options under a proper menu.

Based on a patch from Randy Dunlap.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index ce95491abd6a..9ae1b6a8e30f 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1,3 +1,6 @@
+
+menu "Memory Management options"
+
 config SELECT_MEMORY_MODEL
 	def_bool y
 	depends on ARCH_SELECT_MEMORY_MODEL
@@ -762,3 +765,5 @@ config GUP_BENCHMARK
 
 config ARCH_HAS_PTE_SPECIAL
 	bool
+
+endmenu
-- 
2.18.0

