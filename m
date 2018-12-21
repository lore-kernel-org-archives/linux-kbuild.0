Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:38268 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387773AbeLUId2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Dec 2018 03:33:28 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/5] kconfig: surround dbg_sym_flags with #ifdef DEBUG to fix gconf warning
Date: Fri, 21 Dec 2018 17:33:08 +0900
Message-Id: <1545381188-514-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1545381188-514-1-git-send-email-yamada.masahiro@socionext.com>
References: <1545381188-514-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Fix the following warning:

  no previous prototype for ‘dbg_sym_flags’ [-Wmissing-prototypes]

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/gconf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index b3d438c..5d4ecf3 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -75,7 +75,7 @@ static gchar **fill_row(struct menu *menu);
 static void conf_changed(void);
 
 /* Helping/Debugging Functions */
-
+#ifdef DEBUG
 static const char *dbg_sym_flags(int val)
 {
 	static char buf[256];
@@ -105,6 +105,7 @@ static const char *dbg_sym_flags(int val)
 
 	return buf;
 }
+#endif
 
 static void replace_button_icon(GladeXML *xml, GdkDrawable *window,
 				GtkStyle *style, gchar *btn_name, gchar **xpm)
-- 
2.7.4
