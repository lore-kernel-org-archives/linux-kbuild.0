Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:38330 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgEQJtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:36 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 26/29] modpost: set have_vmlinux in new_module()
Date: Sun, 17 May 2020 18:48:56 +0900
Message-Id: <20200517094859.2376211-27-masahiroy@kernel.org>
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Set have_vmlinux flag in a single place.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 003b6fb2303c..79622939a6c7 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -181,6 +181,9 @@ static struct module *new_module(const char *modname)
 	mod->next = modules;
 	modules = mod;
 
+	if (mod->is_vmlinux)
+		have_vmlinux = 1;
+
 	return mod;
 }
 
@@ -2002,9 +2005,6 @@ static void read_symbols(const char *modname)
 
 	mod = new_module(modname);
 
-	if (mod->is_vmlinux)
-		have_vmlinux = 1;
-
 	if (!mod->is_vmlinux) {
 		license = get_modinfo(&info, "license");
 		if (!license)
@@ -2452,8 +2452,6 @@ static void read_dump(const char *fname)
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
