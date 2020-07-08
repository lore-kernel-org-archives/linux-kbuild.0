Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:34943 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729323AbgGHNc3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 09:32:29 -0400
From: Maxime Chretien <maxime.chretien@bootlin.com>
Subject: [PATCH] kconfig qconf: Fix mouse events in search view
Date: Wed,  8 Jul 2020 15:32:15 +0200
Message-Id: <20200708133215.12532-1-maxime.chretien@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Chretien <maxime.chretien@bootlin.com>

On menu properties mouse events didn't do anything in search view
(listMode).

As there are no menus in listMode we can add an exception in tests to
always change the value on mouse events if we are in listMode.

Signed-off-by: Maxime Chretien <maxime.chretien@bootlin.com>
---
 scripts/kconfig/qconf.cc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c0ac8f7b5f1a..53864e02d14b 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -802,7 +802,8 @@ void ConfigList::mouseReleaseEvent(QMouseEvent* e)
 					break;
 				ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
 				if (ptype == P_MENU && rootEntry != menu &&
-				    mode != fullMode && mode != menuMode)
+				    mode != fullMode && mode != menuMode &&
+                                    mode != listMode)
 					emit menuSelected(menu);
 				else
 					changeValue(item);
@@ -852,7 +853,7 @@ void ConfigList::mouseDoubleClickEvent(QMouseEvent* e)
 	if (!menu)
 		goto skip;
 	ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
-	if (ptype == P_MENU) {
+	if (ptype == P_MENU && mode != listMode) {
 		if (mode == singleMode)
 			emit itemSelected(menu);
 		else if (mode == symbolMode)
-- 
2.27.0
