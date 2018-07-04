Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:52950 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752719AbeGDT55 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jul 2018 15:57:57 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kbuild: update kbuild.txt ARCH alias list
Message-ID: <9a4b8d07-b9cc-4843-a74c-7f40ebc4c9af@infradead.org>
Date: Wed, 4 Jul 2018 12:57:54 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

From: Randy Dunlap <rdunlap@infradead.org>

In Kbuild documentation, add alias for 64-bit sh ARCH ("sh64")
to the list of ARCH aliases.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/kbuild/kbuild.txt |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20180704.orig/Documentation/kbuild/kbuild.txt
+++ linux-next-20180704/Documentation/kbuild/kbuild.txt
@@ -88,6 +88,7 @@ In most cases the name of the architectu
 directory name found in the arch/ directory.
 But some architectures such as x86 and sparc have aliases.
 x86: i386 for 32 bit, x86_64 for 64 bit
+sh: sh for 32 bit, sh64 for 64 bit
 sparc: sparc for 32 bit, sparc64 for 64 bit
 
 CROSS_COMPILE


