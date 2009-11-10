Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:35257 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754373AbZKJXsA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Nov 2009 18:48:00 -0500
Message-ID: <4AF9FB6C.70003@oracle.com>
Date: Tue, 10 Nov 2009 15:46:52 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
Subject: [PATCH] x86 VSDO: fix Kconfig help
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, x86@kernel.org
Cc: linux-kbuild@vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

COMPAT_VDSO has 2 help text blocks, but kconfig only uses the
last one found, so merge the 2 blocks.

It would be real nice if kconfig would warn about this.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 arch/x86/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- lnx-2632-rc6.orig/arch/x86/Kconfig
+++ lnx-2632-rc6/arch/x86/Kconfig
@@ -1601,12 +1601,12 @@ config COMPAT_VDSO
 	prompt "Compat VDSO support"
 	depends on X86_32 || IA32_EMULATION
 	---help---
-	  Map the 32-bit VDSO to the predictable old-style address too.
-	---help---
 	  Say N here if you are running a sufficiently recent glibc
 	  version (2.3.3 or later), to remove the high-mapped
 	  VDSO mapping and to exclusively use the randomized VDSO.
 
+	  Map the 32-bit VDSO to the predictable old-style address too.
+
 	  If unsure, say Y.
 
 config CMDLINE_BOOL
