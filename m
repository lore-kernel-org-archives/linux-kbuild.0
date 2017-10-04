Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:55985 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751113AbdJDDhg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Oct 2017 23:37:36 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH] kconfig: Document the 'menu' struct
Date: Wed,  4 Oct 2017 05:37:12 +0200
Message-Id: <1507088232-8510-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

Understanding what it represents helps a lot when reading the code, and
it's not obvious, so document it.

The ROOT_MENU flag is only set and tested by the gconf and qconf front
ends, so leave it undocumented here. The obvious guess for what it means
is correct.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/expr.h | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index a73f762..ae7583c 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -166,22 +166,67 @@ struct property {
 	for (st = sym->prop; st; st = st->next) \
 		if (st->text)
 
+/*
+ * Represents a node in the menu tree, as seen in e.g. menuconfig (though used
+ * for all front ends). Each symbol, menu, etc. defined in the Kconfig files
+ * gets a node. A symbol defined in multiple locations gets one node at each
+ * location.
+ */
 struct menu {
+	/* The next menu node at the same level */
 	struct menu *next;
+
+	/* The parent menu node, corresponding to e.g. a menu or choice */
 	struct menu *parent;
+
+	/* The first child menu node, for e.g. menus and choices */
 	struct menu *list;
+
+	/*
+	 * The symbol associated with the menu node. Choices are implemented as
+	 * a special kind of symbol. NULL for menus, comments, and ifs.
+	 */
 	struct symbol *sym;
+
+	/*
+	 * The prompt associated with the node. This holds the prompt for a
+	 * symbol as well as the text for a menu or comment, along with the
+	 * type (P_PROMPT, P_MENU, etc.)
+	 */
 	struct property *prompt;
+
+	/*
+	 * 'visible if' dependencies. If more than one is given, they will be
+	 * ANDed together.
+	 */
 	struct expr *visibility;
+
+	/*
+	 * Ordinary dependencies from e.g. 'depends on' and 'if', ANDed
+	 * together
+	 */
 	struct expr *dep;
+
+	/* MENU_* flags */
 	unsigned int flags;
+
+	/* Any help text associated with the node */
 	char *help;
+
+	/* The location where the menu node appears in the Kconfig files */
 	struct file *file;
 	int lineno;
+
+	/* For use by front ends that need to store auxiliary data */
 	void *data;
 };
 
+/*
+ * Set on a menu node when the corresponding symbol changes state in some way.
+ * Can be checked by front ends.
+ */
 #define MENU_CHANGED		0x0001
+
 #define MENU_ROOT		0x0002
 
 struct jump_key {
-- 
2.7.4

