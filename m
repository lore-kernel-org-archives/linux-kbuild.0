Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:46061 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756242Ab2KVTDs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Nov 2012 14:03:48 -0500
Received: by mail-we0-f174.google.com with SMTP id d7so2107409wer.19
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Nov 2012 11:03:47 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 2/3] scripts/kconfig: constify an argument
Date: Thu, 22 Nov 2012 01:06:05 +0100
Message-Id: <1353542766-24422-3-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1353542766-24422-1-git-send-email-yann.morin.1998@free.fr>
References: <1353542766-24422-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

There is no reason for the prompt argument to be non-const, as it
can deal with const objects (eg. hard-coded root-menu label).

Furthermore, the next commit will also introduce another source
for the root-menu label, which will be explicitly marked const.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/lkc.h  |    4 ++--
 scripts/kconfig/menu.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index f8aee5f..5cfd940 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -111,8 +111,8 @@ void menu_add_entry(struct symbol *sym);
 void menu_end_entry(void);
 void menu_add_dep(struct expr *dep);
 void menu_add_visibility(struct expr *dep);
-struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *expr, struct expr *dep);
-struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr *dep);
+struct property *menu_add_prop(enum prop_type type, const char *prompt, struct expr *expr, struct expr *dep);
+struct property *menu_add_prompt(enum prop_type type, const char *prompt, struct expr *dep);
 void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
 void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep);
 void menu_add_option(int token, char *arg);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 84a2ba2..6175ead 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -124,7 +124,7 @@ void menu_set_type(int type)
 	    sym_type_name(sym->type), sym_type_name(type));
 }
 
-struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *expr, struct expr *dep)
+struct property *menu_add_prop(enum prop_type type, const char *prompt, struct expr *expr, struct expr *dep)
 {
 	struct property *prop = prop_alloc(type, current_entry->sym);
 
@@ -161,7 +161,7 @@ struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *e
 	return prop;
 }
 
-struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr *dep)
+struct property *menu_add_prompt(enum prop_type type, const char *prompt, struct expr *dep)
 {
 	return menu_add_prop(type, prompt, NULL, dep);
 }
-- 
1.7.2.5

