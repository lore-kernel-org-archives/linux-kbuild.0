Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:39558 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731576AbfHFGkX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 02:40:23 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/5] kbuild: rename cmd_ar_builtin to cmd_ar_no_sym
Date: Tue,  6 Aug 2019 15:39:21 +0900
Message-Id: <20190806063923.1266-4-yamada.masahiro@socionext.com>
In-Reply-To: <20190806063923.1266-1-yamada.masahiro@socionext.com>
References: <20190806063923.1266-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

In the next commit, I will re-use this for thin-archives of objects
liked into modules.

Rename cmd_ar_builtin to a more generic cmd_ar_no_sym.
(cmd_ar is already defined in scripts/Makefile.lib)

I removed unneeded ifdef builtin-target.

No functional change intended.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index b0ff60ac0c42..68622cbdfda5 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -404,16 +404,14 @@ $(sort $(subdir-obj-y)): $(subdir-ym) ;
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
 #
-ifdef builtin-target
 
-quiet_cmd_ar_builtin = AR      $@
-      cmd_ar_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
+quiet_cmd_ar_no_sym = AR      $@
+      cmd_ar_no_sym = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
 
 $(builtin-target): $(real-obj-y) FORCE
-	$(call if_changed,ar_builtin)
+	$(call if_changed,ar_no_sym)
 
 targets += $(builtin-target)
-endif # builtin-target
 
 #
 # Rule to create modules.order file
-- 
2.17.1
