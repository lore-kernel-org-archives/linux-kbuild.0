Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:39190 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbfFDKPi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:38 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 14/15] fixup: kbuild: add support for ensuring headers are self-contained
Date: Tue,  4 Jun 2019 19:14:08 +0900
Message-Id: <20190604101409.2078-15-yamada.masahiro@socionext.com>
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This is needed to avoid regeneration of header-test C files.

This will go away when Jani send v2.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2b4d56483c2e..067e98628664 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -298,10 +298,9 @@ $(obj)/%.lst: $(src)/%.c FORCE
 # ---------------------------------------------------------------------------
 
 quiet_cmd_header_test = HDRTEST $@
-      cmd_header_test = echo "\#include \"$(<F)\"" > $@
+      cmd_header_test = echo "\#include \"$*.h\"" > $@
 
-# FIXME: would be nice to be able to limit this implicit rule to header-test-y
-$(obj)/%.header_test.c: $(src)/%.h FORCE
+$(obj)/%.header_test.c:
 	$(call if_changed,header_test)
 
 # Compile assembler sources (.S)
-- 
2.17.1
