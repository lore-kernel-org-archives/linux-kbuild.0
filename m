Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42020 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbfEQTmv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 15:42:51 -0400
From: Alexander Popov <alex.popov@linux.com>
Subject: [v3 1/1] kconfig: Terminate menu blocks with a comment in the generated config
Date: Fri, 17 May 2019 22:42:22 +0300
Message-Id: <1558122142-10683-1-git-send-email-alex.popov@linux.com>
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

v3 changes:
 - rebase onto the recent rc;
 - don't print the end comment for the rootmenu to avoid breaking
   'make testconfig' (thanks to Masahiro Yamada).

---
 scripts/kconfig/confdata.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 492ac34..6006154 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -867,6 +867,7 @@ int conf_write(const char *name)
 	const char *str;
 	char tmpname[PATH_MAX + 1], oldname[PATH_MAX + 1];
 	char *env;
+	bool need_newline = false;
 
 	if (!name)
 		name = conf_get_configname();
@@ -912,12 +913,16 @@ int conf_write(const char *name)
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
 
@@ -929,6 +934,12 @@ int conf_write(const char *name)
 		if (menu->next)
 			menu = menu->next;
 		else while ((menu = menu->parent)) {
+			if (!menu->sym && menu_is_visible(menu) &&
+			    menu != &rootmenu) {
+				str = menu_get_prompt(menu);
+				fprintf(out, "# end of %s\n", str);
+				need_newline = true;
+			}
 			if (menu->next) {
 				menu = menu->next;
 				break;
-- 
2.7.4
