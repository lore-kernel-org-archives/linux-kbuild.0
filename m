Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f219.google.com ([209.85.218.219]:35075 "EHLO
	mail-bw0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753697AbZJ1XDr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2009 19:03:47 -0400
Received: by bwz19 with SMTP id 19so1587508bwz.28
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Oct 2009 16:03:51 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@gmx.net>
Subject: [remarks 2/4] menuconfig: allow editing of remarks for config symbols
Date: Wed, 28 Oct 2009 23:53:48 +0100
Message-Id: <4ae8cdd5.0d1abc0a.0bd6.3d1f@mx.google.com>
In-Reply-To: <b106dec1237ab723ae6a2404d42601bf20704bf3.1256767265.git.aragorn@Anduril.(none)>
References: <cover.1256767265.git.aragorn@Anduril.(none)>
 <b106dec1237ab723ae6a2404d42601bf20704bf3.1256767265.git.aragorn@Anduril.(none)>
In-Reply-To: <cover.1256767265.git.aragorn@Anduril.(none)>
References: <cover.1256767265.git.aragorn@Anduril.(none)>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, Bernhard Kaindl <bernhard.kaindl@gmx.net>

Extend menuconfig to allow editing of remarks for config symbols:

Add a new key to lxdialog (currently '<') which, when pressed,
is forwarded to menuconfig, which handles it similar to the
search key ('/') which can be used at any time, but passes the
currently selected menu entry to conf_remark()

conf_remark() is based on conf_string(), which allows to edit
a string, but before, it checks if the passed menu entry is a
config symbol, and if not it displays a short notice saying that
it currently does not support editing comments for a pure menu
entries without attached config symbol.

It then allows to edit a string, which is initialized from the
sym->remark entry and if the user changed the string, it updates
sym->remark and sets things up so that menuconfig asks to save
the config before exiting, so the changed remark is saved in
that go.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@gmx.net>
---
 scripts/kconfig/lxdialog/menubox.c |    3 ++
 scripts/kconfig/mconf.c            |   51 ++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
index fa9d633..6b6bc48 100644
--- a/scripts/kconfig/lxdialog/menubox.c
+++ b/scripts/kconfig/lxdialog/menubox.c
@@ -383,6 +383,7 @@ do_resize:
 		case 'n':
 		case 'm':
 		case '/':
+		case '<':
 			/* save scroll info */
 			*s_scroll = scroll;
 			delwin(menu);
@@ -402,6 +403,8 @@ do_resize:
 				return 6;
 			case '/':
 				return 7;
+			case '<':
+				return 8;
 			}
 			return 0;
 		case 'h':
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index d829535..50a9b10 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -276,6 +276,7 @@ static int single_menu_mode;
 static void conf(struct menu *menu);
 static void conf_choice(struct menu *menu);
 static void conf_string(struct menu *menu);
+static void conf_remark(struct menu *menu);
 static void conf_load(void);
 static void conf_save(void);
 static void show_textbox(const char *title, const char *text, int r, int c);
@@ -619,6 +620,9 @@ static void conf(struct menu *menu)
 		case 7:
 			search_conf();
 			break;
+		case 8:
+			conf_remark(submenu);
+			break;
 		}
 	}
 }
@@ -743,6 +747,53 @@ static void conf_string(struct menu *menu)
 	}
 }
 
+/**
+ * Based on conf_string(), this edits the remark for a config symbol
+ */
+static void conf_remark(struct menu *menu)
+{
+	const char *prompt = menu_get_prompt(menu);
+
+	if (!prompt || !menu->sym) {
+		show_textbox(NULL,
+			N_("Editing comments for menus without a config symbol\n"
+				"is currently not supported."), 6, 63);
+		return;
+	}
+
+	while (1) {
+		int res;
+		dialog_clear();
+		res = dialog_inputbox(prompt ? _(prompt) : _("Main Menu"),
+				      _("Edit the remark below"), 10, 75,
+				      menu->sym->remark);
+		switch (res) {
+		case 0:
+			if (!dialog_input_result[0] && !menu->sym->remark)
+				return;
+			if (menu->sym->remark) {
+				if (!strcmp(menu->sym->remark, dialog_input_result))
+					return;
+				free(menu->sym->remark);
+			}
+			if (dialog_input_result[0]) {
+				menu->sym->remark = strdup(dialog_input_result);
+			} else {
+				menu->sym->remark = NULL;
+			}
+			/* Write new .config{,-remarks} on exit: */
+			sym_add_change_count(1);
+			sym_clear_all_valid();
+			return;
+		case 1:
+			show_help(menu);
+			break;
+		case KEY_ESC:
+			return;
+		}
+	}
+}
+
 static void conf_load(void)
 {
 
-- 
1.6.0.4

