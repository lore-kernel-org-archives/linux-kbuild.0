Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.emlix.com ([46.4.235.150]:43190 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1030657AbeCANBy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Mar 2018 08:01:54 -0500
From: Philipp Puschmann <pp@emlix.com>
Subject: [PATCH] objtool: make use of pkg-config for libelf
Date: Thu,  1 Mar 2018 13:55:37 +0100
Message-Id: <20180301125537.14160-1-pp@emlix.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: michal.lkml@markovi.net, jpoimboe@redhat.com, peterz@infradead.org, linux-kbuild@vger.kernel.org, Philipp Puschmann <pp@emlix.com>

For libelf with non-standard paths make use of pkg-config.

Signed-off-by: Philipp Puschmann <pp@emlix.com>
---
 Makefile               | 4 +++-
 tools/objtool/Makefile | 8 ++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 659a7780aeb3..31b296b0e941 100644
--- a/Makefile
+++ b/Makefile
@@ -953,8 +953,10 @@ endif
 export mod_sign_cmd
 
 ifdef CONFIG_STACK_VALIDATION
+  LIBELF_LIBS = $(shell pkg-config --libs libelf 2> /dev/null || \
+                        echo -lelf)
   has_libelf := $(call try-run,\
-		echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf -,1,0)
+		echo "int main() {}" | $(HOSTCC) -xc -o /dev/null $(LIBELF_LIBS) -,1,0)
   ifeq ($(has_libelf),1)
     objtool_target := tools/objtool FORCE
   else
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index e6acc281dd37..c565eff8c393 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -27,12 +27,16 @@ OBJTOOL_IN := $(OBJTOOL)-in.o
 
 all: $(OBJTOOL)
 
+LIBELF_LIBS     = $(shell pkg-config --libs libelf 2> /dev/null || \
+                        echo -lelf)
+LIBELF_INCLUDES = $(shell pkg-config --cflags libelf 2> /dev/null)
 INCLUDES := -I$(srctree)/tools/include \
 	    -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
-	    -I$(srctree)/tools/objtool/arch/$(ARCH)/include
+	    -I$(srctree)/tools/objtool/arch/$(ARCH)/include \
+	    $(LIBELF_INCLUDES)
 WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed
 CFLAGS   += -Wall -Werror $(WARNINGS) -fomit-frame-pointer -O2 -g $(INCLUDES)
-LDFLAGS  += -lelf $(LIBSUBCMD)
+LDFLAGS  += $(LIBELF_LIBS) $(LIBSUBCMD)
 
 # Allow old libelf to be used:
 elfshdr := $(shell echo '\#include <libelf.h>' | $(CC) $(CFLAGS) -x c -E - | grep elf_getshdr)
-- 
2.16.1

