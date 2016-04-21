Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34296 "EHLO
	mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751485AbcDUUIK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Apr 2016 16:08:10 -0400
From: Felipe Balbi <balbif@gmail.com>
Subject: [PATCH] scripts: kconfig: implement a sort method
Date: Thu, 21 Apr 2016 23:07:59 +0300
Message-Id: <1461269279-11525-1-git-send-email-felipe.balbi@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, balbi@kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>

With a growing amount of Kernel configuration, it's
getting ever more difficult to find anything on
menuconfig. Because of that, implement mergesort for
kconfig to make it a little easier for anybody
building kernels.

Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
---

let me know if you folks prefer to turn this into
default behavior and drop the extra Sort button, I
didn't wanna be too disruptive by default and, at
least for now, kept Kconfig as it is and require
user to either press '.' or move cursor to the Sort
button and hit ENTER.

Anyway, give it a go and let me know if anybody sees
any issues which I might have missed.

 scripts/kconfig/lxdialog/menubox.c | 18 +++++----
 scripts/kconfig/mconf.c            | 83 +++++++++++++++++++++++++++++++++++---
 2 files changed, 89 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
index 11ae9ad7ac7b..d6cc04db6e60 100644
--- a/scripts/kconfig/lxdialog/menubox.c
+++ b/scripts/kconfig/lxdialog/menubox.c
@@ -162,6 +162,7 @@ static void print_buttons(WINDOW * win, int height, int width, int selected)
 	print_button(win, gettext(" Help "), y, x + 24, selected == 2);
 	print_button(win, gettext(" Save "), y, x + 36, selected == 3);
 	print_button(win, gettext(" Load "), y, x + 48, selected == 4);
+	print_button(win, gettext(" Sort "), y, x + 60, selected == 5);
 
 	wmove(win, y, x + 1 + 12 * selected);
 	wrefresh(win);
@@ -375,7 +376,7 @@ do_resize:
 		case TAB:
 		case KEY_RIGHT:
 			button = ((key == KEY_LEFT ? --button : ++button) < 0)
-			    ? 4 : (button > 4 ? 0 : button);
+			    ? 5 : (button > 5 ? 0 : button);
 
 			print_buttons(dialog, height, width, button);
 			wrefresh(menu);
@@ -390,6 +391,7 @@ do_resize:
 		case '?':
 		case 'z':
 		case '\n':
+		case '.':
 			/* save scroll info */
 			*s_scroll = scroll;
 			delwin(menu);
@@ -400,19 +402,21 @@ do_resize:
 			case 'h':
 			case '?':
 				return 2;
+			case '.':
+				return 5;
 			case 's':
 			case 'y':
-				return 5;
-			case 'n':
 				return 6;
-			case 'm':
+			case 'n':
 				return 7;
-			case ' ':
+			case 'm':
 				return 8;
-			case '/':
+			case ' ':
 				return 9;
-			case 'z':
+			case '/':
 				return 10;
+			case 'z':
+				return 11;
 			case '\n':
 				return button;
 			}
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 315ce2c7cb9d..c4a2eb561be4 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -642,6 +642,75 @@ conf_childs:
 	indent -= doint;
 }
 
+static int less(struct menu *a, struct menu *b)
+{
+	const char *s1 = _(menu_get_prompt(a));
+	const char *s2 = _(menu_get_prompt(b));
+
+	if (!s1)
+		return 1;
+
+	if (!s2)
+		return 0;
+
+	return strcmp(s1, s2) < 0;
+}
+
+static struct menu *merge(struct menu *a, struct menu *b)
+{
+	struct menu head;
+	struct menu *c = &head;
+
+	while (a && b) {
+		if (less(a, b)) {
+			c->next = a;
+			c = a;
+			a = a->next;
+		} else {
+			c->next = b;
+			c = b;
+			b = b->next;
+		}
+	}
+
+	c->next = a ? a : b;
+
+	return head.next;
+}
+
+static struct menu *mergesort(struct menu *c)
+{
+	struct menu *a;
+	struct menu *b;
+
+	if (!c)
+		return c;
+
+	if (c->list)
+		c->list =  mergesort(c->list);
+
+	if (!c->next)
+		return c;
+
+	a = c;
+	b = c->next;
+
+	while (b && b->next) {
+		c = c->next;
+		b = b->next->next;
+	}
+
+	b = c->next;
+	c->next = NULL;
+
+	return merge(mergesort(a), mergesort(b));
+}
+
+static struct menu *sort_conf(void)
+{
+	return mergesort(&rootmenu);
+}
+
 static void conf(struct menu *menu, struct menu *active_menu)
 {
 	struct menu *submenu;
@@ -668,6 +737,7 @@ static void conf(struct menu *menu, struct menu *active_menu)
 		res = dialog_menu(prompt ? _(prompt) : _("Main Menu"),
 				  _(menu_instructions),
 				  active_menu, &s_scroll);
+
 		if (res == 1 || res == KEY_ESC || res == -ERRDISPLAYTOOSMALL)
 			break;
 		if (item_count() != 0) {
@@ -720,6 +790,9 @@ static void conf(struct menu *menu, struct menu *active_menu)
 			conf_load();
 			break;
 		case 5:
+			sort_conf();
+			break;
+		case 6:
 			if (item_is_tag('t')) {
 				if (sym_set_tristate_value(sym, yes))
 					break;
@@ -727,24 +800,24 @@ static void conf(struct menu *menu, struct menu *active_menu)
 					show_textbox(NULL, setmod_text, 6, 74);
 			}
 			break;
-		case 6:
+		case 7:
 			if (item_is_tag('t'))
 				sym_set_tristate_value(sym, no);
 			break;
-		case 7:
+		case 8:
 			if (item_is_tag('t'))
 				sym_set_tristate_value(sym, mod);
 			break;
-		case 8:
+		case 9:
 			if (item_is_tag('t'))
 				sym_toggle_tristate_value(sym);
 			else if (item_is_tag('m'))
 				conf(submenu, NULL);
 			break;
-		case 9:
+		case 10:
 			search_conf();
 			break;
-		case 10:
+		case 11:
 			show_all_options = !show_all_options;
 			break;
 		}
-- 
2.7.0

