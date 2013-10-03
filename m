Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:55092 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754531Ab3JCR0c (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Oct 2013 13:26:32 -0400
Received: from tacticalops.localnet ([95.112.171.46]) by smtp.web.de
 (mrweb102) with ESMTPSA (Nemesis) id 0LnBDd-1W1gOB0EI9-00hN2w for
 <linux-kbuild@vger.kernel.org>; Thu, 03 Oct 2013 19:26:31 +0200
From: Martin Walch <walch.martin@web.de>
Subject: [PATCH v2 3/5] kconfig: adjust warning message for conflicting types
Date: Thu, 03 Oct 2013 19:24:46 +0200
Message-ID: <5367004.amEGKp5Frc@tacticalops>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Jiri Kosina <trivial@kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Benjamin Poirier <bpoirier@suse.de>, Dirk Gouders <dirk@gouders.net>, Wang YanQing <udknight@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Jean Delvare <jdelvare@suse.de>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org

From: Martin Walch <walch.martin@web.de>
Date: Thu, 3 Oct 2013 18:32:02 +0200
Subject: [PATCH v2 3/5] kconfig: adjust warning message for conflicting types

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
1.8.1.5


