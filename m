Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46137 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfE0Xzh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 19:55:37 -0400
From: Trevor Bourget <tgb.kernel@gmail.com>
Subject: [PATCH] kbuild: tar-pkg: enable communication with jobserver
Date: Mon, 27 May 2019 16:54:23 -0700
Message-Id: <20190527235423.153853-1-tgb.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The buildtar script might want to invoke a make, so tell the parent
make to pass the jobserver token pipe to the subcommand by prefixing
the command with a +.

This addresses the issue seen here:

	/bin/sh ../scripts/package/buildtar tar-pkg
	make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.

See https://www.gnu.org/software/make/manual/html_node/Job-Slots.html
for more information.

Signed-off-by: Trevor Bourget <tgb.kernel@gmail.com>
---
 scripts/package/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 27b42d5b6c4f..ca7f46b562a4 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -104,7 +104,7 @@ clean-dirs += $(objtree)/snap/
 # ---------------------------------------------------------------------------
 tar%pkg: FORCE
 	$(MAKE) -f $(srctree)/Makefile
-	$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
+	+$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
 
 clean-dirs += $(objtree)/tar-install/
 
-- 
2.22.0.rc1.257.g3120a18244-goog
