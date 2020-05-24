Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:19690 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 26/29] modpost: set have_vmlinux in new_module()
Date: Mon, 25 May 2020 00:42:32 +0900
Message-Id: <20200524154235.380482-27-masahiroy@kernel.org>
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Set have_vmlinux flag in a single place.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/modpost.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index fdf843323d98..662dc1ca10f8 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -191,6 +191,9 @@ static struct module *new_module(const char *modname)
 	mod->next = modules;
 	modules = mod;
 
+	if (mod->is_vmlinux)
+		have_vmlinux = 1;
+
 	return mod;
 }
 
@@ -2012,9 +2015,6 @@ static void read_symbols(const char *modname)
 
 	mod = new_module(modname);
 
-	if (mod->is_vmlinux)
-		have_vmlinux = 1;
-
 	if (!mod->is_vmlinux) {
 		license = get_modinfo(&info, "license");
 		if (!license)
@@ -2462,8 +2462,6 @@ static void read_dump(const char *fname)
 		mod = find_module(modname);
 		if (!mod) {
 			mod = new_module(modname);
-			if (mod->is_vmlinux)
-				have_vmlinux = 1;
 			mod->from_dump = 1;
 		}
 		s = sym_add_exported(symname, mod, export_no(export));
-- 
2.25.1
