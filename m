Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:49808 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1753263Ab0D0Hq5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Apr 2010 03:46:57 -0400
Message-ID: <4BD696DF.70100@cn.fujitsu.com>
Date: Tue, 27 Apr 2010 15:48:47 +0800
From: Li Zefan <lizf@cn.fujitsu.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] gconfig: fix to tag NEW symbols correctly
References: <4BD696C0.8050500@cn.fujitsu.com>
In-Reply-To: <4BD696C0.8050500@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

The logic should be reversed.

Signed-off-by: Li Zefan <lizf@cn.fujitsu.com>
---
 scripts/kconfig/gconf.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index bef1041..1b18329 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1114,7 +1114,7 @@ static gchar **fill_row(struct menu *menu)
 
 	row[COL_OPTION] =
 	    g_strdup_printf("%s %s", _(menu_get_prompt(menu)),
-			    sym && sym_has_value(sym) ? "(NEW)" : "");
+			    sym && !sym_has_value(sym) ? "(NEW)" : "");
 
 	if (opt_mode == OPT_ALL && !menu_is_visible(menu))
 		row[COL_COLOR] = g_strdup("DarkGray");
-- 
1.6.3
