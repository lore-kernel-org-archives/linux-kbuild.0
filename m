Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:57516 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752825AbcD2Ibj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2016 04:31:39 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH v5] kconfig/symbol.c: handle choice_values that depend on 'm' symbols
In-Reply-To: <201604201924.7peNMcCF%fengguang.wu@intel.com> (kbuild test
	robot's message of "Wed, 20 Apr 2016 19:04:42 +0800")
References: <201604201924.7peNMcCF%fengguang.wu@intel.com>
Date: Fri, 29 Apr 2016 10:24:52 +0200
Message-ID: <ghinz04yaz.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: kbuild-all@01.org, Roger Quadros <rogerq@ti.com>, Ruslan Bilovol <ruslan.bilovol@gmail.com>, Bin Liu <binmlist@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kbuild@vger.kernel.org, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>

If choices consist of choice_values of type tristate that depend on
symbols set to 'm', those choice_values are not set to 'n' if the
choice is changed from 'm' to 'y' (in which case only one active
choice_value is allowed). Those values are also written to the config
file causing modules to be built when they should not.

The following config can be used to reproduce and examine the problem;
with the frontend of your choice set "Choice 0" and "Choice 1" to 'm',
then set "Tristate Choice" to 'y' and save the configuration:

config modules
	boolean modules
	default y
	option modules

config dependency
	tristate "Dependency"
	default m

choice
	prompt "Tristate Choice"
	default choice0

config choice0
	tristate "Choice 0"

config choice1
	tristate "Choice 1"
	depends on dependency

endchoice

This patch sets tristate choice_values' visibility that depend on
symbols set to 'm' to 'n' if the corresponding choice is set to 'y'.

This makes them disappear from the choice list and will also cause the
choice_values' value set to 'n' in sym_calc_value() and as a result
they are written as "not set" to the resulting .config file.

Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Dirk Gouders <dirk@gouders.net>
Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
v5: This patch should handle tristate choice-values, only.

    I assumed that only tristate choice-values can have visibility 'm',
    which was wrong: tristate dependencies can result in 'm'
    visibility.

    So, add an explicit test if a symbol is of type tristate.

    I am a bit unsure how to handle Tested-By credits when patches change
    substantially and left the credits untouched but new test reports
    are welcome.

---
 scripts/kconfig/symbol.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 25cf0c2..2432298 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -209,12 +209,26 @@ static void sym_set_all_changed(void)
 static void sym_calc_visibility(struct symbol *sym)
 {
 	struct property *prop;
+	struct symbol *choice_sym = NULL;
 	tristate tri;
 
 	/* any prompt visible? */
 	tri = no;
+
+	if (sym_is_choice_value(sym))
+		choice_sym = prop_get_symbol(sym_get_choice_prop(sym));
+
 	for_all_prompts(sym, prop) {
 		prop->visible.tri = expr_calc_value(prop->visible.expr);
+		/*
+		 * Tristate choice_values with visibility 'mod' are
+		 * not visible if the corresponding choice's value is
+		 * 'yes'.
+		 */
+		if (choice_sym && sym->type == S_TRISTATE &&
+		    prop->visible.tri == mod && choice_sym->curr.tri == yes)
+			prop->visible.tri = no;
+
 		tri = EXPR_OR(tri, prop->visible.tri);
 	}
 	if (tri == mod && (sym->type != S_TRISTATE || modules_val == no))
-- 
2.8.1

