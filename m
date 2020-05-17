Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:38325 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgEQJtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:36 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 25/29] modpost: remove mod->skip struct member
Date: Sun, 17 May 2020 18:48:55 +0900
Message-Id: <20200517094859.2376211-26-masahiroy@kernel.org>
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

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

 scripts/mod/modpost.c | 9 +++------
 scripts/mod/modpost.h | 1 -
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0df0fc82412d..003b6fb2303c 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2002,10 +2002,8 @@ static void read_symbols(const char *modname)
 
 	mod = new_module(modname);
 
-	if (mod->is_vmlinux) {
+	if (mod->is_vmlinux)
 		have_vmlinux = 1;
-		mod->skip = 1;
-	}
 
 	if (!mod->is_vmlinux) {
 		license = get_modinfo(&info, "license");
@@ -2456,7 +2454,6 @@ static void read_dump(const char *fname)
 			mod = new_module(modname);
 			if (mod->is_vmlinux)
 				have_vmlinux = 1;
-			mod->skip = 1;
 			mod->from_dump = 1;
 		}
 		s = sym_add_exported(symname, mod, export_no(export));
@@ -2517,7 +2514,7 @@ static void write_namespace_deps_files(const char *fname)
 
 	for (mod = modules; mod; mod = mod->next) {
 
-		if (mod->skip || !mod->missing_namespaces)
+		if (mod->from_dump || !mod->missing_namespaces)
 			continue;
 
 		buf_printf(&ns_deps_buf, "%s.ko:", mod->name);
@@ -2622,7 +2619,7 @@ int main(int argc, char **argv)
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
