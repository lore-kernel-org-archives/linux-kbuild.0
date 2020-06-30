Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:18808 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728492AbgF3PHE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 11:07:04 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 1/2] kbuild: fix CONFIG_CC_CAN_LINK(_STATIC) for cross-compilation with Clang
Date: Wed,  1 Jul 2020 00:06:24 +0900
Message-Id: <20200630150625.12056-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, clang-built-linux@googlegroups.com

scripts/cc-can-link.sh tests if the compiler can link userspace
programs.

When $(CC) is GCC, it is checked against the target architecture
because the toolchain prefix is specified as a part of $(CC).

When $(CC) is Clang, it is checked against the host architecture
because --target option is missing.

Pass $(CLANG_FLAGS) to scripts/cc-can-link.sh to evaluate the link
capability for the target architecture.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - New patch

 init/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index a46aa8f3174d..d0313e7725fa 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -49,13 +49,13 @@ config CLANG_VERSION
 
 config CC_CAN_LINK
 	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(m64-flag)) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(m32-flag))
+	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
+	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
 
 config CC_CAN_LINK_STATIC
 	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) -static $(m64-flag)) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) -static $(m32-flag))
+	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) -static $(m64-flag)) if 64BIT
+	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) -static $(m32-flag))
 
 config CC_HAS_ASM_GOTO
 	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
-- 
2.25.1
