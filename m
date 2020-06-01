Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40027 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 28/37] modpost: remove -s option
Date: Mon,  1 Jun 2020 14:57:22 +0900
Message-Id: <20200601055731.3006266-28-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

The -s option was added by commit 8d8d8289df65 ("kbuild: do not do
section mismatch checks on vmlinux in 2nd pass").

Now that the second pass does not parse vmlinux, this option is
unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost |  2 +-
 scripts/mod/modpost.c    | 10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 16fe19724c34..bc9a03e8208d 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -62,7 +62,7 @@ __modpost: vmlinux.symvers
 
 else
 
-MODPOST += -s \
+MODPOST += \
 	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
 
 ifeq ($(KBUILD_EXTMOD),)
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 93019349f022..b667f531a645 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -30,8 +30,6 @@ static int have_vmlinux = 0;
 static int all_versions = 0;
 /* If we are modposting external module set to 1 */
 static int external_module = 0;
-/* Warn about section mismatch in vmlinux if set to 1 */
-static int vmlinux_section_warnings = 1;
 /* Only warn about unresolved symbols */
 static int warn_unresolved = 0;
 /* How a symbol is exported */
@@ -2078,8 +2076,7 @@ static void read_symbols(const char *modname)
 		}
 	}
 
-	if (!is_vmlinux(modname) || vmlinux_section_warnings)
-		check_sec_ref(mod, modname, &info);
+	check_sec_ref(mod, modname, &info);
 
 	if (!is_vmlinux(modname)) {
 		version = get_modinfo(&info, "version");
@@ -2576,7 +2573,7 @@ int main(int argc, char **argv)
 	struct dump_list *dump_read_start = NULL;
 	struct dump_list **dump_read_iter = &dump_read_start;
 
-	while ((opt = getopt(argc, argv, "ei:mnsT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = 1;
@@ -2599,9 +2596,6 @@ int main(int argc, char **argv)
 		case 'a':
 			all_versions = 1;
 			break;
-		case 's':
-			vmlinux_section_warnings = 0;
-			break;
 		case 'T':
 			files_source = optarg;
 			break;
-- 
2.25.1
