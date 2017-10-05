Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:56013 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751255AbdJEDHB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 23:07:01 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH] kconfig: Sync zconf.y with zconf.tab.c_shipped
Date: Thu,  5 Oct 2017 05:06:48 +0200
Message-Id: <1507172808-12246-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: mmarek@suse.com, yamada.masahiro@socionext.com, lacombar@gmail.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

Looks like a change to a comment in zconf.y was never committed, because
the updated version only appears it zconf.tab.c_shipped. Update the
comment in zconf.y to match.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/zconf.y | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index c8f396c..4b2cf41 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -101,7 +101,7 @@ static struct menu *current_menu, *current_entry;
 } if_entry menu_entry choice_entry
 
 %{
-/* Include zconf_id.c here so it can see the token constants. */
+/* Include kconf_id.c here so it can see the token constants. */
 #include "kconf_id.c"
 %}
 
-- 
2.7.4

