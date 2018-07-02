Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:52560 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752715AbeGBVRe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Jul 2018 17:17:34 -0400
Subject: [PATCH] arch/Kconfig: use a menu to reduce clutter
References: <20180702144711.22111-1-hch@lst.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6ba546f8-42bd-4400-131f-bb389812cb56@infradead.org>
Date: Mon, 2 Jul 2018 14:17:33 -0700
MIME-Version: 1.0
In-Reply-To: <20180702144711.22111-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Put everything in arch/Kconfig into a General options menu
so that they don't clutter up the main/major/primary list of
menu options.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 arch/Kconfig |    4 ++++
 1 file changed, 4 insertions(+)

--- linux-next-20180702.orig/arch/Kconfig
+++ linux-next-20180702/arch/Kconfig
@@ -3,6 +3,8 @@
 # General architecture dependent options
 #
 
+menu "General architecture-dependent options"
+
 config CRASH_CORE
 	bool
 
@@ -1028,3 +1030,5 @@ config REFCOUNT_FULL
 	  security flaw exploits.
 
 source "kernel/gcov/Kconfig"
+
+endmenu

