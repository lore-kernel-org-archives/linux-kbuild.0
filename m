Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45155 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfHLVtO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 17:49:14 -0400
Received: by mail-pg1-f195.google.com with SMTP id o13so50130054pgp.12
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Aug 2019 14:49:13 -0700 (PDT)
Date: Mon, 12 Aug 2019 14:49:11 -0700
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] kbuild: Parameterize kallsyms generation and correct
 reporting
Message-ID: <201908121448.4D023D7@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

When kallsyms generation happens, temporary vmlinux outputs are linked
but the quiet make output doesn't report it, giving the impression that
the prior command is taking longer than expected.

Instead, report the KSYM step before the temporary linking. While at it,
this consolidates the repeated "kallsyms generation step" into a single
function and removes the existing copy/pasting.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 scripts/link-vmlinux.sh | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 96b6c0233a61..ed52be015523 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -170,7 +170,6 @@ gen_btf()
 # Create ${2} .o file with all symbols from the ${1} object file
 kallsyms()
 {
-	info KSYM ${2}
 	local kallsymopt;
 
 	if [ -n "${CONFIG_KALLSYMS_ALL}" ]; then
@@ -277,7 +276,22 @@ info MODINFO modules.builtin.modinfo
 ${OBJCOPY} -j .modinfo -O binary vmlinux.o modules.builtin.modinfo
 
 kallsymso=""
+kallsymso_previous=""
 kallsyms_vmlinux=""
+
+# Perform one step in kallsyms generation, including temporary linking of
+# vmlinux.
+kallsyms_step()
+{
+	kallsymso_previous=${kallsymso}
+	kallsymso=.tmp_kallsyms${1}.o
+	kallsyms_vmlinux=.tmp_vmlinux${1}
+
+	info KSYM ${kallsymso}
+	vmlinux_link "${kallsymso_previous}" ${kallsyms_vmlinux}
+	kallsyms ${kallsyms_vmlinux} ${kallsymso}
+}
+
 if [ -n "${CONFIG_KALLSYMS}" ]; then
 
 	# kallsyms support
@@ -303,28 +317,15 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
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
+	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso_previous})
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
 
-- 
2.17.1


-- 
Kees Cook
