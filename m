Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:48531 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPyI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:54:08 -0400
Received: by mail-gy0-f174.google.com with SMTP id 8so1615205gyd.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:54:07 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 10/15] kconfig: don't emit warning upon rootmenu's prompt redefinition
Date: Sat, 11 Sep 2010 11:51:17 -0400
Message-Id: <1284220282-3500-11-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

This silences the warning printed upon prompt redefinition for the rootmenu.
We will encounter this redefinition when a "mainmenu" statement is specified and
override the default prompt.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/menu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 64da30c..d629ffd 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -139,7 +139,7 @@ struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *e
 			while (isspace(*prompt))
 				prompt++;
 		}
-		if (current_entry->prompt)
+		if (current_entry->prompt && current_entry != &rootmenu)
 			prop_warn(prop, "prompt redefined");
 		current_entry->prompt = prop;
 	}
-- 
1.7.2.30.gc37d7.dirty

