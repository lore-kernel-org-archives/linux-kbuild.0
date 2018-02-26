Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33623 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751972AbeBZSmo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Feb 2018 13:42:44 -0500
Received: by mail-wm0-f66.google.com with SMTP id s206so18275768wme.0
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Feb 2018 10:42:43 -0800 (PST)
From: Robin Jarry <robin.jarry@6wind.com>
Subject: [PATCH v2 3/3] objtool: use global host flags for compilation
Date: Mon, 26 Feb 2018 19:41:48 +0100
Message-Id: <2fa138b613417581eca23afd8741aaf75fbf966a.1519668832.git.robin.jarry@6wind.com>
In-Reply-To: <cover.1519668832.git.robin.jarry@6wind.com>
References: <cover.1519393674.git.robin.jarry@6wind.com> <cover.1519668832.git.robin.jarry@6wind.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>

When libelf headers and libs are not found and CONFIG_UNWINDER_ORC is
selected, there is a make error introduced by
commit 3dd40cb320fe ("objtool: Upgrade libelf-devel warning to error for
CONFIG_ORC_UNWINDER").

Host headers and libs may be in a non-standard location and the check is
performed without host flags. Make sure to use host flags for the check
and for building objtool. Remove duplicate flags.

Fixes: 3b27a0c85d70 ("objtool: Detect and warn if libelf is missing and don't break the build")
Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Ingo Molnar <mingo@kernel.org>
---
 Makefile               | 2 +-
 tools/objtool/Makefile | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index f7c543cebfc6..c9dc35fe0e48 100644
--- a/Makefile
+++ b/Makefile
@@ -955,7 +955,7 @@ export mod_sign_cmd
 
 ifdef CONFIG_STACK_VALIDATION
   has_libelf := $(call try-run,\
-		echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf -,1,0)
+	echo "int main() {}" | $(HOSTCC) $(HOSTLDFLAGS) -xc -o /dev/null -lelf -,1,0)
   ifeq ($(has_libelf),1)
     objtool_target := tools/objtool FORCE
   else
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index e6acc281dd37..4d4b810313e2 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -31,8 +31,8 @@ INCLUDES := -I$(srctree)/tools/include \
 	    -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
 	    -I$(srctree)/tools/objtool/arch/$(ARCH)/include
 WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed
-CFLAGS   += -Wall -Werror $(WARNINGS) -fomit-frame-pointer -O2 -g $(INCLUDES)
-LDFLAGS  += -lelf $(LIBSUBCMD)
+CFLAGS   += $(HOSTCFLAGS) -Werror $(WARNINGS) -g $(INCLUDES)
+LDFLAGS  += $(HOSTLDFLAGS) -lelf $(LIBSUBCMD)
 
 # Allow old libelf to be used:
 elfshdr := $(shell echo '\#include <libelf.h>' | $(CC) $(CFLAGS) -x c -E - | grep elf_getshdr)
-- 
2.11.0

