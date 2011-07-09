Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wnohang.net ([178.79.154.173]:58304 "EHLO mail.wnohang.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753351Ab1GIQcb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 9 Jul 2011 12:32:31 -0400
Date: Sat, 9 Jul 2011 21:54:49 +0530
From: Raghavendra D Prabhu <rprabhu@wnohang.net>
Subject: [PATCH] Avoid Wunused-but-set warning
Message-ID: <da20dc5c4160ed9a3da52f60799a1e4369fe3f27.1310228130.git.rprabhu@wnohang.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nir Tzachar <nir.tzachar@gmail.com>, linux-kernel@vger.kernel.org

Hi,
     I am seeing Wunused-but-set warning while make nconfig.  Looks like
     active_menu is not used. Removing it fixes the warning.

Signed-off-by: Raghavendra D Prabhu <rprabhu@wnohang.net>
---
  scripts/kconfig/nconf.c |    2 --
  1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 488dd74..5dad8ae 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -1067,7 +1067,6 @@ static void conf(struct menu *menu)
  	struct menu *submenu = 0;
  	const char *prompt = menu_get_prompt(menu);
  	struct symbol *sym;
-	struct menu *active_menu = NULL;
  	int res;
  	int current_index = 0;
  	int last_top_row = 0;
@@ -1152,7 +1151,6 @@ static void conf(struct menu *menu)
  			continue;
  
  		submenu = (struct menu *) item_data();
-		active_menu = (struct menu *)item_data();
  		if (!submenu || !menu_is_visible(submenu))
  			continue;
  		if (submenu)
-- 
1.7.6

--------------------------
Raghavendra Prabhu
GPG Id : 0xD72BE977
Fingerprint: B93F EBCB 8E05 7039 CD3C A4B8 A616 DCA1 D72B E977
www: wnohang.net
