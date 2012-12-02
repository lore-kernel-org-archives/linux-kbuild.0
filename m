Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:33726 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753528Ab2LBQev (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 2 Dec 2012 11:34:51 -0500
Date: Mon, 3 Dec 2012 00:35:09 +0800
From: Wang YanQing <udknight@gmail.com>
Subject: [PATCH] lxdialog:inputbox: Fix can't change selected button with
 Left/Right when input box selected
Message-ID: <20121202163509.GB20796@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, rdunlap@xenotime.net, bp@alien8.de, yann.morin.1998@free.fr, sakiwit@gmail.com, lacombar@gmail.com, lucas.demarchi@profusion.mobi, dave@gnu.org, paul.gortmaker@windriver.com, crquan@gmail.com, bpoirier@suse.de

inputbox code don't support use Left/Right to change input
position in the input box, so it use continue to skip them
when input key is Left/Right, but use break for Up/Down, so
we can change selected button with Up/Down but we can't do it
with Left/Right key when input box selected.

This patch fix it.

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 scripts/kconfig/lxdialog/inputbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index dd8e587..7841f46 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -120,11 +120,9 @@ do_resize:
 			case TAB:
 			case KEY_UP:
 			case KEY_DOWN:
-				break;
 			case KEY_LEFT:
-				continue;
 			case KEY_RIGHT:
-				continue;
+				break;
 			case KEY_BACKSPACE:
 			case 127:
 				if (input_x || scroll) {
-- 
1.7.11.1.116.g8228a23
