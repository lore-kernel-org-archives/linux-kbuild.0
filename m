Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa7109mr002.acs-inc.com ([63.101.151.11]:56609 "EHLO
	USA7109MR002.ACS-INC.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751122AbaFDVwL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Jun 2014 17:52:11 -0400
Message-Id: <201406042142.s54LgTXP023690@pogo.cesa.opbu.xerox.com>
From: Andrew Klossner <Andrew.Klossner@3dsystems.com>
Date: Wed, 4 Jun 2014 12:54:32 -0700
Subject: [PATCH] kconfig/mconf: fix handling of BACKSPACE key
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>

Some ancient terminals send control-H (decimal 8) when the BACKSPACE key is
pressed.  In "make menuconfig", an input box discards the keystroke.  Change
it to treat BACKSPACE in the same way as the DELETE key (or, as old-timers
call it, the RUBOUT key.)

Signed-off-by: Andrew Klossner <Andrew.Klossner@3dsystems.com>
---
 scripts/kconfig/lxdialog/inputbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index 447a582..60cddd2 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -127,6 +127,7 @@ do_resize:
 				break;
 			case KEY_BACKSPACE:
 			case 127:
+			case 8: /* Backspace on old terminals sends control-H */
 				if (pos) {
 					wattrset(dialog, dlg.inputbox.atr);
 					if (input_x == 0) {
-- 
1.9.2



