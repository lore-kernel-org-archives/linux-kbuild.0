Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:35730 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752810AbbJBRqN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Oct 2015 13:46:13 -0400
Received: by pacfv12 with SMTP id fv12so114452164pac.2
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Oct 2015 10:46:13 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2] modpost: Add flag -E for making section mismatches fatal
Date: Sat,  3 Oct 2015 01:46:03 +0800
Message-Id: <1443807963-36364-1-git-send-email-drinkcat@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Pranith Kumar <bobby.prani@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Davidlohr Bueso <dave@stgolabs.net>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, John Stultz <john.stultz@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, Rusty Russell <rusty@rustcorp.com.au>, Quentin Casasnovas <quentin.casasnovas@oracle.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Chris Metcalf <cmetcalf@ezchip.com>, Takashi Iwai <tiwai@suse.de>, Nicolas Boichat <drinkcat@chromium.org>, Kyle McMartin <kyle@redhat.com>, linux-kernel@vger.kernel.org, Jonathan Kliegman <kliegs@chromium.org>, olofj@chromium.org, Sam Ravnborg <sam@ravnborg.org>

The section mismatch warning can be easy to miss during the kernel build
process. Allow it to be marked as fatal to be easily caught and prevent
bugs from slipping in.

Setting CONFIG_SECTION_MISMATCH_WARN_ONLY=y causes these warnings to be
non-fatal, since there are a number of section mismatches when using
allmodconfig on some architectures, and we do not want to break these
builds by default.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Change-Id: Ic346706e3297c9f0d790e3552aa94e5cff9897a6
---

v2 (Rusty Russell feedback):

 - Renamed flag from -f to -E (-f means force, so we pick -E for error)
 - Renamed config option from SECTION_MISMATCH_WARNING to
   SECTION_MISMATCH_WARN_ONLY

v1:

I'm trying to revive this old patch. When it was first submitted [1],
Jonathan got the following feedback:
 - The logic of the option should be inverted (i.e. SECTION_MISMATCH_WARNING),
   so that is not not enabled in allmodconfig for some architectures that do
   have section mismatches. I've seen some failures (namely, on arm64), so I
   did that.
 - CONFIG_DEBUG_SECTION_MISMATCH should be removed and warnings should always
   be shown verbosely. This option does 3 things:
     1. Enable -fno-inline-functions-called-onc
     2. Run the section mismatch analysis for each module/built-in.o
     3. Enable verbose reporting from modpost
   We definitely do not want 1 by default, so I think we should keep the option.
   If we enable 2 & 3 by default, which I think would be reasonable, then the
   option name does not make much sense anymore, and I'm not sure what to do
   with the documentation that is currently provided in the Kconfig description.

Tested on x86-64 allmodconfig, setting the option to =n, and creating a
section mismatch by running:
sed -i -e 's/\(ssize_t soc_codec_reg_show\)/__init \1/' sound/soc/soc-core.c

Applies on linux-next/20151002

[1] http://thread.gmane.org/gmane.linux.kbuild.devel/9044

 lib/Kconfig.debug        |  9 +++++++++
 scripts/Makefile.modpost |  1 +
 scripts/mod/modpost.c    | 24 +++++++++++++++++-------
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d190d44..e3b43ab 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -311,6 +311,15 @@ config DEBUG_SECTION_MISMATCH
 	  - Enable verbose reporting from modpost in order to help resolve
 	    the section mismatches that are reported.
 
+config SECTION_MISMATCH_WARN_ONLY
+	bool "Make section mismatch errors non-fatal"
+	default y
+	help
+	  If you say N here, the build process will fail if there are any
+	  section mismatch, instead of just throwing warnings.
+
+	  If unsure, say Y.
+
 #
 # Select this config option from the architecture Kconfig, if it
 # is preferred to always offer frame pointers as a config
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 9c40dae..a5b42fb 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -77,6 +77,7 @@ modpost = scripts/mod/modpost                    \
  $(if $(KBUILD_EXTRA_SYMBOLS), $(patsubst %, -e %,$(KBUILD_EXTRA_SYMBOLS))) \
  $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
  $(if $(CONFIG_DEBUG_SECTION_MISMATCH),,-S)      \
+ $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)  \
  $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w) \
  $(if $(CONFIG_LTO),-w)
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d583c98..b2ae8af 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -38,6 +38,7 @@ static int warn_unresolved = 0;
 /* How a symbol is exported */
 static int sec_mismatch_count = 0;
 static int sec_mismatch_verbose = 1;
+static int sec_mismatch_fatal = 0;
 /* ignore missing files */
 static int ignore_missing_files;
 
@@ -2385,7 +2386,7 @@ int main(int argc, char **argv)
 	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
 
-	while ((opt = getopt(argc, argv, "i:I:e:mnsST:o:awM:K:")) != -1) {
+	while ((opt = getopt(argc, argv, "i:I:e:mnsST:o:awM:K:E")) != -1) {
 		switch (opt) {
 		case 'i':
 			kernel_read = optarg;
@@ -2426,6 +2427,9 @@ int main(int argc, char **argv)
 		case 'w':
 			warn_unresolved = 1;
 			break;
+		case 'E':
+			sec_mismatch_fatal = 1;
+			break;
 		default:
 			exit(1);
 		}
@@ -2475,14 +2479,20 @@ int main(int argc, char **argv)
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
+			      "Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.\n");
+		}
+	}
 
 	return err;
 }
-- 
2.6.0.rc2.230.g3dd15c0

