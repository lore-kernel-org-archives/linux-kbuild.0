Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.polytechnique.org ([129.104.30.34]:57282 "EHLO
        mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751662AbdCMTdv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Mar 2017 15:33:51 -0400
From: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Subject: [PATCH 1/1] gconfig: remove misleading parentheses around a condition
Date: Mon, 13 Mar 2017 20:33:41 +0100
Message-Id: <20170313193341.28696-1-nicolas.iooss_linux@m4x.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nicolas Iooss <nicolas.iooss_linux@m4x.org>

When building the kernel with clang, the compiler complains about the
presence of a condition inside two pairs of parentheses:

    scripts/kconfig/gconf.c:917:19: error: equality comparison with
    extraneous parentheses [-Werror,-Wparentheses-equality]
                    } else if ((col == COL_OPTION)) {
                                ~~~~^~~~~~~~~~~~~
    scripts/kconfig/gconf.c:917:19: note: remove extraneous parentheses
    around the comparison to silence this warning
                    } else if ((col == COL_OPTION)) {
                               ~    ^            ~
    scripts/kconfig/gconf.c:917:19: note: use '=' to turn this equality
    comparison into an assignment
                    } else if ((col == COL_OPTION)) {
                                    ^~
                                    =

Silence this warning by removing a level of parentheses.

Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
---
 scripts/kconfig/gconf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 26d208b435a0..cfddddb9c9d7 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -914,7 +914,7 @@ on_treeview2_button_press_event(GtkWidget * widget,
 			current = menu;
 			display_tree_part();
 			gtk_widget_set_sensitive(back_btn, TRUE);
-		} else if ((col == COL_OPTION)) {
+		} else if (col == COL_OPTION) {
 			toggle_sym_value(menu);
 			gtk_tree_view_expand_row(view, path, TRUE);
 		}
-- 
2.12.0

