Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:44512 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754258AbeCSAzE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Mar 2018 20:55:04 -0400
Received: by mail-pl0-f66.google.com with SMTP id 9-v6so9241888ple.11
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Mar 2018 17:55:04 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
Subject: [PATCH v2] kbuild: Use ls(1) instead of stat(1) to obtain file size
Date: Sun, 18 Mar 2018 17:54:02 -0700
Message-Id: <20180319005402.30495-1-mforney@mforney.org>
In-Reply-To: <20180128225838.1275-1-mforney@mforney.org>
References: <20180128225838.1275-1-mforney@mforney.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org

From: Michael Forney <forney@google.com>

stat(1) is not standardized and different implementations have their own
(conflicting) flags for querying the size of a file.

ls(1) provides the same information (value of st.st_size) in the 5th
column, except when the file is a character or block device. This output
is standardized[0]. The -n option turns on -l, which writes lines
formatted like

  "%s %u %s %s %u %s %s\n", <file mode>, <number of links>,
      <owner name>, <group name>, <size>, <date and time>,
      <pathname>

but instead of writing the <owner name> and <group name>, it writes the
numeric owner and group IDs (this avoids /etc/passwd and /etc/group
lookups as well as potential field splitting issues).

The <size> field is specified as "the value that would be returned for
the file in the st_size field of struct stat".

To avoid duplicating logic in several locations in the tree, create
scripts/file-size.sh and update callers to use that instead of stat(1).

[0] http://pubs.opengroup.org/onlinepubs/9699919799/utilities/ls.html#tag_20_73_10

Signed-off-by: Michael Forney <forney@google.com>
---
Changes in v2:
* Use a wrapper script instead of calling ls(1) directly.
* Also replace a couple of other instances of `stat -c '%s'`.
* Update description with justification of ls(1) usage.

 arch/arm/boot/deflate_xip_data.sh            | 2 +-
 arch/powerpc/boot/wrapper                    | 2 +-
 scripts/Makefile.lib                         | 2 +-
 scripts/file-size.sh                         | 4 ++++
 scripts/link-vmlinux.sh                      | 4 ++--
 tools/testing/selftests/efivarfs/efivarfs.sh | 2 +-
 6 files changed, 10 insertions(+), 6 deletions(-)
 create mode 100755 scripts/file-size.sh

diff --git a/arch/arm/boot/deflate_xip_data.sh b/arch/arm/boot/deflate_xip_data.sh
index 1189598a25eb..07adfc734fa3 100755
--- a/arch/arm/boot/deflate_xip_data.sh
+++ b/arch/arm/boot/deflate_xip_data.sh
@@ -45,7 +45,7 @@ data_start=$(($__data_loc - $base_offset))
 data_end=$(($_edata_loc - $base_offset))
 
 # Make sure data occupies the last part of the file.
-file_end=$(stat -c "%s" "$XIPIMAGE")
+file_end=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" "$XIPIMAGE")
 if [ "$file_end" != "$data_end" ]; then
 	printf "end of xipImage doesn't match with _edata_loc (%#x vs %#x)\n" \
 	       $(($file_end + $base_offset)) $_edata_loc 2>&1
diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 76fe3ccfd381..f9141eaec6ff 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -355,7 +355,7 @@ vmz="$tmpdir/`basename \"$kernel\"`.$ext"
 
 # Calculate the vmlinux.strip size
 ${CROSS}objcopy $objflags "$kernel" "$vmz.$$"
-strip_size=$(stat -c %s $vmz.$$)
+strip_size=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" "$vmz.$$")
 
 if [ -z "$cacheit" -o ! -f "$vmz$compression" -o "$vmz$compression" -ot "$kernel" ]; then
     # recompress the image if we need to
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 7dee1da83e2a..5f74eafa2daa 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -319,7 +319,7 @@ dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 size_append = printf $(shell						\
 dec_size=0;								\
 for F in $1; do								\
-	fsize=$$(stat -c "%s" $$F);					\
+	fsize=$$($(CONFIG_SHELL) $(srctree)/scripts/file-size.sh $$F);	\
 	dec_size=$$(expr $$dec_size + $$fsize);				\
 done;									\
 printf "%08x\n" $$dec_size |						\
diff --git a/scripts/file-size.sh b/scripts/file-size.sh
new file mode 100755
index 000000000000..7eb7423416b5
--- /dev/null
+++ b/scripts/file-size.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+set -- $(ls -dn "$1")
+printf '%s\n' "$5"
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index c0d129d7f430..573d2ea88842 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -296,8 +296,8 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
 	kallsyms .tmp_vmlinux2 .tmp_kallsyms2.o
 
 	# step 3
-	size1=$(stat -c "%s" .tmp_kallsyms1.o)
-	size2=$(stat -c "%s" .tmp_kallsyms2.o)
+	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" .tmp_kallsyms1.o)
+	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" .tmp_kallsyms2.o)
 
 	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
 		kallsymso=.tmp_kallsyms3.o
diff --git a/tools/testing/selftests/efivarfs/efivarfs.sh b/tools/testing/selftests/efivarfs/efivarfs.sh
index c6d5790575ae..0bcec427edba 100755
--- a/tools/testing/selftests/efivarfs/efivarfs.sh
+++ b/tools/testing/selftests/efivarfs/efivarfs.sh
@@ -53,7 +53,7 @@ test_create()
 		exit 1
 	fi
 
-	if [ $(stat -c %s $file) -ne 5 ]; then
+	if [ "$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" "$file")" -ne 5 ]; then
 		echo "$file has invalid size" >&2
 		exit 1
 	fi
-- 
2.16.2

