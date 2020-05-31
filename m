Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:36506 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgEaKMC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 31 May 2020 06:12:02 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: merge two 'ifdef CONFIG_TRIM_UNUSED_KSYMS' blocks
Date: Sun, 31 May 2020 19:11:39 +0900
Message-Id: <20200531101139.1242928-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This hunk has two 'ifdef CONFIG_TRIM_UNUSED_KSYMS ... endif' blocks
with no other code interleaved. Merge them.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index b856f84e28c9..44921d9cf3cf 100644
--- a/Makefile
+++ b/Makefile
@@ -1098,16 +1098,14 @@ vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)
 # Recurse until adjust_autoksyms.sh is satisfied
 PHONY += autoksyms_recursive
 ifdef CONFIG_TRIM_UNUSED_KSYMS
-autoksyms_recursive: descend modules.order
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
-	  "$(MAKE) -f $(srctree)/Makefile vmlinux"
-endif
-
 # For the kernel to actually contain only the needed exported symbols,
 # we have to build modules as well to determine what those symbols are.
 # (this can be evaluated only once include/config/auto.conf has been included)
-ifdef CONFIG_TRIM_UNUSED_KSYMS
-  KBUILD_MODULES := 1
+KBUILD_MODULES := 1
+
+autoksyms_recursive: descend modules.order
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
+	  "$(MAKE) -f $(srctree)/Makefile vmlinux"
 endif
 
 autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
-- 
2.25.1
