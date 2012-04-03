Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:65015 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750821Ab2DCGfn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Apr 2012 02:35:43 -0400
Received: by wibhj6 with SMTP id hj6so3315153wib.1
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Apr 2012 23:35:42 -0700 (PDT)
From: Andrej Krutak <andree@andree.sk>
Subject: [PATCH] Rename _B to _XBYTE in libfdt_env.h.
Date: Tue,  3 Apr 2012 08:35:21 +0200
Message-Id: <1333434921-14153-1-git-send-email-andree@andree.sk>
In-Reply-To: <E1SEpdZ-0000dW-8Z@jdl.com>
References: <E1SEpdZ-0000dW-8Z@jdl.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jon Loeliger <jdl@jdl.com>
Cc: devtree-discuss@lists.ozlabs.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Andrej Krutak <andree@andree.sk>

The _B macro is also defined by cygwin in ctype.h.
Rename _B to _XBYTE to better avoid name collisions.

Signed-off-by: Andrej Krutak <andree@andree.sk>
---
 scripts/dtc/libfdt/libfdt_env.h |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/dtc/libfdt/libfdt_env.h b/scripts/dtc/libfdt/libfdt_env.h
index 449bf60..4ec8565 100644
--- a/scripts/dtc/libfdt/libfdt_env.h
+++ b/scripts/dtc/libfdt/libfdt_env.h
@@ -5,19 +5,20 @@
 #include <stdint.h>
 #include <string.h>
 
-#define _B(n)	((unsigned long long)((uint8_t *)&x)[n])
+#define _XBYTE(n)	((unsigned long long)((uint8_t *)&x)[n])
 static inline uint32_t fdt32_to_cpu(uint32_t x)
 {
-	return (_B(0) << 24) | (_B(1) << 16) | (_B(2) << 8) | _B(3);
+	return (_XBYTE(0) << 24) | (_XBYTE(1) << 16) | (_XBYTE(2) << 8) | _XBYTE(3);
 }
 #define cpu_to_fdt32(x) fdt32_to_cpu(x)
 
 static inline uint64_t fdt64_to_cpu(uint64_t x)
 {
-	return (_B(0) << 56) | (_B(1) << 48) | (_B(2) << 40) | (_B(3) << 32)
-		| (_B(4) << 24) | (_B(5) << 16) | (_B(6) << 8) | _B(7);
+	return (_XBYTE(0) << 56) | (_XBYTE(1) << 48) | (_XBYTE(2) << 40)
+		| (_XBYTE(3) << 32) | (_XBYTE(4) << 24) | (_XBYTE(5) << 16)
+		| (_XBYTE(6) << 8) | _XBYTE(7);
 }
 #define cpu_to_fdt64(x) fdt64_to_cpu(x)
-#undef _B
+#undef _XBYTE
 
 #endif /* _LIBFDT_ENV_H */
-- 
1.7.4.1

