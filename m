Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:35066 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751168AbcGaUuo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 31 Jul 2016 16:50:44 -0400
Received: by mail-wm0-f52.google.com with SMTP id f65so347626055wmi.0
        for <linux-kbuild@vger.kernel.org>; Sun, 31 Jul 2016 13:48:59 -0700 (PDT)
Date: Sun, 31 Jul 2016 22:48:56 +0200
From: Eugeniu Rosca <eugeniu.m.rosca@gmail.com>
Subject: [PATCH v2] kconfig: Fix menu/endmenu markers in zconfdump()
Message-ID: <20160731204856.GA16477@eugeniu-X230>
References: <1468142123-13059-1-git-send-email-eugeniu.m.rosca@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <1468142123-13059-1-git-send-email-eugeniu.m.rosca@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: eugeniu.m.rosca@gmail.com


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


--d6Gm4EdcadzBjdND
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: inline; filename="v2-0001-kconfig-Fix-menu-endmenu-markers-in-zconfdump.patch"

From 4af7b7801e2d7dffd8f943b03415659e42766610 Mon Sep 17 00:00:00 2001
From: Eugeniu Rosca <eugeniu.m.rosca@gmail.com>
Date: Sun, 10 Jul 2016 10:03:53 +0200
Subject: [PATCH v2] kconfig: Fix menu/endmenu markers in zconfdump()

Given a Kconfig.sample, implementing 2 empty and 2 non-empty menu
entries:

menu EMPTY_MENU
endmenu

menu NONEMPTY_MENU
config C1
    prompt "C1"
endmenu

menuconfig EMPTY_MENUCONFIG
    prompt "M1"

menuconfig NONEMPTY_MENUCONFIG
    prompt "M2"

if NONEMPTY_MENUCONFIG
config C2
    prompt "C2"
endif

The following can be observed (prerequisite: uncomment zconfdump()
in scripts/kconfig/conf.c):
$ make KBUILD_KCONFIG=Kconfig.sample allnoconfig | grep -cw menu
$ 4
$ make KBUILD_KCONFIG=Kconfig.sample allnoconfig | grep -cw endmenu
$ 3

It looks like zconfdump() has the following inconsistencies:
A. It prints the start marker 'menu' both for empty and non-empty menu
   entries, while printing the end marker 'endmenu' only for non-empty
   menu entries.
B. At the end of every dump, it prints the end marker of the root
   menu, while skipping its start marker, so that even if (A) is fixed,
   the number of start and end markers is still not equal.

Fix (A) and (B).

Signed-off-by: Eugeniu Rosca <eugeniu.m.rosca@gmail.com>
---

 This is the second attempt to correct one of the zconfdump misbehaviors
 regarding "menu" and "endmenu" markers. Without this patch, it is
 practically impossible to import the kconfig symbol database into some
 3rd party program or script, as the 3rd party tool would rely on the
 menu/endmenu keywords to identify the borders between menu entries.
 With wrong information about menu borders, no correct connection can
 be established between config symbols and their parent menu entries.

 Changes from v1:
 - Made sure "endmenu" is printed at the end of all menu properties.

 scripts/kconfig/zconf.tab.c_shipped | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/zconf.tab.c_shipped b/scripts/kconfig/zconf.tab.c_shipped
index 7a4d658..c77a20a 100644
--- a/scripts/kconfig/zconf.tab.c_shipped
+++ b/scripts/kconfig/zconf.tab.c_shipped
@@ -2446,6 +2446,7 @@ static void print_symbol(FILE *out, struct menu *menu)
 {
 	struct symbol *sym = menu->sym;
 	struct property *prop;
+	bool empty_menuconfig = false;
 
 	if (sym_is_choice(sym))
 		fprintf(out, "\nchoice\n");
@@ -2510,6 +2511,8 @@ static void print_symbol(FILE *out, struct menu *menu)
 			fputs( "  menu ", out);
 			print_quoted_string(out, prop->text);
 			fputc('\n', out);
+			if (!menu->list)
+				empty_menuconfig = true;
 			break;
 		default:
 			fprintf(out, "  unknown prop %d!\n", prop->type);
@@ -2522,6 +2525,9 @@ static void print_symbol(FILE *out, struct menu *menu)
 			menu->help[len] = 0;
 		fprintf(out, "  help\n%s\n", menu->help);
 	}
+	if (empty_menuconfig)
+		fputs("\nendmenu\n", out);
+
 }
 
 void zconfdump(FILE *out)
@@ -2530,7 +2536,7 @@ void zconfdump(FILE *out)
 	struct symbol *sym;
 	struct menu *menu;
 
-	menu = rootmenu.list;
+	menu = &rootmenu;
 	while (menu) {
 		if ((sym = menu->sym))
 			print_symbol(out, menu);
@@ -2554,6 +2560,8 @@ void zconfdump(FILE *out)
 				expr_fprint(prop->visible.expr, out);
 				fputc('\n', out);
 			}
+			if ((prop->type == P_MENU) && !menu->list)
+				fputs("endmenu\n", out);
 		}
 
 		if (menu->list)
-- 
2.9.2


--d6Gm4EdcadzBjdND--
