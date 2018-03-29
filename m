Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:33779 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751206AbeC2AsR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Mar 2018 20:48:17 -0400
Received: by mail-pg0-f68.google.com with SMTP id i194so1950981pgd.0
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Mar 2018 17:48:17 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCH 2/3] objtool: Support HOSTCFLAGS and HOSTLDFLAGS
Date: Wed, 28 Mar 2018 17:48:04 -0700
Message-Id: <20180329004805.7278-3-labbott@redhat.com>
In-Reply-To: <20180329004805.7278-1-labbott@redhat.com>
References: <20180329004805.7278-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

It may be useful to compile host programs with different flags (e.g.
hardening). Ensure that objtool picks up the appropriate flags.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
 tools/objtool/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index e6acc281dd37..0ff3bcac1ca9 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -31,8 +31,9 @@ INCLUDES := -I$(srctree)/tools/include \
 	    -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
 	    -I$(srctree)/tools/objtool/arch/$(ARCH)/include
 WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed
-CFLAGS   += -Wall -Werror $(WARNINGS) -fomit-frame-pointer -O2 -g $(INCLUDES)
-LDFLAGS  += -lelf $(LIBSUBCMD)
+CFLAGS   += -Wall -Werror $(WARNINGS) $(HOSTCFLAGS) -fomit-frame-pointer -O2 -g \
+	    $(INCLUDES)
+LDFLAGS  += -lelf $(LIBSUBCMD) $(HOSTLDFLAGS)
 
 # Allow old libelf to be used:
 elfshdr := $(shell echo '\#include <libelf.h>' | $(CC) $(CFLAGS) -x c -E - | grep elf_getshdr)
-- 
2.16.2

