Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39993 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgFAF6U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:20 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 19/37] modpost: show warning if vmlinux is not found when processing modules
Date: Mon,  1 Jun 2020 14:57:13 +0900
Message-Id: <20200601055731.3006266-19-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

check_exports() does not print warnings about unresolved symbols if
vmlinux is missing because there would be too many.

This situation happens when you do 'make modules' from the clean
tree, or compile external modules against a kernel tree that has
not been completely built.

It is dangerous to not check unresolved symbols because you might be
building useless modules. At least it should be warned.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index b839c48689df..3df26789c2e6 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2001,8 +2001,6 @@ static void read_symbols(const char *modname)
 
 	mod = new_module(modname);
 
-	/* When there's no vmlinux, don't print warnings about
-	 * unresolved symbols (since there'll be too many ;) */
 	if (is_vmlinux(modname)) {
 		have_vmlinux = 1;
 		mod->skip = 1;
@@ -2623,6 +2621,13 @@ int main(int argc, char **argv)
 	if (files_source)
 		read_symbols_from_files(files_source);
 
+	/*
+	 * When there's no vmlinux, don't print warnings about
+	 * unresolved symbols (since there'll be too many ;)
+	 */
+	if (!have_vmlinux)
+		warn("Symbol info of vmlinux is missing. Unresolved symbol check will be entirely skipped.\n");
+
 	err = 0;
 
 	for (mod = modules; mod; mod = mod->next) {
-- 
2.25.1
