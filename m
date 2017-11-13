Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:45686 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751391AbdKMKel (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 05:34:41 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: specify FORCE as .PHONY target in Makefile.headersinst
Date: Mon, 13 Nov 2017 19:33:19 +0900
Message-Id: <1510569199-26057-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

Swap the order of ".PHONY: $(PHONY)" and "PHONY += FORCE"
so that FORCE is correctly specified as a .PHONY target.

Use a preferred way for specifying $(subdirs) as .PHONY targets.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.headersinst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index c6fb2b7..086a821 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -26,7 +26,7 @@ subdirs       := $(patsubst $(srcdir)/%/,%,\
 # Recursion
 __headers: $(subdirs)
 
-.PHONY: $(subdirs)
+PHONY += $(subdirs)
 $(subdirs):
 	$(Q)$(MAKE) $(hdr-inst)=$(obj)/$@ dst=$(dst)/$@
 
@@ -123,6 +123,7 @@ endif
 
 endif # skip-inst
 
-.PHONY: $(PHONY)
 PHONY += FORCE
 FORCE: ;
+
+.PHONY: $(PHONY)
-- 
2.7.4

