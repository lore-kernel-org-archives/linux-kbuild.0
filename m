Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:53064 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPyB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:54:01 -0400
Received: by mail-gw0-f46.google.com with SMTP id 17so1555732gwj.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:54:01 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 06/15] kconfig: implement the `mainmenu' directive
Date: Sat, 11 Sep 2010 11:51:13 -0400
Message-Id: <1284220282-3500-7-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

If specified, the directive must be placed at the top of the Kconfig file.

We need to change the grammar to make the mainmenu directive set the
`rootmenu' prompt. This reflect how menu_add_prompt() works internally, ie.
set the prompt of the `current_entry', pointing originally to `rootmenu'.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 Documentation/kbuild/kconfig-language.txt |    3 ++-
 scripts/kconfig/zconf.y                   |   14 +++++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index b472e4e..2fe93ca 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -322,7 +322,8 @@ mainmenu:
 	"mainmenu" <prompt>
 
 This sets the config program's title bar if the config program chooses
-to use it.
+to use it. It should be placed at the top of the configuration, before any
+other statement.
 
 
 Kconfig hints
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 23dfd3b..e9b14efd 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -36,7 +36,7 @@ static struct menu *current_menu, *current_entry;
 #define YYERROR_VERBOSE
 #endif
 %}
-%expect 26
+%expect 28
 
 %union
 {
@@ -104,14 +104,15 @@ static struct menu *current_menu, *current_entry;
 %}
 
 %%
-input: stmt_list;
+input: nl start | start;
+
+start: mainmenu_stmt stmt_list | stmt_list;
 
 stmt_list:
 	  /* empty */
 	| stmt_list common_stmt
 	| stmt_list choice_stmt
 	| stmt_list menu_stmt
-	| stmt_list T_MAINMENU prompt nl
 	| stmt_list end			{ zconf_error("unexpected end statement"); }
 	| stmt_list T_WORD error T_EOL	{ zconf_error("unknown statement \"%s\"", $2); }
 	| stmt_list option_name error T_EOL
@@ -342,6 +343,13 @@ if_block:
 	| if_block choice_stmt
 ;
 
+/* mainmenu entry */
+
+mainmenu_stmt: T_MAINMENU prompt nl
+{
+	menu_add_prompt(P_MENU, $2, NULL);
+};
+
 /* menu entry */
 
 menu: T_MENU prompt T_EOL
-- 
1.7.2.30.gc37d7.dirty

