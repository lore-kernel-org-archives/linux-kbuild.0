Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:40967 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753540AbeA1W73 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jan 2018 17:59:29 -0500
Received: by mail-pf0-f194.google.com with SMTP id c6so3233259pfi.8
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2018 14:59:29 -0800 (PST)
Received: from localhost ([2601:647:5100:1da4::70af])
        by smtp.gmail.com with ESMTPSA id k90sm27378345pfk.171.2018.01.28.14.59.28
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jan 2018 14:59:28 -0800 (PST)
From: Michael Forney <mforney@mforney.org>
Subject: [PATCH] kbuild: Use ls(1) instead of stat(1) to obtain file size
Date: Sun, 28 Jan 2018 14:58:38 -0800
Message-Id: <20180128225838.1275-1-mforney@mforney.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

From: Michael Forney <forney@google.com>

stat(1) is not standardized and different implementations have their own
(conflicting) flags for querying the size of a file.

ls(1) provides the same information (value of st.st_size) in the 5th column,
except when the file is a character or block device.
---
 scripts/Makefile.lib    | 3 ++-
 scripts/link-vmlinux.sh | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 7dee1da83e2a..24566d1c10d2 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -319,7 +319,8 @@ dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 size_append = printf $(shell						\
 dec_size=0;								\
 for F in $1; do								\
-	fsize=$$(stat -c "%s" $$F);					\
+	set -- $$(ls -dn $$F);						\
+	fsize=$$5;							\
 	dec_size=$$(expr $$dec_size + $$fsize);				\
 done;									\
 printf "%08x\n" $$dec_size |						\
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index c0d129d7f430..4a5737647a79 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -296,8 +296,10 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
 	kallsyms .tmp_vmlinux2 .tmp_kallsyms2.o
 
 	# step 3
-	size1=$(stat -c "%s" .tmp_kallsyms1.o)
-	size2=$(stat -c "%s" .tmp_kallsyms2.o)
+	set -- $(ls -dn .tmp_kallsyms1.o)
+	size1=$5
+	set -- $(ls -dn .tmp_kallsyms2.o)
+	size2=$5
 
 	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
 		kallsymso=.tmp_kallsyms3.o
-- 
2.15.1

