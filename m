Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40017 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 35/37] modpost: strip .o from modname before calling new_module()
Date: Mon,  1 Jun 2020 14:57:29 +0900
Message-Id: <20200601055731.3006266-35-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

new_module() conditionally strips the .o because the modname has .o
suffix when it is called from read_symbols(), but no .o when it is
called from read_dump().

It is clearer to strip .o in read_symbols().

I also used flexible-array for mod->name.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 20 +++++++++++---------
 scripts/mod/modpost.h |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index b317328ae21b..ebfa9b76ba92 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -175,18 +175,12 @@ static struct module *find_module(const char *modname)
 static struct module *new_module(const char *modname)
 {
 	struct module *mod;
-	char *p;
 
-	mod = NOFAIL(malloc(sizeof(*mod)));
+	mod = NOFAIL(malloc(sizeof(*mod) + strlen(modname) + 1));
 	memset(mod, 0, sizeof(*mod));
-	p = NOFAIL(strdup(modname));
-
-	/* strip trailing .o */
-	if (strends(p, ".o"))
-		p[strlen(p) - 2] = '\0';
 
 	/* add to list */
-	mod->name = p;
+	strcpy(mod->name, modname);
 	mod->is_vmlinux = is_vmlinux(modname);
 	mod->gpl_compatible = -1;
 	mod->next = modules;
@@ -2013,7 +2007,15 @@ static void read_symbols(const char *modname)
 	if (!parse_elf(&info, modname))
 		return;
 
-	mod = new_module(modname);
+	{
+		char *tmp;
+
+		/* strip trailing .o */
+		tmp = NOFAIL(strdup(modname));
+		tmp[strlen(tmp) - 2] = '\0';
+		mod = new_module(tmp);
+		free(tmp);
+	}
 
 	if (!mod->is_vmlinux) {
 		license = get_modinfo(&info, "license");
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 264c0c51defa..1df87d204c9a 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -116,7 +116,6 @@ struct namespace_list {
 
 struct module {
 	struct module *next;
-	const char *name;
 	int gpl_compatible;
 	struct symbol *unres;
 	int from_dump;  /* 1 if module was loaded from *.symver */
@@ -130,6 +129,7 @@ struct module {
 	struct namespace_list *missing_namespaces;
 	// Actual imported namespaces
 	struct namespace_list *imported_namespaces;
+	char name[];
 };
 
 struct elf_info {
-- 
2.25.1
