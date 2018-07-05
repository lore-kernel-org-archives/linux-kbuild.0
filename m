Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:33600 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753492AbeGETMG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 15:12:06 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kbuild: update ARCH alias info for sparc
Message-ID: <03cfef31-5308-7b17-9e0d-3a0dc680e750@infradead.org>
Date: Thu, 5 Jul 2018 12:12:03 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

The supported alias for building sparc 32-bit is "sparc32",
not "sparc", so update the alias documentation for that.
Just using "sparc" produces a 64-bit config file.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
This patch follows my previous patch that adds the sh: line.

 Documentation/kbuild/kbuild.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx-418-rc3.orig/Documentation/kbuild/kbuild.txt
+++ lnx-418-rc3/Documentation/kbuild/kbuild.txt
@@ -94,7 +94,7 @@ directory name found in the arch/ direct
 But some architectures such as x86 and sparc have aliases.
 x86: i386 for 32 bit, x86_64 for 64 bit
 sh: sh for 32 bit, sh64 for 64 bit
-sparc: sparc for 32 bit, sparc64 for 64 bit
+sparc: sparc32 for 32 bit, sparc64 for 64 bit
 
 CROSS_COMPILE
 --------------------------------------------------


