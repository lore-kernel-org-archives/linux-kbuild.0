Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37476 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756554AbYAXWEJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:09 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 54/77] kconfig: gconfig: symbol fix
Date: Thu, 24 Jan 2008 23:03:35 +0100
Message-Id: <1201212238-4369-54-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: EGRY Gabor <gaboregry1@t-online.hu>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

From: EGRY Gabor <gaboregry1@t-online.hu>

Gettext support for symbol names are unnecessary.

Signed-off-by: Egry Gabor <gaboregry1@t-online.hu>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/gconf.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index dfe748c..199b22b 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -466,7 +466,7 @@ static void text_insert_help(struct menu *menu)
 		help = _(help);
 
 	if (menu->sym && menu->sym->name)
-		name = g_strdup_printf(_(menu->sym->name));
+		name = g_strdup_printf(menu->sym->name);
 	else
 		name = g_strdup("");
 
-- 
1.5.4.rc3.14.g44397

