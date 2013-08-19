Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ea0-f169.google.com ([209.85.215.169]:51836 "EHLO
	mail-ea0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751101Ab3HSObB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 19 Aug 2013 10:31:01 -0400
Received: by mail-ea0-f169.google.com with SMTP id k11so891459eaj.0
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Aug 2013 07:31:00 -0700 (PDT)
From: David Graeff <david.graeff@web.de>
Subject: [PATCH v3 5/5] kconfig: images.c for gtk/qt gui flavour reoganized
Date: Mon, 19 Aug 2013 16:29:51 +0200
Message-Id: <1376922591-37504-6-git-send-email-david.graeff@web.de>
In-Reply-To: <1376922591-37504-1-git-send-email-david.graeff@web.de>
References: <1376922591-37504-1-git-send-email-david.graeff@web.de>
In-Reply-To: <kconfig-port-gtk-qt>
References: <kconfig-port-gtk-qt>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: David Graeff <david.graeff@web.de>, yann.morin.1998@free.fr, sam@ravnborg.org, mmarek@suse.cz

Change order of xpm image constants to build up groups.
Make those groups optional via ifdefs.
Remove not used constants.

Signed-off-by: David Graeff <david.graeff@web.de>

diff --git a/scripts/kconfig/images.c b/scripts/kconfig/images.c
index d4f84bd..196e6c0 100644
--- a/scripts/kconfig/images.c
+++ b/scripts/kconfig/images.c
@@ -3,94 +3,7 @@
  * Released under the terms of the GNU GPL v2.0.
  */
 
-static const char *xpm_load[] = {
-"22 22 5 1",
-". c None",
-"# c #000000",
-"c c #838100",
-"a c #ffff00",
-"b c #ffffff",
-"......................",
-"......................",
-"......................",
-"............####....#.",
-"...........#....##.##.",
-"..................###.",
-".................####.",
-".####...........#####.",
-"#abab##########.......",
-"#babababababab#.......",
-"#ababababababa#.......",
-"#babababababab#.......",
-"#ababab###############",
-"#babab##cccccccccccc##",
-"#abab##cccccccccccc##.",
-"#bab##cccccccccccc##..",
-"#ab##cccccccccccc##...",
-"#b##cccccccccccc##....",
-"###cccccccccccc##.....",
-"##cccccccccccc##......",
-"###############.......",
-"......................"};
-
-static const char *xpm_save[] = {
-"22 22 5 1",
-". c None",
-"# c #000000",
-"a c #838100",
-"b c #c5c2c5",
-"c c #cdb6d5",
-"......................",
-".####################.",
-".#aa#bbbbbbbbbbbb#bb#.",
-".#aa#bbbbbbbbbbbb#bb#.",
-".#aa#bbbbbbbbbcbb####.",
-".#aa#bbbccbbbbbbb#aa#.",
-".#aa#bbbccbbbbbbb#aa#.",
-".#aa#bbbbbbbbbbbb#aa#.",
-".#aa#bbbbbbbbbbbb#aa#.",
-".#aa#bbbbbbbbbbbb#aa#.",
-".#aa#bbbbbbbbbbbb#aa#.",
-".#aaa############aaa#.",
-".#aaaaaaaaaaaaaaaaaa#.",
-".#aaaaaaaaaaaaaaaaaa#.",
-".#aaa#############aa#.",
-".#aaa#########bbb#aa#.",
-".#aaa#########bbb#aa#.",
-".#aaa#########bbb#aa#.",
-".#aaa#########bbb#aa#.",
-".#aaa#########bbb#aa#.",
-"..##################..",
-"......................"};
-
-static const char *xpm_back[] = {
-"22 22 3 1",
-". c None",
-"# c #000083",
-"a c #838183",
-"......................",
-"......................",
-"......................",
-"......................",
-"......................",
-"...........######a....",
-"..#......##########...",
-"..##...####......##a..",
-"..###.###.........##..",
-"..######..........##..",
-"..#####...........##..",
-"..######..........##..",
-"..#######.........##..",
-"..########.......##a..",
-"...............a###...",
-"...............###....",
-"......................",
-"......................",
-"......................",
-"......................",
-"......................",
-"......................"};
-
+#ifdef IMAGES_TOOLBAR
 static const char *xpm_tree_view[] = {
 "22 22 2 1",
 ". c None",
@@ -171,90 +84,24 @@ static const char *xpm_split_view[] = {
 "......#......#........",
 "......................",
 "......................"};
+#endif
 
-static const char *xpm_symbol_no[] = {
+#ifdef IMAGES_TREEVIEW
+static const char *xpm_void[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
 "            ",
-" .......... ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .......... ",
-"            "};
-
-static const char *xpm_symbol_mod[] = {
-"12 12 2 1",
-"  c white",
-". c black",
 "            ",
-" .......... ",
-" .        . ",
-" .        . ",
-" .   ..   . ",
-" .  ....  . ",
-" .  ....  . ",
-" .   ..   . ",
-" .        . ",
-" .        . ",
-" .......... ",
-"            "};
-
-static const char *xpm_symbol_yes[] = {
-"12 12 2 1",
-"  c white",
-". c black",
 "            ",
-" .......... ",
-" .        . ",
-" .        . ",
-" .      . . ",
-" .     .. . ",
-" . .  ..  . ",
-" . ....   . ",
-" .  ..    . ",
-" .        . ",
-" .......... ",
-"            "};
-
-static const char *xpm_choice_no[] = {
-"12 12 2 1",
-"  c white",
-". c black",
 "            ",
-"    ....    ",
-"  ..    ..  ",
-"  .      .  ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .        . ",
-"  .      .  ",
-"  ..    ..  ",
-"    ....    ",
-"            "};
-
-static const char *xpm_choice_yes[] = {
-"12 12 2 1",
-"  c white",
-". c black",
 "            ",
-"    ....    ",
-"  ..    ..  ",
-"  .      .  ",
-" .   ..   . ",
-" .  ....  . ",
-" .  ....  . ",
-" .   ..   . ",
-"  .      .  ",
-"  ..    ..  ",
-"    ....    ",
+"            ",
+"            ",
+"            ",
+"            ",
+"            ",
+"            ",
 "            "};
 
 static const char *xpm_menu[] = {
@@ -273,54 +120,4 @@ static const char *xpm_menu[] = {
 " .        . ",
 " .......... ",
 "            "};
-
-static const char *xpm_menu_inv[] = {
-"12 12 2 1",
-"  c white",
-". c black",
-"            ",
-" .......... ",
-" .......... ",
-" ..  ...... ",
-" ..    .... ",
-" ..      .. ",
-" ..      .. ",
-" ..    .... ",
-" ..  ...... ",
-" .......... ",
-" .......... ",
-"            "};
-
-static const char *xpm_menuback[] = {
-"12 12 2 1",
-"  c white",
-". c black",
-"            ",
-" .......... ",
-" .        . ",
-" .     .. . ",
-" .   .... . ",
-" . ...... . ",
-" . ...... . ",
-" .   .... . ",
-" .     .. . ",
-" .        . ",
-" .......... ",
-"            "};
-
-static const char *xpm_void[] = {
-"12 12 2 1",
-"  c white",
-". c black",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            "};
+#endif
-- 
1.8.1.2

