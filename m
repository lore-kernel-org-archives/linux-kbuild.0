Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:60409 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208AbcDTKXu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Apr 2016 06:23:50 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [RESEND PATCH v4] kconfig/symbol.c: handle choice_values that depend on 'm' symbols
In-Reply-To: <56FCCE0E.3090608@ti.com> (Roger Quadros's message of "Thu, 31
	Mar 2016 10:13:18 +0300")
References: <ghr4asl38m.fsf@lena.gouders.net>
	<ghk3gkl32u.fsf@lena.gouders.net> <20131118180813.GB3458@free.fr>
	<CADYTM3YPscaS18KqAOkymRqWKGp4vQFsrefZNtuZddpkDoBWkg@mail.gmail.com>
	<ghd2c3h8bc.fsf@quad.gouders.net>
	<CADYTM3b6iL3xqoZTkHxbS3aUfZMywDkYekZVmGQy2TQt-4SnTA@mail.gmail.com>
	<ghwqaayzj6.fsf@quad.gouders.net>
	<CADYTM3Y6=JbyzyoR3m-gwaa5jWxfcStXLsKXyiUVhM4bQAd_AA@mail.gmail.com>
	<CAB=otbSUpt56JnJ4rXpLA2DDprATER9kCNNi_sD83wLbwszfDA@mail.gmail.com>
	<56FCCE0E.3090608@ti.com>
Date: Wed, 20 Apr 2016 12:19:15 +0200
Message-ID: <ghlh48bn18.fsf_-_@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Roger Quadros <rogerq@ti.com>, Ruslan Bilovol <ruslan.bilovol@gmail.com>, Bin Liu <binmlist@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kbuild@vger.kernel.org, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>

If choices consist of choice_values that depend on symbols set to 'm',
those choice_values are not set to 'n' if the choice is changed from
'm' to 'y' (in which case only one active choice_value is allowed).
Those values are also written to the config file causing modules to be
built when they should not.

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

This patch sets choice_values' visibility that depend on symbols set
to 'm' to 'n' if the corresponding choice is set to 'y'.  This makes
them disappear from the choice list and will also cause the
choice_values' value set to 'n' in sym_calc_value() and as a result
they are written as "not set" to the resulting .config file.

Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Dirk Gouders <dirk@gouders.net>
Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 scripts/kconfig/symbol.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index c9a6775..06d96c9 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -189,12 +189,23 @@ static void sym_validate_range(struct symbol *sym)
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
+		 * choice_values with visibility 'mod' are not visible if the
+		 * corresponding choice's value is 'yes'.
+		 */
+		if (prop->visible.tri == mod && (choice_sym && choice_sym->curr.tri == yes))
+			prop->visible.tri = no;
 		tri = EXPR_OR(tri, prop->visible.tri);
 	}
 	if (tri == mod && (sym->type != S_TRISTATE || modules_val == no))
-- 
1.8.4

