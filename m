Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:40232 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751694Ab3FYVh4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Jun 2013 17:37:56 -0400
Received: by mail-wg0-f48.google.com with SMTP id f11so9758067wgh.15
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Jun 2013 14:37:55 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH] Revert "kconfig: fix randomising choice entries in presence of KCONFIG_ALLCONFIG"
Date: Tue, 25 Jun 2013 23:37:44 +0200
Message-Id: <1372196264-3407-1-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <20130625205836.GB14074@free.fr>
References: <20130625205836.GB14074@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, Fengguang Wu <fengguang.wu@intel.com>, Sedat Dilek <sedat.dilek@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This reverts commit 8357b48549e17b3e4e402c7f977b65708922e60f.

It breaks more stuff than it fixes.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alexandre Bounine <alexandre.bounine@idt.com>
Cc: Matt Porter <mporter@kernel.crashing.org>

---
Michal, here is the revert patch if you want it.
Regards,
Yann E. MORIN.
---
 scripts/kconfig/confdata.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 3e39208..c55c227 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -288,6 +288,8 @@ load:
 	for_all_symbols(i, sym) {
 		sym->flags |= SYMBOL_CHANGED;
 		sym->flags &= ~(def_flags|SYMBOL_VALID);
+		if (sym_is_choice(sym))
+			sym->flags |= def_flags;
 		switch (sym->type) {
 		case S_INT:
 		case S_HEX:
@@ -377,13 +379,13 @@ setsym:
 			case mod:
 				if (cs->def[def].tri == yes) {
 					conf_warning("%s creates inconsistent choice state", sym->name);
+					cs->flags &= ~def_flags;
 				}
 				break;
 			case yes:
 				if (cs->def[def].tri != no)
 					conf_warning("override: %s changes choice state", sym->name);
 				cs->def[def].val = sym;
-				cs->flags |= def_flags;
 				break;
 			}
 			cs->def[def].tri = EXPR_OR(cs->def[def].tri, sym->def[def].tri);
@@ -789,8 +791,6 @@ int conf_write(const char *name)
 			sym_calc_value(sym);
 			if (!(sym->flags & SYMBOL_WRITE))
 				goto next;
-			if (sym_is_choice_value(sym) && !menu_is_visible(menu->parent))
-				goto next;
 			sym->flags &= ~SYMBOL_WRITE;
 
 			conf_write_symbol(out, sym, &kconfig_printer_cb, NULL);
-- 
1.8.1.2

