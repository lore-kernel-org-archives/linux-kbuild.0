Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:56123 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfLQESj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:18:39 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kconfig: fix too deep indentation in Makefile
Date: Tue, 17 Dec 2019 13:18:18 +0900
Message-Id: <20191217041819.29732-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

The indentation for if ... else ... fi is too deep. Fix it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/Makefile | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 2f1a59fa5169..f826a257d576 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -48,15 +48,15 @@ build_xconfig: $(obj)/qconf
 
 localyesconfig localmodconfig: $(obj)/conf
 	$(Q)perl $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
-	$(Q)if [ -f .config ]; then 					\
-			cmp -s .tmp.config .config ||			\
-			(mv -f .config .config.old.1;			\
-			 mv -f .tmp.config .config;			\
-			 $< $(silent) --oldconfig $(Kconfig);		\
-			 mv -f .config.old.1 .config.old)		\
-	else								\
-			mv -f .tmp.config .config;			\
-			$< $(silent) --oldconfig $(Kconfig);		\
+	$(Q)if [ -f .config ]; then 				\
+		cmp -s .tmp.config .config ||			\
+		(mv -f .config .config.old.1;			\
+		 mv -f .tmp.config .config;			\
+		 $< $(silent) --oldconfig $(Kconfig);		\
+		 mv -f .config.old.1 .config.old)		\
+	else							\
+		mv -f .tmp.config .config;			\
+		$< $(silent) --oldconfig $(Kconfig);		\
 	fi
 	$(Q)rm -f .tmp.config
 
-- 
2.17.1
