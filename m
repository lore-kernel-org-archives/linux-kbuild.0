Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:44535 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751706Ab2KVVKw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Nov 2012 16:10:52 -0500
Received: by mail-we0-f174.google.com with SMTP id d7so2149633wer.19
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Nov 2012 13:10:51 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 3/3] scripts/kconfig: allow setting the root-menu label from environment
Date: Thu, 22 Nov 2012 01:06:06 +0100
Message-Id: <1353542766-24422-4-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1353542766-24422-1-git-send-email-yann.morin.1998@free.fr>
References: <1353542766-24422-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, the root-menu label is hard-coded in the kconfig frontends
executables. This means that two projects that use kconfig and want
to display different root-menu labels can not share the same kconfig
frontends.

Instead of hard-coding the label in the frontends, handle it the same
we handle the CONFIG_ prefix:
  - get the root-menu label from the environment if present
  - allow to set it at build time (eg. -DROOTMENU='"Root menu label"')
  - fallback to a hard-coded default

(Note: the kconfig 'mainmenu' directive still has precedence)

(refresh zconf.tab.c_shipped to match)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/Makefile            |    3 ++-
 scripts/kconfig/lkc.h               |    8 ++++++++
 scripts/kconfig/zconf.tab.c_shipped |    2 +-
 scripts/kconfig/zconf.y             |    2 +-
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 231b475..493da53 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -11,8 +11,9 @@ else
 Kconfig := Kconfig
 endif
 
-# We need this, in case the user has it in its environment
+# We need these, in case the user has them in its environment
 unexport CONFIG_
+unexport CONFIG_ROOTMENU
 
 xconfig: $(obj)/qconf
 	$< $(Kconfig)
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 5cfd940..93b9e69 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -46,6 +46,14 @@ static inline const char *CONFIG_prefix(void)
 #undef CONFIG_
 #define CONFIG_ CONFIG_prefix()
 
+#ifndef CONFIG_ROOTMENU
+#define CONFIG_ROOTMENU "Linux Kernel Configuration"
+#endif
+static inline const char *CONFIG_rootmenu(void)
+{
+	return getenv( "CONFIG_ROOTMENU" ) ?: CONFIG_ROOTMENU;
+}
+
 #define TF_COMMAND	0x0001
 #define TF_PARAM	0x0002
 #define TF_OPTION	0x0004
diff --git a/scripts/kconfig/zconf.tab.c_shipped b/scripts/kconfig/zconf.tab.c_shipped
index f636141..8c91e69 100644
--- a/scripts/kconfig/zconf.tab.c_shipped
+++ b/scripts/kconfig/zconf.tab.c_shipped
@@ -2259,7 +2259,7 @@ void conf_parse(const char *name)
 	modules_sym = sym_lookup(NULL, 0);
 	modules_sym->type = S_BOOLEAN;
 	modules_sym->flags |= SYMBOL_AUTO;
-	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
+	rootmenu.prompt = menu_add_prompt(P_MENU, CONFIG_rootmenu(), NULL);
 
 	if (getenv("ZCONF_DEBUG"))
 		zconfdebug = 1;
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 864da07..9ce6935 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -496,7 +496,7 @@ void conf_parse(const char *name)
 	modules_sym = sym_lookup(NULL, 0);
 	modules_sym->type = S_BOOLEAN;
 	modules_sym->flags |= SYMBOL_AUTO;
-	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
+	rootmenu.prompt = menu_add_prompt(P_MENU, CONFIG_rootmenu(), NULL);
 
 	if (getenv("ZCONF_DEBUG"))
 		zconfdebug = 1;
-- 
1.7.2.5

