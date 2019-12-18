Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:50784 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726921AbfLRPfZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 10:35:25 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kbuild: detect missing include guard for exported headers
Date: Thu, 19 Dec 2019 00:34:21 +0900
Message-Id: <20191218153422.14557-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

Adding an include guard to every header file is good practice in case
it is included multiple times.

Exported headers are compile-tested for the comprehensive sanity checks.
Let's include the same header twice. If an include guard is missing,
the header will fail to build due to redefinition of something.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---

 usr/include/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 84598469e6ff..e90f5f7903bb 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -93,10 +93,11 @@ header-test- += asm-generic/%
 
 extra-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
 
+# Include the header to detect missing include guard.
 quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
 		$(CC) $(c_flags) -S -o /dev/null -x c /dev/null \
-			$(if $(filter-out $(header-test-), $*.h), -include $<); \
+			$(if $(filter-out $(header-test-), $*.h), -include $< -include $<); \
 		$(PERL) $(srctree)/scripts/headers_check.pl $(obj) $(SRCARCH) $<; \
 		touch $@
 
-- 
2.17.1
