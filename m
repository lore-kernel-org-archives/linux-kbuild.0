Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail01d.mail.t-online.hu ([84.2.42.6]:57850 "EHLO
	mail01d.mail.t-online.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760101AbYAKWws (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jan 2008 17:52:48 -0500
Subject: [PATCH 6/10] kconfig: gconfig: symbol fix
From: EGRY Gabor <gaboregry1@t-online.hu>
Content-Type: text/plain
Date: Fri, 11 Jan 2008 23:49:12 +0100
Message-Id: <1200091752.10603.44.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@zh-kernel.org


Gettext support for symbol names are unnecessary.

Signed-off-by: Egry Gabor <gaboregry1@t-online.hu>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---

 kbuild-szilard/scripts/kconfig/gconf.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN scripts/kconfig/gconf.c~kconfig-i18n-11-gconfig-symbol-fix scripts/kconfig/gconf.c
--- kbuild/scripts/kconfig/gconf.c~kconfig-i18n-11-gconfig-symbol-fix	2008-01-11 22:27:14.000000000 +0100
+++ kbuild-szilard/scripts/kconfig/gconf.c	2008-01-11 22:27:14.000000000 +0100
@@ -466,7 +466,7 @@ static void text_insert_help(struct menu
 		help = _(help);
 
 	if (menu->sym && menu->sym->name)
-		name = g_strdup_printf(_(menu->sym->name));
+		name = g_strdup_printf(menu->sym->name);
 	else
 		name = g_strdup("");
 
_

