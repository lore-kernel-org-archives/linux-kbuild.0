Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45492 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfDXMDE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Apr 2019 08:03:04 -0400
From: Alexander Popov <alex.popov@linux.com>
Subject: [v2 1/1] kconfig: Terminate menu blocks with a comment in the generated config
Date: Wed, 24 Apr 2019 15:02:49 +0300
Message-Id: <1556107369-7655-1-git-send-email-alex.popov@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Popov <alex.popov@linux.com>

Currently menu blocks start with a pretty header but end with nothing in
the generated config. So next config options stick together with the
options from the menu block.

Let's terminate menu blocks in the generated config with a comment and
a newline if needed. Example:

...
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=y
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

CONFIG_HAMRADIO=y
...

Signed-off-by: Alexander Popov <alex.popov@linux.com>
---
 scripts/kconfig/confdata.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 08ba146..486b4c7 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -819,6 +819,7 @@ int conf_write(const char *name)
 	struct menu *menu;
 	const char *basename;
 	const char *str;
+	bool need_newline = false;
 	char dirname[PATH_MAX+1], tmpname[PATH_MAX+22], newname[PATH_MAX+8];
 	char *env;
 
@@ -871,12 +872,16 @@ int conf_write(const char *name)
 				     "#\n"
 				     "# %s\n"
 				     "#\n", str);
+			need_newline = false;
 		} else if (!(sym->flags & SYMBOL_CHOICE)) {
 			sym_calc_value(sym);
 			if (!(sym->flags & SYMBOL_WRITE))
 				goto next;
+			if (need_newline) {
+				fprintf(out, "\n");
+				need_newline = false;
+			}
 			sym->flags &= ~SYMBOL_WRITE;
-
 			conf_write_symbol(out, sym, &kconfig_printer_cb, NULL);
 		}
 
@@ -888,6 +893,11 @@ int conf_write(const char *name)
 		if (menu->next)
 			menu = menu->next;
 		else while ((menu = menu->parent)) {
+			if (!menu->sym && menu_is_visible(menu)) {
+				str = menu_get_prompt(menu);
+				fprintf(out, "# end of %s\n", str);
+				need_newline = true;
+			}
 			if (menu->next) {
 				menu = menu->next;
 				break;
-- 
2.7.4
