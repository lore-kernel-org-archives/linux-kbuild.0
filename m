Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:36024 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751865Ab3IUXRa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 Sep 2013 19:17:30 -0400
Received: by mail-wg0-f50.google.com with SMTP id f12so1808533wgh.17
        for <linux-kbuild@vger.kernel.org>; Sat, 21 Sep 2013 16:17:29 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH] kconfig: fix allmodconfig
Date: Sun, 22 Sep 2013 01:17:23 +0200
Message-Id: <1379805443-10945-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Stephen Rothwell <sfr@canb.auug.org.au>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>
---
 scripts/kconfig/confdata.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 87f7238..0cbfc67 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -399,8 +399,6 @@ setsym:
 	free(line);
 	fclose(in);
 
-	if (modules_sym)
-		sym_calc_value(modules_sym);
 	return 0;
 }
 
@@ -1175,6 +1173,10 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
 				sym->def[S_DEF_USER].tri = yes;
 				break;
 			case def_mod:
+				/* Note: although modules_sym must be 'yes' to
+				 * enable tristates, 'mod' is promoted to 'yes'
+				 * when applied to a boolean, which modules_sym
+				 * is. So we need not special-case it here. */
 				sym->def[S_DEF_USER].tri = mod;
 				break;
 			case def_no:
-- 
1.8.1.2

