Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:27928 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750816AbeFAKYi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Jun 2018 06:24:38 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] fixup! gcc-plugins: test plugin support in Kconfig and clean up Makefile
Date: Fri,  1 Jun 2018 19:24:21 +0900
Message-Id: <1527848661-31913-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index e5ff804..3f93769 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -405,7 +405,7 @@ preferred-plugin-hostcc := $(if-success,[ $(gcc-version) -ge 40800 ],$(HOSTCXX),
 
 config PLUGIN_HOSTCC
 	string
-	default "$(shell,$(srctree)/scripts/gcc-plugin.sh $(preferred-plugin-hostcc) $(HOSTCXX) $(CC))"
+	default "$(shell,$(srctree)/scripts/gcc-plugin.sh "$(preferred-plugin-hostcc)" "$(HOSTCXX)" "$(CC)")"
 	help
 	  Host compiler used to build GCC plugins.  This can be $(HOSTCXX),
 	  $(HOSTCC), or a null string if GCC plugin is unsupported.
-- 
2.7.4

