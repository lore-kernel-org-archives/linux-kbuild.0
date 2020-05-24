Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:19687 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 19/29] modpost: show warning if it fails to read symbol dump file
Date: Mon, 25 May 2020 00:42:25 +0900
Message-Id: <20200524154235.380482-20-masahiroy@kernel.org>
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

If modpost fails to load a symbol dump file, it cannot check unresolved
symbols, hence module dependency will not be added. Nor CRCs can be added.

Currently, external module builds check only $(objtree)/Module.symvers,
but it should check files specified by KBUILD_EXTRA_SYMBOLS as well.

Print the warnings in modpost. The warning in Makefile is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 Makefile              | 10 +---------
 scripts/mod/modpost.c | 11 +++++++++--
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 48a2dfaf3bf3..3b25a51132ea 100644
--- a/Makefile
+++ b/Makefile
@@ -1641,17 +1641,9 @@ else # KBUILD_EXTMOD
 # We are always building modules
 KBUILD_MODULES := 1
 
-PHONY += $(objtree)/Module.symvers
-$(objtree)/Module.symvers:
-	@test -e $(objtree)/Module.symvers || ( \
-	echo; \
-	echo "  WARNING: Symbol version dump $(objtree)/Module.symvers"; \
-	echo "           is missing; modules will have no dependencies and modversions."; \
-	echo )
-
 build-dirs := $(KBUILD_EXTMOD)
 PHONY += modules
-modules: descend $(objtree)/Module.symvers
+modules: descend
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 PHONY += modules_install
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 638c45d35292..34f2aa3a021f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -41,6 +41,8 @@ static int sec_mismatch_fatal = 0;
 static int ignore_missing_files;
 /* If set to 1, only warn (instead of error) about missing ns imports */
 static int allow_missing_ns_imports;
+/* Set when at list one dump file is missing */
+static int missing_dump_file;
 
 enum export {
 	export_plain,      export_unused,     export_gpl,
@@ -2438,9 +2440,11 @@ static void read_dump(const char *fname)
 	char *buf, *pos, *line;
 
 	buf = read_text_file(fname);
-	if (!buf)
-		/* No symbol versions, silently ignore */
+	if (!buf) {
+		warn("failed to read '%s'\n", fname);
+		missing_dump_file = 1;
 		return;
+	}
 
 	pos = buf;
 
@@ -2625,6 +2629,9 @@ int main(int argc, char **argv)
 	if (files_source)
 		read_symbols_from_files(files_source);
 
+	if (missing_dump_file)
+		warn("Symbol dump file is missing. Modules may not have dependencies or movversions.\n");
+
 	/*
 	 * When there's no vmlinux, don't print warnings about
 	 * unresolved symbols (since there'll be too many ;)
-- 
2.25.1
