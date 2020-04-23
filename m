Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:43061 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgDWOYu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 10:24:50 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 1/4] kbuild: use $(CC_VERSION_TEXT) to evaluate CC_IS_GCC and CC_IS_CLANG
Date: Thu, 23 Apr 2020 23:23:51 +0900
Message-Id: <20200423142354.312088-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org

The result of '$(CC) --version | head -n 1' is already computed by the
top Makefile, and stored in the environment variable, CC_VERSION_TEXT.

'echo' is probably less expensive than the two commands $(CC) and
'head' although this optimization is not noticeable level.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - new patch

 init/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 9e22ee8fbd75..5f797df3f043 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -9,7 +9,7 @@ config DEFCONFIG_LIST
 	default "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)"
 
 config CC_IS_GCC
-	def_bool $(success,$(CC) --version | head -n 1 | grep -q gcc)
+	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q gcc)
 
 config GCC_VERSION
 	int
@@ -21,7 +21,7 @@ config LD_VERSION
 	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
 
 config CC_IS_CLANG
-	def_bool $(success,$(CC) --version | head -n 1 | grep -q clang)
+	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
 
 config CLANG_VERSION
 	int
-- 
2.25.1
