Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:40329 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754691Ab2GXOXh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Jul 2012 10:23:37 -0400
From: Benjamin Poirier <bpoirier@suse.de>
Subject: [PATCH] menuconfig: make keys u/d move to the previous/next dialog page
Date: Tue, 24 Jul 2012 10:23:03 -0400
Message-Id: <1343139783-22776-1-git-send-email-bpoirier@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Lucas De Marchi <lucas.demarchi@profusion.mobi>, Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

... just like less(1) for example.

Signed-off-by: Benjamin Poirier <bpoirier@suse.de>
---
 scripts/kconfig/lxdialog/textbox.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/lxdialog/textbox.c b/scripts/kconfig/lxdialog/textbox.c
index 154c2dd..805200f 100644
--- a/scripts/kconfig/lxdialog/textbox.c
+++ b/scripts/kconfig/lxdialog/textbox.c
@@ -190,6 +190,7 @@ do_resize:
 			break;
 		case 'B':	/* Previous page */
 		case 'b':
+		case 'u':
 		case KEY_PPAGE:
 			if (begin_reached)
 				break;
@@ -214,6 +215,7 @@ do_resize:
 			break;
 		case KEY_NPAGE:	/* Next page */
 		case ' ':
+		case 'd':
 			if (end_reached)
 				break;
 
-- 
1.7.7

