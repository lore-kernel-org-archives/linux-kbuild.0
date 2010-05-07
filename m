Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:57483 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751707Ab0EGFyp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 7 May 2010 01:54:45 -0400
Message-ID: <4BE3AB91.80606@cn.fujitsu.com>
Date: Fri, 07 May 2010 13:56:33 +0800
From: Li Zefan <lizf@cn.fujitsu.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/8] kconfig: print symbol type in help text
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Randy suggested to print out the symbol type in gconfig.

Note this change does more than Randy's suggestion, that it also
affects menuconfig and "make config".

  │ Symbol: BLOCK [=y]
  │ Type  : boolean
  │ Prompt: Enable the block layer
  │   Defined at block/Kconfig:4
  │   Depends on: EMBEDDED [=n]

Signed-off-by: Li Zefan <lizf@cn.fujitsu.com>
Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 scripts/kconfig/menu.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index e150176..b5d15fa 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -501,9 +501,11 @@ void get_symbol_str(struct gstr *r, struct symbol *sym)
 	bool hit;
 	struct property *prop;
 
-	if (sym && sym->name)
+	if (sym && sym->name) {
 		str_printf(r, "Symbol: %s [=%s]\n", sym->name,
 			   sym_get_string_value(sym));
+		str_printf(r, "Type  : %s\n", sym_type_name(sym->type));
+	}
 	for_all_prompts(sym, prop)
 		get_prompt_str(r, prop);
 	hit = false;
-- 
1.6.3
