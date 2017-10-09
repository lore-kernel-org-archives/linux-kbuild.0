Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:32037 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754212AbdJIOfu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 10:35:50 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] hexagon: add KBUILD_ prefix to CFLAGS_MODULE, LDFLAGS_MODULE
Date: Mon,  9 Oct 2017 23:35:14 +0900
Message-Id: <1507559715-30918-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1507559715-30918-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507559715-30918-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Richard Kuo <rkuo@codeaurora.org>, linux-kernel@vger.kernel.org, linux-hexagon@vger.kernel.org

{CFLAGS,LDFLAGS}_MODULE are supposed to be set by users, not by
in-kernel makefiles.

Documentation/kbuild/makefiles.txt clearly explains the difference:

  KBUILD_CFLAGS_MODULE   Options for $(CC) when building modules

      $(KBUILD_CFLAGS_MODULE) is used to add arch-specific options that
      are used for $(CC).
      From commandline CFLAGS_MODULE shall be used (see kbuild.txt).

  KBUILD_LDFLAGS_MODULE   Options for $(LD) when linking modules

      $(KBUILD_LDFLAGS_MODULE) is used to add arch-specific options
      used when linking modules. This is often a linker script.
      From commandline LDFLAGS_MODULE shall be used (see kbuild.txt).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/hexagon/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/hexagon/Makefile b/arch/hexagon/Makefile
index 207711a0..4f5c84c 100644
--- a/arch/hexagon/Makefile
+++ b/arch/hexagon/Makefile
@@ -11,9 +11,9 @@ KBUILD_CFLAGS += -fno-short-enums
 
 # Modules must use either long-calls, or use pic/plt.
 # Use long-calls for now, it's easier.  And faster.
-# CFLAGS_MODULE += -fPIC
-# LDFLAGS_MODULE += -shared
-CFLAGS_MODULE += -mlong-calls
+# KBUILD_CFLAGS_MODULE += -fPIC
+# KBUILD_LDFLAGS_MODULE += -shared
+KBUILD_CFLAGS_MODULE += -mlong-calls
 
 cflags-y += $(call cc-option,-mv${CONFIG_HEXAGON_ARCH_VERSION})
 aflags-y += $(call cc-option,-mv${CONFIG_HEXAGON_ARCH_VERSION})
-- 
2.7.4

