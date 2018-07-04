Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:53146 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752794AbeGDT7S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jul 2018 15:59:18 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kbuild: delete INSTALL_FW_PATH from kbuild documentation
Message-ID: <6477e1be-6686-582b-35b5-72e9f677619f@infradead.org>
Date: Wed, 4 Jul 2018 12:59:16 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <rdunlap@infradead.org>

Removed Kbuild documentation for INSTALL_FW_PATH.

The kbuild symbol INSTALL_FW_PATH was removed from Kbuild tools in
September 2014 (for 4.14) but the symbol was not deleted from
the kbuild documentation, so do that now.

Fixes: 5620a0d1aac ("firmware: delete in-kernel firmware")

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: stable@vger.kernel.org # 4.14 and later
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/kbuild/kbuild.txt |    9 ---------
 1 file changed, 9 deletions(-)

--- linux-next-20180704.orig/Documentation/kbuild/kbuild.txt
+++ linux-next-20180704/Documentation/kbuild/kbuild.txt
@@ -149,15 +149,6 @@ stripped after they are installed.  If I
 the default option --strip-debug will be used.  Otherwise,
 INSTALL_MOD_STRIP value will be used as the options to the strip command.
 
-INSTALL_FW_PATH
---------------------------------------------------
-INSTALL_FW_PATH specifies where to install the firmware blobs.
-The default value is:
-
-    $(INSTALL_MOD_PATH)/lib/firmware
-
-The value can be overridden in which case the default value is ignored.
-
 INSTALL_HDR_PATH
 --------------------------------------------------
 INSTALL_HDR_PATH specifies where to install user space headers when


