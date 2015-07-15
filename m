Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:54244 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583AbbGOIlq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Jul 2015 04:41:46 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NRI00C4XTHJIFA0@mailout4.w1.samsung.com> for
 linux-kbuild@vger.kernel.org; Wed, 15 Jul 2015 09:41:43 +0100 (BST)
From: Pavel Fedin <p.fedin@samsung.com>
Subject: [RESEND-3 PATCH trivial] Avoid conflict with host definitions when
 cross-compiling
Date: Wed, 15 Jul 2015 11:41:42 +0300
Message-id: <00e101d0beda$13637ee0$3a2a7ca0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ru
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: 'Jiri Kosina' <jkosina@suse.cz>, trivial@kernel.org

 Certain platforms (e. g. BSD-based ones) define some ELF constants according to host.
This patch fixes problems with cross-building Linux kernel on these platforms (e. g. building ARM
32-bit version on x86-64 host).

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
---
If you are not fond of mentioning Cygwin in the comment, feel free to change it to "BSD-based" or
whatever else you feel appropriate
---
 scripts/mod/modpost.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 168b43d..9f51365 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -11,6 +11,12 @@
 
 #include "elfconfig.h"
 
+/* Cygwin's elf.h defines these according to host's word size */
+#undef ELF_ST_BIND
+#undef ELF_ST_TYPE
+#undef ELF_R_SYM
+#undef ELF_R_TYPE
+
 #if KERNEL_ELFCLASS == ELFCLASS32
 
 #define Elf_Ehdr    Elf32_Ehdr
-- 
1.9.5.msysgit.0


--
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/

--
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/

