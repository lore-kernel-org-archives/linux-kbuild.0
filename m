Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:51492 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759919AbbBINMX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Feb 2015 08:12:23 -0500
From: Alexander Kuleshov <kuleshovmail@gmail.com>
Subject: [PATCH] menuconfig: Search from everywhere
Date: Mon,  9 Feb 2015 19:12:12 +0600
Message-Id: <1423487532-27968-1-git-send-email-kuleshovmail@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Alexander Kuleshov <kuleshovmail@gmail.com>

If we want to see search window again, for example after typo
or for another search, we need to press on '< Exit >' and than
execute new search. Let's make '/' active everywhere.

Signed-off-by: Alexander Kuleshov <kuleshovmail@gmail.com>
---
 scripts/kconfig/lxdialog/textbox.c | 4 ++++
 scripts/kconfig/mconf.c            | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/scripts/kconfig/lxdialog/textbox.c b/scripts/kconfig/lxdialog/textbox.c
index 1773319..958770d 100644
--- a/scripts/kconfig/lxdialog/textbox.c
+++ b/scripts/kconfig/lxdialog/textbox.c
@@ -141,6 +141,10 @@ do_resize:
 	while (!done) {
 		key = wgetch(dialog);
 		switch (key) {
+		case '/':
+			key = 9;
+			done = true;
+			break;
 		case 'E':	/* Exit */
 		case 'e':
 		case 'X':
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 4dd3755..d49fa45 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -446,7 +446,15 @@ again:
 					str_get(&res), 0, 0, keys, &vscroll,
 					&hscroll, &update_text, (void *)
 					&data);
+		if (dres == 9) {
+			free(sym_arr);
+			str_free(&title);
+			list_del(trail.prev);
+			str_free(&sttext);
+			search_conf();
+			return;
+		}
+
 		again = false;
 		for (i = 0; i < JUMP_NB && keys[i]; i++)
 			if (dres == keys[i]) {
-- 
2.3.0

