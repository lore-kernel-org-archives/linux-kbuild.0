Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42830 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756460AbYAXWD7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:59 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 57/77] kconfig: use environment option
Date: Thu, 24 Jan 2008 23:03:38 +0100
Message-Id: <1201212238-4369-57-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Roman Zippel <zippel@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>

From: Roman Zippel <zippel@linux-m68k.org>

Use the environment option to provide the ARCH symbol
and the KERNELVERSION symbol.

Signed-off-by: Roman Zippel <zippel@linux-m68k.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 init/Kconfig             |    8 ++++++++
 scripts/kconfig/symbol.c |   15 ---------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index b9d11a8..e7f2f41 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1,3 +1,11 @@
+config ARCH
+	string
+	option env="ARCH"
+
+config KERNELVERSION
+	string
+	option env="KERNELVERSION"
+
 config DEFCONFIG_LIST
 	string
 	depends on !UML
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 99e3d02..3929e5b 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -47,7 +47,6 @@ void sym_init(void)
 {
 	struct symbol *sym;
 	struct utsname uts;
-	char *p;
 	static bool inited = false;
 
 	if (inited)
@@ -56,20 +55,6 @@ void sym_init(void)
 
 	uname(&uts);
 
-	sym = sym_lookup("ARCH", 0);
-	sym->type = S_STRING;
-	sym->flags |= SYMBOL_AUTO;
-	p = getenv("ARCH");
-	if (p)
-		sym_add_default(sym, p);
-
-	sym = sym_lookup("KERNELVERSION", 0);
-	sym->type = S_STRING;
-	sym->flags |= SYMBOL_AUTO;
-	p = getenv("KERNELVERSION");
-	if (p)
-		sym_add_default(sym, p);
-
 	sym = sym_lookup("UNAME_RELEASE", 0);
 	sym->type = S_STRING;
 	sym->flags |= SYMBOL_AUTO;
-- 
1.5.4.rc3.14.g44397

