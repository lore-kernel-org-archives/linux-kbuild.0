Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aa012msr.fastwebnet.it ([85.18.95.72]:48268 "EHLO
	aa012msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753255AbZLDSnd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Dec 2009 13:43:33 -0500
Message-ID: <23753252.369201259951904278.JavaMail.defaultUser@defaultHost>
Date: Fri, 4 Dec 2009 19:38:24 +0100 (CET)
From: "matteo_cortese@fastwebnet.it" <matteo_cortese@fastwebnet.it>
Reply-To: "matteo_cortese@fastwebnet.it" <matteo_cortese@fastwebnet.it>
Subject: [PATCH] make gconfig: fix the "(NEW)" string
MIME-Version: 1.0
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

The string "(NEW)" is added to those options that are not present in the
 current config file, thus looking as new features. Alas, the logic seem
s to be inverted.
 

Signed-off-by: Matteo Cortese <matteo_cortese@fastwebnet.it>
------

diff -u linux-source-2.6.26-old/scripts/kconfig/gconf.c linux-source-2.6
.26/scripts/kconfig/gconf.c
--- linux-source-2.6.26-old/scripts/kconfig/gconf.c	2008-07-13 21:51:29.
000000000 +0000
+++ linux-source-2.6.26/scripts/kconfig/gconf.c	2009-01-03 00:52:57.0000
00000 +0000
@@ -1174,7 +1174,7 @@
 
 	row[COL_OPTION] =
 	    g_strdup_printf("%s %s", _(menu_get_prompt(menu)),
-			    sym && sym_has_value(sym) ? "(NEW)" : "");
+			    sym && !sym_has_value(sym) ? "(NEW)" : "");
 
 	if (show_all && !menu_is_visible(menu))
 		row[COL_COLOR] = g_strdup("DarkGray");

