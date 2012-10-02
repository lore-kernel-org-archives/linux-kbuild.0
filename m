Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:44777 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755141Ab2JBW7m (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Oct 2012 18:59:42 -0400
Received: by ieak13 with SMTP id k13so15972388iea.19
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Oct 2012 15:59:41 -0700 (PDT)
From: Jonathan Kliegman <kliegs@chromium.org>
Subject: [PATCH] modpost: Add flag -f for making section mismatches fatal
Date: Tue,  2 Oct 2012 18:59:31 -0400
Message-Id: <1349218771-1854-1-git-send-email-kliegs@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jonathan Kliegman <kliegs@chromium.org>

The section mismatch warning can be easy to miss during the kernel build
process.  Allow it to be marked as fatal to be easily caught and prevent
mismatches from slipping in.

Signed-off-by: Jonathan Kliegman <kliegs@chromium.org>
---
 scripts/Makefile.modpost |    1 +
 scripts/mod/modpost.c    |   24 +++++++++++++++++-------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index a1cb022..1e496d3 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -81,6 +81,7 @@ modpost = scripts/mod/modpost                    \
  $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
  $(if $(CONFIG_DEBUG_SECTION_MISMATCH),,-S)      \
  $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w) \
+ $(if $(CONFIG_SECTION_MISMATCH_FATAL),,-f)      \
  $(if $(cross_build),-c)
 
 quiet_cmd_modpost = MODPOST $(words $(filter-out vmlinux FORCE, $^)) modules
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 68e9f5e..679e364 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -42,6 +42,7 @@ static int warn_unresolved = 0;
 /* How a symbol is exported */
 static int sec_mismatch_count = 0;
 static int sec_mismatch_verbose = 1;
+static int sec_mismatch_fatal = 0;
 
 enum export {
 	export_plain,      export_unused,     export_gpl,
@@ -2127,7 +2128,7 @@ int main(int argc, char **argv)
 	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
 
-	while ((opt = getopt(argc, argv, "i:I:e:cmsSo:awM:K:")) != -1) {
+	while ((opt = getopt(argc, argv, "i:I:e:cmsSo:awM:K:f")) != -1) {
 		switch (opt) {
 		case 'i':
 			kernel_read = optarg;
@@ -2165,6 +2166,9 @@ int main(int argc, char **argv)
 		case 'w':
 			warn_unresolved = 1;
 			break;
+		case 'f':
+			sec_mismatch_fatal = 1;
+			break;
 		default:
 			exit(1);
 		}
@@ -2211,14 +2215,20 @@ int main(int argc, char **argv)
 		sprintf(fname, "%s.mod.c", mod->name);
 		write_if_changed(&buf, fname);
 	}
-
 	if (dump_write)
 		write_dump(dump_write);
-	if (sec_mismatch_count && !sec_mismatch_verbose)
-		warn("modpost: Found %d section mismatch(es).\n"
-		     "To see full details build your kernel with:\n"
-		     "'make CONFIG_DEBUG_SECTION_MISMATCH=y'\n",
-		     sec_mismatch_count);
+	if (sec_mismatch_count) {
+		if (!sec_mismatch_verbose) {
+			warn("modpost: Found %d section mismatch(es).\n"
+			     "To see full details build your kernel with:\n"
+			     "'make CONFIG_DEBUG_SECTION_MISMATCH=y'\n",
+			     sec_mismatch_count);
+		}
+		if (sec_mismatch_fatal) {
+			fatal("modpost: Section mismatches detected.\n"
+			      "Unset CONFIG_SECTION_MISMATCH_FATAL to allow them.\n");
+		}
+	}
 
 	return err;
 }
-- 
1.7.7.3

