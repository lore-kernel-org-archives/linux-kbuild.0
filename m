Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40026 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 36/37] modpost: remove is_vmlinux() helper
Date: Mon,  1 Jun 2020 14:57:30 +0900
Message-Id: <20200601055731.3006266-36-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

Now that is_vmlinux() is called only in new_module(), we can inline
the function call.

modname is the basename with '.o' is stripped. No need to compare it
with 'vmlinux.o'.

vmlinux is always located at the current working directory. No need
to strip the directory path.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index ebfa9b76ba92..a3ffabf4eca5 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -88,20 +88,6 @@ static inline bool strends(const char *str, const char *postfix)
 	return strcmp(str + strlen(str) - strlen(postfix), postfix) == 0;
 }
 
-static int is_vmlinux(const char *modname)
-{
-	const char *myname;
-
-	myname = strrchr(modname, '/');
-	if (myname)
-		myname++;
-	else
-		myname = modname;
-
-	return (strcmp(myname, "vmlinux") == 0) ||
-	       (strcmp(myname, "vmlinux.o") == 0);
-}
-
 void *do_nofail(void *ptr, const char *expr)
 {
 	if (!ptr)
@@ -181,7 +167,7 @@ static struct module *new_module(const char *modname)
 
 	/* add to list */
 	strcpy(mod->name, modname);
-	mod->is_vmlinux = is_vmlinux(modname);
+	mod->is_vmlinux = (strcmp(modname, "vmlinux") == 0);
 	mod->gpl_compatible = -1;
 	mod->next = modules;
 	modules = mod;
-- 
2.25.1
