Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:35849 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965454AbcBQW0C (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Feb 2016 17:26:02 -0500
Received: by mail-pa0-f45.google.com with SMTP id yy13so18419551pab.3
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Feb 2016 14:26:01 -0800 (PST)
From: Filipe Brandenburger <filbranden@google.com>
Subject: [PATCH] modpost: allow modpost to fail on warnings
Date: Wed, 17 Feb 2016 14:25:39 -0800
Message-Id: <1455747939-34515-1-git-send-email-filbranden@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: Filipe Brandenburger <filbranden@google.com>, Greg Thelen <gthelen@google.com>, Michael Davidson <md@google.com>, Eugene Surovegin <surovegin@google.com>

Set KBUILD_MODPOST_FAIL_ON_WARNINGS to a non-empty value to make the
kbuild fail when modpost generates any warnings.

Tested:
  Replaced ntp_clear() with ntp_init() in kernel/time/timekeeping.c,
  which produces a modpost warning since the latter is marked __init.
  Confirmed that the build failed with a hard error.

  $ make bzImage modules KBUILD_MODPOST_FAIL_ON_WARNINGS=1
    CHK     include/config/kernel.release
    CHK     include/generated/uapi/linux/version.h
    CHK     include/generated/utsrelease.h
    CHK     include/generated/bounds.h
    CHK     include/generated/timeconst.h
    CHK     include/generated/asm-offsets.h
    CALL    scripts/checksyscalls.sh
    CHK     include/generated/compile.h
    CC      kernel/time/timekeeping.o
    LD      kernel/time/built-in.o
    LD      kernel/built-in.o
    LINK    vmlinux
    LD      vmlinux.o
    MODPOST vmlinux.o
  WARNING: modpost: Found 1 section mismatch(es).
  To see full details build your kernel with:
  'make CONFIG_DEBUG_SECTION_MISMATCH=y'
  scripts/Makefile.modpost:100: recipe for target 'vmlinux.o' failed
  make[1]: *** [vmlinux.o] Error 2
  Makefile:936: recipe for target 'vmlinux' failed
  make: *** [vmlinux] Error 2

Signed-off-by: Filipe Brandenburger <filbranden@google.com>
Cc: Greg Thelen <gthelen@google.com>
Cc: Michael Davidson <md@google.com>
Cc: Eugene Surovegin <surovegin@google.com>
---
 Documentation/kbuild/kbuild.txt |  5 +++++
 scripts/Makefile.modpost        |  5 ++++-
 scripts/mod/modpost.c           | 13 ++++++++++++-
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 0ff6a466a05b..03d876d7a03d 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -185,6 +185,11 @@ KBUILD_MODPOST_WARN can be set to avoid errors in case of undefined
 symbols in the final module linking stage. It changes such errors
 into warnings.
 
+KBUILD_MODPOST_FAIL_ON_WARNINGS
+--------------------------------------------------
+KBUILD_MODPOST_FAIL_ON_WARNINGS can be set to turn all warnings into
+errors in the final module linking stage.
+
 KBUILD_MODPOST_NOFINAL
 --------------------------------------------------
 KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 1366a94b6c39..516cb20494d2 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -34,6 +34,8 @@
 
 # KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined
 # symbols in the final module linking stage
+# KBUILD_MODPOST_FAIL_ON_WARNINGS can be set to fail whenever modpost
+# generates warnings
 # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
 # This is solely useful to speed up test compiles
 PHONY := _modpost
@@ -78,7 +80,8 @@ modpost = scripts/mod/modpost                    \
  $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
  $(if $(CONFIG_DEBUG_SECTION_MISMATCH),,-S)      \
  $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)  \
- $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w)
+ $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w) \
+ $(if $(KBUILD_MODPOST_FAIL_ON_WARNINGS),-F)
 
 MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 48958d3cec9e..3ec62df4ee6b 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -41,6 +41,9 @@ static int sec_mismatch_verbose = 1;
 static int sec_mismatch_fatal = 0;
 /* ignore missing files */
 static int ignore_missing_files;
+/* Turn warnings into errors */
+static int fail_on_warnings;
+static int warnings_count;
 
 enum export {
 	export_plain,      export_unused,     export_gpl,
@@ -71,6 +74,8 @@ PRINTF void warn(const char *fmt, ...)
 	va_start(arglist, fmt);
 	vfprintf(stderr, fmt, arglist);
 	va_end(arglist);
+
+	warnings_count++;
 }
 
 PRINTF void merror(const char *fmt, ...)
@@ -2389,7 +2394,7 @@ int main(int argc, char **argv)
 	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
 
-	while ((opt = getopt(argc, argv, "i:I:e:mnsST:o:awM:K:E")) != -1) {
+	while ((opt = getopt(argc, argv, "i:I:e:mnsST:o:awFM:K:E")) != -1) {
 		switch (opt) {
 		case 'i':
 			kernel_read = optarg;
@@ -2430,6 +2435,9 @@ int main(int argc, char **argv)
 		case 'w':
 			warn_unresolved = 1;
 			break;
+		case 'F':
+			fail_on_warnings = 1;
+			break;
 		case 'E':
 			sec_mismatch_fatal = 1;
 			break;
@@ -2497,5 +2505,8 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (fail_on_warnings && warnings_count)
+		err |= 2;
+
 	return err;
 }
-- 
2.7.0

