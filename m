Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45632 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729855AbfHMPPe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 11:15:34 -0400
Received: by mail-pg1-f195.google.com with SMTP id o13so51403745pgp.12
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 08:15:34 -0700 (PDT)
Date: Tue, 13 Aug 2019 08:15:32 -0700
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v2] kbuild: Parameterize kallsyms generation and correct
 reporting
Message-ID: <201908130812.45DE9AE8@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

When kallsyms generation happens, temporary vmlinux outputs are linked
but the quiet make output didn't report it, giving the impression that
the prior command is taking longer than expected.

Instead, report the linking step explicitly. While at it, this
consolidates the repeated "kallsyms generation step" into a single
function and removes the existing copy/pasting.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
v2:
- rename $kallsymso_previous to $kallsymso_prev (Masahiro)
- move location of kallsyms_step() (Masahiro)
- report linking step instead of folding it into KSYM (Masahiro)
---
 scripts/link-vmlinux.sh | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index a7124f895b24..0b08bfb88f74 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -60,6 +60,7 @@ modpost_link()
 # ${2} - output file
 vmlinux_link()
 {
+	info LD ${2}
 	local lds="${objtree}/${KBUILD_LDS}"
 	local objects
 
@@ -138,6 +139,18 @@ kallsyms()
 	${CC} ${aflags} -c -o ${2} ${afile}
 }
 
+# Perform one step in kallsyms generation, including temporary linking of
+# vmlinux.
+kallsyms_step()
+{
+	kallsymso_prev=${kallsymso}
+	kallsymso=.tmp_kallsyms${1}.o
+	kallsyms_vmlinux=.tmp_vmlinux${1}
+
+	vmlinux_link "${kallsymso_prev}" ${kallsyms_vmlinux}
+	kallsyms ${kallsyms_vmlinux} ${kallsymso}
+}
+
 # Create map file with all symbols from ${1}
 # See mksymap for additional details
 mksysmap()
@@ -216,6 +229,7 @@ info MODINFO modules.builtin.modinfo
 ${OBJCOPY} -j .modinfo -O binary vmlinux.o modules.builtin.modinfo
 
 kallsymso=""
+kallsymso_prev=""
 kallsyms_vmlinux=""
 if [ -n "${CONFIG_KALLSYMS}" ]; then
 
@@ -242,32 +256,18 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
 	# a)  Verify that the System.map from vmlinux matches the map from
 	#     ${kallsymso}.
 
-	kallsymso=.tmp_kallsyms2.o
-	kallsyms_vmlinux=.tmp_vmlinux2
-
-	# step 1
-	vmlinux_link "" .tmp_vmlinux1
-	kallsyms .tmp_vmlinux1 .tmp_kallsyms1.o
-
-	# step 2
-	vmlinux_link .tmp_kallsyms1.o .tmp_vmlinux2
-	kallsyms .tmp_vmlinux2 .tmp_kallsyms2.o
+	kallsyms_step 1
+	kallsyms_step 2
 
 	# step 3
-	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" .tmp_kallsyms1.o)
-	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" .tmp_kallsyms2.o)
+	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso_prev})
+	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
 
 	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
-		kallsymso=.tmp_kallsyms3.o
-		kallsyms_vmlinux=.tmp_vmlinux3
-
-		vmlinux_link .tmp_kallsyms2.o .tmp_vmlinux3
-
-		kallsyms .tmp_vmlinux3 .tmp_kallsyms3.o
+		kallsyms_step 3
 	fi
 fi
 
-info LD vmlinux
 vmlinux_link "${kallsymso}" vmlinux
 
 if [ -n "${CONFIG_DEBUG_INFO_BTF}" ]; then
-- 
2.17.1


-- 
Kees Cook
