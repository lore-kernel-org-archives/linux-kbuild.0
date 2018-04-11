Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:46631 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756148AbeDKUEt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Apr 2018 16:04:49 -0400
Received: by mail-pl0-f66.google.com with SMTP id 59-v6so2166886plc.13
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Apr 2018 13:04:49 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv2] objtool: Support HOSTCFLAGS and HOSTLDFLAGS
Date: Wed, 11 Apr 2018 13:04:32 -0700
Message-Id: <20180411200432.3493-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Laura Abbott <labbott@redhat.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

It may be useful to compile host programs with different flags (e.g.
hardening). Ensure that objtool picks up the appropriate flags.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
v2: Drop several flags that are already defined in HOSTCFLAGS
---
 tools/objtool/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index e6acc281dd37..7df979ae4573 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -31,8 +31,8 @@ INCLUDES := -I$(srctree)/tools/include \
 	    -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
 	    -I$(srctree)/tools/objtool/arch/$(ARCH)/include
 WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed
-CFLAGS   += -Wall -Werror $(WARNINGS) -fomit-frame-pointer -O2 -g $(INCLUDES)
-LDFLAGS  += -lelf $(LIBSUBCMD)
+CFLAGS   += -Werror $(WARNINGS) $(HOSTCFLAGS) -g $(INCLUDES)
+LDFLAGS  += -lelf $(LIBSUBCMD) $(HOSTLDFLAGS)
 
 # Allow old libelf to be used:
 elfshdr := $(shell echo '\#include <libelf.h>' | $(CC) $(CFLAGS) -x c -E - | grep elf_getshdr)
-- 
2.14.3

