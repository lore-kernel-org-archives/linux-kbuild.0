Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45045 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729388AbeHORU2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Aug 2018 13:20:28 -0400
Received: by mail-lj1-f193.google.com with SMTP id q127-v6so1089020ljq.11
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Aug 2018 07:28:05 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 2/3] Kbuild: teach fixdep to optionally remove the depfile
Date: Wed, 15 Aug 2018 16:27:48 +0200
Message-Id: <20180815142749.18804-3-linux@rasmusvillemoes.dk>
In-Reply-To: <20180815142749.18804-1-linux@rasmusvillemoes.dk>
References: <20180815142749.18804-1-linux@rasmusvillemoes.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org

Instead of having to spawn an 'rm' instance to remove the depfile after
processing, let the fixdep program itself do that. For debugging, it's
nice to not do it unconditionally.

Note that the fixdep calls from Makefiles are done under 'set -e', so
this also preserves the behaviour of keeping the depfile if fixdep exits
prematurely.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 scripts/Kbuild.include |  7 +++----
 scripts/basic/fixdep.c | 10 ++++++++--
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index d52db4279aa5..a944510acd9d 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -274,8 +274,8 @@ ifndef CONFIG_TRIM_UNUSED_KSYMS
 
 cmd_and_fixdep =                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
-	scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).tmp;\
-	rm -f $(depfile);                                                    \
+	scripts/basic/fixdep -r $(depfile) $@ '$(make-cmd)'                  \
+		> $(dot-target).tmp;                                         \
 	mv -f $(dot-target).tmp $(dot-target).cmd;
 
 else
@@ -298,9 +298,8 @@ ksym_dep_filter =                                                            \
 cmd_and_fixdep =                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
 	$(ksym_dep_filter) |                                                 \
-		scripts/basic/fixdep -e $(depfile) $@ '$(make-cmd)'          \
+		scripts/basic/fixdep -e -r $(depfile) $@ '$(make-cmd)'       \
 			> $(dot-target).tmp;	                             \
-	rm -f $(depfile);                                                    \
 	mv -f $(dot-target).tmp $(dot-target).cmd;
 
 endif
diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 666041841200..7b59c185858a 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -105,8 +105,9 @@
 
 static void usage(void)
 {
-	fprintf(stderr, "Usage: fixdep [-e] <depfile> <target> <cmdline>\n");
+	fprintf(stderr, "Usage: fixdep [-e] [-r] <depfile> <target> <cmdline>\n");
 	fprintf(stderr, " -e  insert extra dependencies given on stdin\n");
+	fprintf(stderr, " -r  remove <depfile> after processing\n");
 	exit(1);
 }
 
@@ -380,12 +381,14 @@ int main(int argc, char *argv[])
 {
 	const char *depfile, *target, *cmdline;
 	int insert_extra_deps = 0;
+	int remove_depfile = 0;
 	void *buf;
 	int opt;
 
-	while ((opt = getopt(argc, argv, "e")) != -1) {
+	while ((opt = getopt(argc, argv, "er")) != -1) {
 		switch (opt) {
 		case 'e': insert_extra_deps = 1; break;
+		case 'r': remove_depfile = 1; break;
 		default: usage();
 		}
 	}
@@ -405,5 +408,8 @@ int main(int argc, char *argv[])
 	parse_dep_file(buf, target, insert_extra_deps);
 	free(buf);
 
+	if (remove_depfile)
+		unlink(depfile);
+
 	return 0;
 }
-- 
2.16.4
