Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:53912 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752741AbZGLIM3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Jul 2009 04:12:29 -0400
From: Cheng Renquan <crq@kernel.org>
Subject: [PATCH 5/6] make use of menu_get_ext_help in qconfig
Date: Sun, 12 Jul 2009 16:11:47 +0800
Message-Id: <1247386308-19628-6-git-send-email-crq@kernel.org>
In-Reply-To: <1247386308-19628-5-git-send-email-crq@kernel.org>
References: <1247386308-19628-1-git-send-email-crq@kernel.org>
 <1247386308-19628-2-git-send-email-crq@kernel.org>
 <1247386308-19628-3-git-send-email-crq@kernel.org>
 <1247386308-19628-4-git-send-email-crq@kernel.org>
 <1247386308-19628-5-git-send-email-crq@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, crquan@gmail.com

From: Cheng Renquan <crquan@gmail.com>

Signed-off-by: Cheng Renquan <crquan@gmail.com>
---
 scripts/kconfig/qconf.cc |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index ce7d508..00c5150 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1042,12 +1042,10 @@ void ConfigInfoView::menuInfo(void)
 		if (showDebug())
 			debug = debug_info(sym);
 
-		help = menu_get_help(menu);
-		/* Gettextize if the help text not empty */
-		if (help.isEmpty())
-			help = print_filter(menu_get_help(menu));
-		else
-			help = print_filter(_(menu_get_help(menu)));
+		struct gstr help_gstr = str_new();
+		menu_get_ext_help(menu, &help_gstr);
+		help = print_filter(str_get(&help_gstr));
+		str_free(&help_gstr);
 	} else if (menu->prompt) {
 		head += "<big><b>";
 		head += print_filter(_(menu->prompt->text));
-- 
1.6.3.3

