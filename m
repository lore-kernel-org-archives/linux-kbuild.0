Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37478 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756712AbYAXWEI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:08 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 49/77] kconfig: macro fix in menu.c
Date: Thu, 24 Jan 2008 23:03:30 +0100
Message-Id: <1201212238-4369-49-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: EGRY Gabor <gaboregry1@t-online.hu>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

From: EGRY Gabor <gaboregry1@t-online.hu>

This patch removes the indirect I18N support for config file.

Signed-off-by: Egry Gabor <gaboregry1@t-online.hu>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/menu.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index f9d0d91..e9deebe 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -394,9 +394,9 @@ bool menu_is_visible(struct menu *menu)
 const char *menu_get_prompt(struct menu *menu)
 {
 	if (menu->prompt)
-		return _(menu->prompt->text);
+		return menu->prompt->text;
 	else if (menu->sym)
-		return _(menu->sym->name);
+		return menu->sym->name;
 	return NULL;
 }
 
-- 
1.5.4.rc3.14.g44397

