Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:38317 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbgEQJtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:36 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 02/29] modpost: do not call get_modinfo() for vmlinux
Date: Sun, 17 May 2020 18:48:32 +0900
Message-Id: <20200517094859.2376211-3-masahiroy@kernel.org>
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The three calls of get_modinfo() ("license", "import_ns", "version")
always return NULL for vmlinux because the built-in module info is
prefixed with __MODULE_INFO_PREFIX.

It is harmless to call get_modinfo(), but there is no point to search
for what apparently does not exist.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 45 +++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 77e5425759e2..af098d7efc22 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2014,25 +2014,26 @@ static void read_symbols(const char *modname)
 		mod->skip = 1;
 	}
 
-	license = get_modinfo(&info, "license");
-	if (!license && !is_vmlinux(modname))
-		warn("missing MODULE_LICENSE() in %s\n"
-		     "see include/linux/module.h for "
-		     "more information\n", modname);
-	while (license) {
-		if (license_is_gpl_compatible(license))
-			mod->gpl_compatible = 1;
-		else {
-			mod->gpl_compatible = 0;
-			break;
+	if (!is_vmlinux(modname)) {
+		license = get_modinfo(&info, "license");
+		if (!license)
+			warn("missing MODULE_LICENSE() in %s\n", modname);
+		while (license) {
+			if (license_is_gpl_compatible(license))
+				mod->gpl_compatible = 1;
+			else {
+				mod->gpl_compatible = 0;
+				break;
+			}
+			license = get_next_modinfo(&info, "license", license);
 		}
-		license = get_next_modinfo(&info, "license", license);
-	}
 
-	namespace = get_modinfo(&info, "import_ns");
-	while (namespace) {
-		add_namespace(&mod->imported_namespaces, namespace);
-		namespace = get_next_modinfo(&info, "import_ns", namespace);
+		namespace = get_modinfo(&info, "import_ns");
+		while (namespace) {
+			add_namespace(&mod->imported_namespaces, namespace);
+			namespace = get_next_modinfo(&info, "import_ns",
+						     namespace);
+		}
 	}
 
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
@@ -2073,10 +2074,12 @@ static void read_symbols(const char *modname)
 	if (!is_vmlinux(modname) || vmlinux_section_warnings)
 		check_sec_ref(mod, modname, &info);
 
-	version = get_modinfo(&info, "version");
-	if (version || (all_versions && !is_vmlinux(modname)))
-		get_src_version(modname, mod->srcversion,
-				sizeof(mod->srcversion)-1);
+	if (!is_vmlinux(modname)) {
+		version = get_modinfo(&info, "version");
+		if (version || all_versions)
+			get_src_version(modname, mod->srcversion,
+					sizeof(mod->srcversion) - 1);
+	}
 
 	parse_elf_finish(&info);
 
-- 
2.25.1
