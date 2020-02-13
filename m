Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:53598 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729358AbgBMElA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 23:41:00 -0500
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kbuild: add comment for V=2 mode
Message-ID: <a06194f0-3713-cc04-1673-c05b35c03242@infradead.org>
Date: Wed, 12 Feb 2020 20:40:57 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

From: Randy Dunlap <rdunlap@infradead.org>

Complete the comments for valid values of KBUILD_VERBOSE,
specifically for KBUILD_VERBOSE=2.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Makefile |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20200206.orig/Makefile
+++ linux-next-20200206/Makefile
@@ -68,6 +68,7 @@ unexport GREP_OPTIONS
 #
 # If KBUILD_VERBOSE equals 0 then the above command will be hidden.
 # If KBUILD_VERBOSE equals 1 then the above command is displayed.
+# If KBUILD_VERBOSE equals 2 then give the reason why each target is rebuilt.
 #
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
