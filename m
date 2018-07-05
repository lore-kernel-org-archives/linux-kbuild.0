Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:24207 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753025AbeGEDdc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jul 2018 23:33:32 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RESEND PATCH 2/2] kbuild: remove duplicated comments about PHONY
Date: Thu,  5 Jul 2018 12:33:08 +0900
Message-Id: <1530761588-9986-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1530761588-9986-1-git-send-email-yamada.masahiro@socionext.com>
References: <1530761588-9986-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The comment is the same as in the top-level Makefile.

Also, the comments contain typos:
  - the .PHONY variable  ->  the PHONY variable
  - se we can ...        ->  so we can ...

Instead of fixing the typos, just remove the duplicated comments.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build      | 3 ---
 scripts/Makefile.clean      | 3 ---
 scripts/Makefile.modbuiltin | 4 ----
 scripts/Makefile.modinst    | 4 ----
 scripts/Makefile.modpost    | 4 ----
 scripts/Makefile.modsign    | 3 ---
 6 files changed, 21 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index e7889f4..514ed63 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -590,7 +590,4 @@ endif
 # We never want them to be removed automatically.
 .SECONDARY: $(targets)
 
-# Declare the contents of the .PHONY variable as phony.  We keep that
-# information in a variable se we can use it in if_changed and friends.
-
 .PHONY: $(PHONY)
diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index 808d09f..17ef94c 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -88,7 +88,4 @@ PHONY += $(subdir-ymn)
 $(subdir-ymn):
 	$(Q)$(MAKE) $(clean)=$@
 
-# Declare the contents of the .PHONY variable as phony.  We keep that
-# information in a variable se we can use it in if_changed and friends.
-
 .PHONY: $(PHONY)
diff --git a/scripts/Makefile.modbuiltin b/scripts/Makefile.modbuiltin
index a763b47..40867a4 100644
--- a/scripts/Makefile.modbuiltin
+++ b/scripts/Makefile.modbuiltin
@@ -54,8 +54,4 @@ PHONY += $(subdir-ym)
 $(subdir-ym):
 	$(Q)$(MAKE) $(modbuiltin)=$@
 
-
-# Declare the contents of the .PHONY variable as phony.  We keep that
-# information in a variable se we can use it in if_changed and friends.
-
 .PHONY: $(PHONY)
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 51ca024..ff5ca98 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -35,8 +35,4 @@ modinst_dir = $(if $(KBUILD_EXTMOD),$(ext-mod-dir),kernel/$(@D))
 $(modules):
 	$(call cmd,modules_install,$(MODLIB)/$(modinst_dir))
 
-
-# Declare the contents of the .PHONY variable as phony.  We keep that
-# information in a variable so we can use it in if_changed and friends.
-
 .PHONY: $(PHONY)
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index df41744..dd92dbb 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -149,8 +149,4 @@ ifneq ($(cmd_files),)
   include $(cmd_files)
 endif
 
-
-# Declare the contents of the .PHONY variable as phony.  We keep that
-# information in a variable se we can use it in if_changed and friends.
-
 .PHONY: $(PHONY)
diff --git a/scripts/Makefile.modsign b/scripts/Makefile.modsign
index 171483b..da56aa7 100644
--- a/scripts/Makefile.modsign
+++ b/scripts/Makefile.modsign
@@ -27,7 +27,4 @@ modinst_dir = $(if $(KBUILD_EXTMOD),$(ext-mod-dir),kernel/$(@D))
 $(modules):
 	$(call cmd,sign_ko,$(MODLIB)/$(modinst_dir))
 
-# Declare the contents of the .PHONY variable as phony.  We keep that
-# information in a variable se we can use it in if_changed and friends.
-
 .PHONY: $(PHONY)
-- 
2.7.4

