Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from host.76.145.23.62.rev.coltfrance.com ([62.23.145.76]:56237 "EHLO
        proxy.6wind.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfDKIqf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 04:46:35 -0400
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Subject: [PATCH linux] objtool: fix pkg-config query in case of cross-compilation
Date: Thu, 11 Apr 2019 10:39:40 +0200
Message-Id: <20190411083940.3911-1-nicolas.dichtel@6wind.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: tglx@linutronix.de, jpoimboe@redhat.com, eb@emlix.com, yamada.masahiro@socionext.com, peterz@infradead.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Dichtel <nicolas.dichtel@6wind.com>

In case of cross-compilation, there may be two pkg-config tools, one for
the host and one for the target. Enable to override the default name.

Fixes: 056d28d135bc ("objtool: Query pkg-config for libelf location")
Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 Makefile               | 3 ++-
 tools/objtool/Makefile | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 15c8251d4d5e..f12ca3598fc4 100644
--- a/Makefile
+++ b/Makefile
@@ -953,7 +953,8 @@ mod_sign_cmd = true
 endif
 export mod_sign_cmd
 
-HOST_LIBELF_LIBS = $(shell pkg-config libelf --libs 2>/dev/null || echo -lelf)
+export HOST_PKG_CONFIG ?= pkg-config
+HOST_LIBELF_LIBS = $(shell $(HOST_PKG_CONFIG) libelf --libs 2>/dev/null || echo -lelf)
 
 ifdef CONFIG_STACK_VALIDATION
   has_libelf := $(call try-run,\
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 53f8be0f4a1f..4e229e77aacf 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -25,8 +25,8 @@ LIBSUBCMD		= $(LIBSUBCMD_OUTPUT)libsubcmd.a
 OBJTOOL    := $(OUTPUT)objtool
 OBJTOOL_IN := $(OBJTOOL)-in.o
 
-LIBELF_FLAGS := $(shell pkg-config libelf --cflags 2>/dev/null)
-LIBELF_LIBS  := $(shell pkg-config libelf --libs 2>/dev/null || echo -lelf)
+LIBELF_FLAGS := $(shell $(HOST_PKG_CONFIG) libelf --cflags 2>/dev/null)
+LIBELF_LIBS  := $(shell $(HOST_PKG_CONFIG) libelf --libs 2>/dev/null || echo -lelf)
 
 all: $(OBJTOOL)
 
-- 
2.21.0
