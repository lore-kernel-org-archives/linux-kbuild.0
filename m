Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:16471 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753903AbbHNKwV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Aug 2015 06:52:21 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NT200275JJ64S80@mailout2.w1.samsung.com> for
 linux-kbuild@vger.kernel.org; Fri, 14 Aug 2015 11:52:18 +0100 (BST)
From: Pavel Fedin <p.fedin@samsung.com>
Subject: [PATCH TRIVIAL v2] Avoid conflict with host definitions when
 cross-compiling
Date: Fri, 14 Aug 2015 13:52:13 +0300
Message-id: <1439549533-8716-1-git-send-email-p.fedin@samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: trivial@kernel.org, mmarek@suse.com

Certain platforms (e. g. BSD-based ones) define some ELF constants
according to host. This patch fixes problems with cross-building
Linux kernel on these platforms (e. g. building ARM 32-bit version
on x86-64 host).

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
---
v1 => v2
- Replaced "Cygwin" with "BSD-alike OS-es"
---
 scripts/mod/modpost.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 168b43d..6a5e151 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -11,6 +11,12 @@
 
 #include "elfconfig.h"
 
+/* On BSD-alike OSes elf.h defines these according to host's word size */
+#undef ELF_ST_BIND
+#undef ELF_ST_TYPE
+#undef ELF_R_SYM
+#undef ELF_R_TYPE
+
 #if KERNEL_ELFCLASS == ELFCLASS32
 
 #define Elf_Ehdr    Elf32_Ehdr
-- 
2.4.4

