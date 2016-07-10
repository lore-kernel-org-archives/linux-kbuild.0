Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34466 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757034AbcGJJQM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Jul 2016 05:16:12 -0400
From: Eugeniu Rosca <eugeniu.m.rosca@gmail.com>
Subject: [PATCH] kconfig: Fix menu/endmenu markers in zconfdump()
Date: Sun, 10 Jul 2016 11:15:23 +0200
Message-Id: <1468142123-13059-1-git-send-email-eugeniu.m.rosca@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Eugeniu Rosca <eugeniu.m.rosca@gmail.com>

Given a Kconfig.sample, implementing 2 empty and 2 non-empty menu
entries:

menu EMPTY_MENU
endmenu

menu NONEMPTY_MENU
config DUMMY_1
    bool "desc-1"
endmenu

menuconfig EMPTY_MENUCONFIG
    bool "desc-2"

menuconfig NONEMPTY_MENUCONFIG
    bool "desc-3"

if NONEMPTY_MENUCONFIG
config DUMMY_2
    bool "desc-4"
endif

The following can be observed (prerequisite: uncomment zconfdump()
in scripts/kconfig/conf.c):
> make KBUILD_KCONFIG=Kconfig.sample allnoconfig | grep -cw menu
> 4
> make KBUILD_KCONFIG=Kconfig.sample allnoconfig | grep -cw endmenu
> 3

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
 scripts/kconfig/zconf.tab.c_shipped | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/zconf.tab.c_shipped b/scripts/kconfig/zconf.tab.c_shipped
index 7a4d658..727b7dd 100644
--- a/scripts/kconfig/zconf.tab.c_shipped
+++ b/scripts/kconfig/zconf.tab.c_shipped
@@ -2510,6 +2510,8 @@ static void print_symbol(FILE *out, struct menu *menu)
 			fputs( "  menu ", out);
 			print_quoted_string(out, prop->text);
 			fputc('\n', out);
+			if (!menu->list)
+				fputs("endmenu\n", out);
 			break;
 		default:
 			fprintf(out, "  unknown prop %d!\n", prop->type);
@@ -2530,7 +2532,7 @@ void zconfdump(FILE *out)
 	struct symbol *sym;
 	struct menu *menu;
 
-	menu = rootmenu.list;
+	menu = &rootmenu;
 	while (menu) {
 		if ((sym = menu->sym))
 			print_symbol(out, menu);
@@ -2545,6 +2547,8 @@ void zconfdump(FILE *out)
 				fputs("\nmenu ", out);
 				print_quoted_string(out, prop->text);
 				fputs("\n", out);
+				if (!menu->list)
+					fputs("endmenu\n", out);
 				break;
 			default:
 				;
-- 
2.7.4

