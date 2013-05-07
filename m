Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:62745 "EHLO
	szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758757Ab3EGCln (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 May 2013 22:41:43 -0400
Message-ID: <518869BB.2020808@huawei.com>
Date: Tue, 7 May 2013 10:40:59 +0800
From: Li Zefan <lizefan@huawei.com>
MIME-Version: 1.0
Subject: [PATCH] menuconfig: fix NULL pointer dereference when searching a
 symbol
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Marek <mmarek@suse.cz>, Weng Meiling <wengmeiling.weng@huawei.com>, Libo Chen <clbchenlibo.chen@huawei.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Borislav Petkov <bp@alien8.de>

Searching PPC_EFIKA results segmentation fault, and it's because
get_symbol_prop() returns NULL.

In this case CONFIG_PPC_EFIKA is defined in arch/powerpc/platforms/
52xx/Kconfig, so it won't be parsed if ARCH!=PPC, but menuconfig
knows this symbol when it parses sound/soc/fsl/Kconfig:

config SND_MPC52xx_SOC_EFIKA
        tristate "SoC AC97 Audio support for bbplan Efika and STAC9766"
        depends on PPC_EFIKA

This bug was introduced by commit bcdedcc1afd6 ("menuconfig: print more
info for symbol without prompts").

Reported-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Li Zefan <lizefan@huawei.com>
---
 scripts/kconfig/menu.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 826da66..b5c7d90 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -600,14 +600,18 @@ void get_symbol_str(struct gstr *r, struct symbol *sym,
 	}
 	for_all_prompts(sym, prop)
 		get_prompt_str(r, prop, head);
+
 	prop = get_symbol_prop(sym);
-	str_printf(r, _("  Defined at %s:%d\n"), prop->menu->file->name,
-		prop->menu->lineno);
-	if (!expr_is_yes(prop->visible.expr)) {
-		str_append(r, _("  Depends on: "));
-		expr_gstr_print(prop->visible.expr, r);
-		str_append(r, "\n");
+	if (prop) {
+		str_printf(r, _("  Defined at %s:%d\n"), prop->menu->file->name,
+			prop->menu->lineno);
+		if (!expr_is_yes(prop->visible.expr)) {
+			str_append(r, _("  Depends on: "));
+			expr_gstr_print(prop->visible.expr, r);
+			str_append(r, "\n");
+		}
 	}
+
 	hit = false;
 	for_all_properties(sym, prop, P_SELECT) {
 		if (!hit) {
-- 
1.8.0.2
