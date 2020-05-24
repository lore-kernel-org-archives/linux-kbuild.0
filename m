Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:19698 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728363AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 25/29] modpost: remove mod->skip struct member
Date: Mon, 25 May 2020 00:42:31 +0900
Message-Id: <20200524154235.380482-26-masahiroy@kernel.org>
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The meaning of 'skip' is obscure since it does not explain
"what to skip".

mod->skip is set when it is vmlinux or the module info came from
a dump file.

So, mod->skip is equivalent to (mod->is_vmlinux || mod->from_dump).

For the check in write_namespace_deps_files(), mod->is_vmlinux is
unneeded because the -d option is not passed in the first pass of
modpost.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/modpost.c | 9 +++------
 scripts/mod/modpost.h | 1 -
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0d065f8f5087..fdf843323d98 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2012,10 +2012,8 @@ static void read_symbols(const char *modname)
 
 	mod = new_module(modname);
 
-	if (mod->is_vmlinux) {
+	if (mod->is_vmlinux)
 		have_vmlinux = 1;
-		mod->skip = 1;
-	}
 
 	if (!mod->is_vmlinux) {
 		license = get_modinfo(&info, "license");
@@ -2466,7 +2464,6 @@ static void read_dump(const char *fname)
 			mod = new_module(modname);
 			if (mod->is_vmlinux)
 				have_vmlinux = 1;
-			mod->skip = 1;
 			mod->from_dump = 1;
 		}
 		s = sym_add_exported(symname, mod, export_no(export));
@@ -2527,7 +2524,7 @@ static void write_namespace_deps_files(const char *fname)
 
 	for (mod = modules; mod; mod = mod->next) {
 
-		if (mod->skip || !mod->missing_namespaces)
+		if (mod->from_dump || !mod->missing_namespaces)
 			continue;
 
 		buf_printf(&ns_deps_buf, "%s.ko:", mod->name);
@@ -2632,7 +2629,7 @@ int main(int argc, char **argv)
 	for (mod = modules; mod; mod = mod->next) {
 		char fname[PATH_MAX];
 
-		if (mod->skip)
+		if (mod->is_vmlinux || mod->from_dump)
 			continue;
 
 		buf.pos = 0;
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index ec717ab20b98..264c0c51defa 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -122,7 +122,6 @@ struct module {
 	int from_dump;  /* 1 if module was loaded from *.symver */
 	int is_vmlinux;
 	int seen;
-	int skip;
 	int has_init;
 	int has_cleanup;
 	struct buffer dev_table_buf;
-- 
2.25.1
