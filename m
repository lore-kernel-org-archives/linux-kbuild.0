Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail02a.mail.t-online.hu ([84.2.40.7]:53041 "EHLO
	mail02a.mail.t-online.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761530AbYAKWzJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jan 2008 17:55:09 -0500
Subject: [PATCH 9/10] kconfig: macro fix in menu.c
From: EGRY Gabor <gaboregry1@t-online.hu>
Content-Type: text/plain
Date: Fri, 11 Jan 2008 23:53:43 +0100
Message-Id: <1200092023.10603.52.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@zh-kernel.org


This patch removes the indirect I18N support for config file.

Signed-off-by: Egry Gabor <gaboregry1@t-online.hu>
---

 kbuild-szilard/scripts/kconfig/menu.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN scripts/kconfig/menu.c~kconfig-i18n-16-menu-fix scripts/kconfig/menu.c
--- kbuild/scripts/kconfig/menu.c~kconfig-i18n-16-menu-fix	2008-01-11 22:27:18.000000000 +0100
+++ kbuild-szilard/scripts/kconfig/menu.c	2008-01-11 22:27:18.000000000 +0100
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
 
_

