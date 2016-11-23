Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33145 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933872AbcKWQmE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2016 11:42:04 -0500
Received: by mail-pf0-f195.google.com with SMTP id 144so865538pfv.0
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2016 08:42:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 1/7] kbuild: kallsyms allow 3-pass generation if symbols size has changed
Date: Thu, 24 Nov 2016 03:41:37 +1100
Message-Id: <20161123164143.16839-2-npiggin@gmail.com>
In-Reply-To: <20161123164143.16839-1-npiggin@gmail.com>
References: <20161123164143.16839-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org

kallsyms generation is not foolproof, due to some linkers adding
symbols (e.g., branch trampolines) when a binary size changes.
Have it attempt a 3rd pass automatically if the kallsyms size changes
in the 2nd pass.

This allows powerpc64 allyesconfig to build without adding another
pass when it's not required.

This can be solved other ways by directing the linker not to add labels
on branch stubs, or to move kallsyms near the end of the image. The
former is undesirable for debugging/tracing, and the latter is a more
significant change that requires more testing and review.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/link-vmlinux.sh | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index f742c65..6b94fe4 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -246,10 +246,14 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
 	#     the right size, but due to the added section, some
 	#     addresses have shifted.
 	#     From here, we generate a correct .tmp_kallsyms2.o
-	# 2a) We may use an extra pass as this has been necessary to
-	#     woraround some alignment related bugs.
-	#     KALLSYMS_EXTRA_PASS=1 is used to trigger this.
-	# 3)  The correct ${kallsymso} is linked into the final vmlinux.
+	# 3)  That link may have expanded the kernel image enough that
+	#     more linker branch stubs / trampolines had to be added, which
+	#     introduces new names, which further expands kallsyms. Do another
+	#     pass if that is the case. In theory it's possible this results
+	#     in even more stubs, but unlikely.
+	#     KALLSYMS_EXTRA_PASS=1 may also used to debug or work around
+	#     other bugs.
+	# 4)  The correct ${kallsymso} is linked into the final vmlinux.
 	#
 	# a)  Verify that the System.map from vmlinux matches the map from
 	#     ${kallsymso}.
@@ -265,8 +269,11 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
 	vmlinux_link .tmp_kallsyms1.o .tmp_vmlinux2
 	kallsyms .tmp_vmlinux2 .tmp_kallsyms2.o
 
-	# step 2a
-	if [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
+	# step 3
+	size1=$(stat -c "%s" .tmp_kallsyms1.o)
+	size2=$(stat -c "%s" .tmp_kallsyms2.o)
+
+	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
 		kallsymso=.tmp_kallsyms3.o
 		kallsyms_vmlinux=.tmp_vmlinux3
 
-- 
2.10.2

