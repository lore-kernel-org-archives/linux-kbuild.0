Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:43637 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932176AbaFDHwt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Jun 2014 03:52:49 -0400
Received: by mail-pb0-f41.google.com with SMTP id uo5so6634702pbc.14
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Jun 2014 00:52:49 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/2] kconfig: lxdialog: fix spelling
Date: Wed,  4 Jun 2014 00:52:30 -0700
Message-Id: <1401868351-24014-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1401868351-24014-1-git-send-email-computersforpeace@gmail.com>
References: <1401868351-24014-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Brian Norris <computersforpeace@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org
---
 scripts/kconfig/lxdialog/dialog.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/lxdialog/dialog.h b/scripts/kconfig/lxdialog/dialog.h
index b4343d384926..fcffd5b41fb0 100644
--- a/scripts/kconfig/lxdialog/dialog.h
+++ b/scripts/kconfig/lxdialog/dialog.h
@@ -170,7 +170,7 @@ char item_tag(void);
 /* item list manipulation for lxdialog use */
 #define MAXITEMSTR 200
 struct dialog_item {
-	char str[MAXITEMSTR];	/* promtp displayed */
+	char str[MAXITEMSTR];	/* prompt displayed */
 	char tag;
 	void *data;	/* pointer to menu item - used by menubox+checklist */
 	int selected;	/* Set to 1 by dialog_*() function if selected. */
-- 
1.7.9.5

