Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:58418 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751803Ab3J3Vq3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Oct 2013 17:46:29 -0400
Received: by mail-we0-f180.google.com with SMTP id q59so1885375wes.39
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2013 14:46:28 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 4/7] kconfig: adjust warning message for conflicting types
Date: Wed, 30 Oct 2013 22:46:17 +0100
Message-Id: <57540f1dea6580fda0debaf3704d1b0e928a120e.1383168460.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1383168460.git.yann.morin.1998@free.fr>
References: <cover.1383168460.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Martin Walch <walch.martin@web.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: Martin Walch <walch.martin@web.de>

Each symbol must have exactly one type assigned. However, if a symbol happens
to have two different types assigned at runtime, a warning is printed and the
first type is preserved while the second type is being ignored.

The warning message says

type of <symbol name> redefined from <first type> to <second type>

which may be misleading as it may create the impression that the second type
replaces the first type.

This patch clarifies this by changing the warning to

ignoring type redefinition of <symbol name> from <first type> to <second type>

Signed-off-by: Martin Walch <walch.martin@web.de>
Acked-by: Wang YanQing <udknight@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/menu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b970101..9e69f19 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -119,9 +119,10 @@ void menu_set_type(int type)
 		sym->type = type;
 		return;
 	}
-	menu_warn(current_entry, "type of '%s' redefined from '%s' to '%s'",
-	    sym->name ? sym->name : "<choice>",
-	    sym_type_name(sym->type), sym_type_name(type));
+	menu_warn(current_entry,
+		"ignoring type redefinition of '%s' from '%s' to '%s'",
+		sym->name ? sym->name : "<choice>",
+		sym_type_name(sym->type), sym_type_name(type));
 }
 
 struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *expr, struct expr *dep)
-- 
1.8.1.2

