Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:32044 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751970AbcKGL1s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Nov 2016 06:27:48 -0500
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] kbuild: Always build modules when CONFIG_TRIM_UNUSED_KSYMS=y
Date: Mon, 7 Nov 2016 11:27:10 +0000
Message-ID: <20161107112711.14135-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Paul Burton <paul.burton@imgtec.com>, Michal Marek <mmarek@suse.com>

If CONFIG_TRIM_UNUSED_KSYMS is enabled and we build the kernel with a
specific target, eg. "make vmlinux" rather than simply "make", we need
to build module source in order to generate the .mod files in $MODVERDIR
(.tmp_versions/). Without doing so we:

1) Trigger an error from sed due to the missing files during the build
   of vmlinux:

   CHK     include/generated/autoksyms.h
   sed: can't read .tmp_versions/*.mod: No such file or directory

2) Discard all symbol exports since we kept no record of which ones may
   be used:

   $ nm vmlinux | grep ksymtab
   8069c9b8 R __start___ksymtab
   8069c9b8 R __start___ksymtab_gpl
   8069c9b8 R __start___ksymtab_gpl_future
   8069c9b8 R __start___ksymtab_unused
   8069c9b8 R __start___ksymtab_unused_gpl
   8069c9b8 R __stop___ksymtab
   8069c9b8 R __stop___ksymtab_gpl
   8069c9b8 R __stop___ksymtab_gpl_future
   8069c9b8 R __stop___ksymtab_unused
   8069c9b8 R __stop___ksymtab_unused_gpl

3) Fail to build modules if we then run "make modules", since the
   modules reference symbols which we have discarded:

   ERROR: "pnfs_unregister_layoutdriver"
   [fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko] undefined!
   ERROR: "nfs4_schedule_session_recovery"
   [fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko] undefined!
   ...

Fix this by ensuring that we build modules as part of the main kernel
build by setting KBUILD_MODULES to 1 when CONFIG_TRIM_UNUSED_KSYMS is
enabled, regardless of what was specified as the make target. Doing this
involves exporting KBUILD_MODULES from the main Makefile after having
read the configuration, later than it was previously exported.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org

---

 Makefile | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f97f786..ce1b44a 100644
--- a/Makefile
+++ b/Makefile
@@ -336,7 +336,7 @@ ifeq ($(MAKECMDGOALS),)
   KBUILD_MODULES := 1
 endif
 
-export KBUILD_MODULES KBUILD_BUILTIN
+export KBUILD_BUILTIN
 export KBUILD_CHECKSRC KBUILD_SRC KBUILD_EXTMOD
 
 # We need some generic definitions (do not try to remake the file).
@@ -606,6 +606,16 @@ else
 include/config/auto.conf: ;
 endif # $(dot-config)
 
+# If we're using CONFIG_TRIM_UNUSED_KSYMS then we need to compile
+# modules in order to generate the .mod files in $MODVERDIR so that
+# we know which symbols to export.
+
+ifdef CONFIG_TRIM_UNUSED_KSYMS
+  KBUILD_MODULES := 1
+endif
+
+export KBUILD_MODULES
+
 # The all: target is the default when no target is given on the
 # command line.
 # This allow a user to issue only 'make' to build a kernel including modules
-- 
2.10.2

