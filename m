Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:36347 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934743AbcKWQmX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2016 11:42:23 -0500
Received: by mail-pg0-f67.google.com with SMTP id x23so1425392pgx.3
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2016 08:42:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 7/7] kbuild: minor improvement for thin archives build
Date: Thu, 24 Nov 2016 03:41:43 +1100
Message-Id: <20161123164143.16839-8-npiggin@gmail.com>
In-Reply-To: <20161123164143.16839-1-npiggin@gmail.com>
References: <20161123164143.16839-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org

The root built-in.o archive is currently generated before all object
files are built for the final link, due to final build of init/ after
version update. In practice it seems like it doesn't matter because
the archive symbol table does not change, but it is more logical to
create the final archive as the last step.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/link-vmlinux.sh | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 6b94fe4..c802913 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -209,15 +209,6 @@ case "${KCONFIG_CONFIG}" in
 	. "./${KCONFIG_CONFIG}"
 esac
 
-archive_builtin
-
-#link vmlinux.o
-info LD vmlinux.o
-modpost_link vmlinux.o
-
-# modpost vmlinux.o to check for section mismatches
-${MAKE} -f "${srctree}/scripts/Makefile.modpost" vmlinux.o
-
 # Update version
 info GEN .version
 if [ ! -r .version ]; then
@@ -231,6 +222,15 @@ fi;
 # final build of init/
 ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init GCC_PLUGINS_CFLAGS="${GCC_PLUGINS_CFLAGS}"
 
+archive_builtin
+
+#link vmlinux.o
+info LD vmlinux.o
+modpost_link vmlinux.o
+
+# modpost vmlinux.o to check for section mismatches
+${MAKE} -f "${srctree}/scripts/Makefile.modpost" vmlinux.o
+
 kallsymso=""
 kallsyms_vmlinux=""
 if [ -n "${CONFIG_KALLSYMS}" ]; then
-- 
2.10.2

