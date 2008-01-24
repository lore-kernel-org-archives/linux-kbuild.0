Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37483 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756389AbYAXWEA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:00 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 36/77] kconfig: allow overriding symbols
Date: Thu, 24 Jan 2008 23:03:17 +0100
Message-Id: <1201212238-4369-36-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jan Engelhardt <jengelh@computergmbh.de>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>, Randy Dunlap <randy.dunlap@oracle.com>

From: Jan Engelhardt <jengelh@computergmbh.de>

Allow config variables in .config to override earlier ones in the same
file. In other words,

	# CONFIG_SECURITY is not defined
	CONFIG_SECURITY=y

will activate it. This makes it a bit easier to do

cat original-config myconfig myconfig2 ... >.config;
and run *config as expected.

Signed-off-by: Jan Engelhardt <jengelh@computergmbh.de>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>
---
 scripts/kconfig/confdata.c |   14 +++++---------
 1 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index e0f402f..2eccefb 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -232,8 +232,7 @@ load:
 					sym->type = S_BOOLEAN;
 			}
 			if (sym->flags & def_flags) {
-				conf_warning("trying to reassign symbol %s", sym->name);
-				break;
+				conf_warning("override: reassigning to symbol %s", sym->name);
 			}
 			switch (sym->type) {
 			case S_BOOLEAN:
@@ -272,8 +271,7 @@ load:
 					sym->type = S_OTHER;
 			}
 			if (sym->flags & def_flags) {
-				conf_warning("trying to reassign symbol %s", sym->name);
-				break;
+				conf_warning("override: reassigning to symbol %s", sym->name);
 			}
 			if (conf_set_sym_val(sym, def, def_flags, p))
 				continue;
@@ -297,11 +295,9 @@ load:
 				}
 				break;
 			case yes:
-				if (cs->def[def].tri != no) {
-					conf_warning("%s creates inconsistent choice state", sym->name);
-					cs->flags &= ~def_flags;
-				} else
-					cs->def[def].val = sym;
+				if (cs->def[def].tri != no)
+					conf_warning("override: %s changes choice state", sym->name);
+				cs->def[def].val = sym;
 				break;
 			}
 			cs->def[def].tri = E_OR(cs->def[def].tri, sym->def[def].tri);
-- 
1.5.4.rc3.14.g44397

