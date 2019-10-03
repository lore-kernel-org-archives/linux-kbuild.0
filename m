Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f178.google.com ([209.85.214.178]:34993 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbfJCDSv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 23:18:51 -0400
Received: by mail-pl1-f178.google.com with SMTP id y10so811507plp.2
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2019 20:18:51 -0700 (PDT)
Message-Id: <20191003031312.374601455@gmail.com>
Date: Wed, 02 Oct 2019 20:13:15 -0700
From: rd.dunlab@gmail.com
Subject: [PATCH 3/4] scripts: namespace.pl: add .o to nmexception file names and fix "acpica"
References: <20191003031312.157994411@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline; filename=scr-namespace-fix-excepts.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rd.dunlab@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, rdunlap@infradead.org

'nm' exceptions are checked against $fullname, which includes the
trailing '.o', so the list of file names should include the trailing
'.o'.
Also, the sub-directory for drivers/acpi/acpica/ has a typo, so
s/acpia/acpica/g.

The acpica list of exceptions almost surely needs to be updated.

Signed-off-by: Randy Dunlap <rd.dunlab@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
patch 3/4:
 scripts/namespace.pl |   42 ++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

--- linux-next-20191002.orig/scripts/namespace.pl
+++ linux-next-20191002/scripts/namespace.pl
@@ -86,29 +86,29 @@ my %ref = ();		# $ref{$name} exists if t
 my %export = ();	# $export{$name} exists if there is an EXPORT_... of $name
 
 my %nmexception = (
-    'fs/ext3/bitmap'			=> 1,
-    'fs/ext4/bitmap'			=> 1,
-    'arch/x86/lib/thunk_32'		=> 1,
-    'arch/x86/lib/cmpxchg'		=> 1,
-    'arch/x86/vdso/vdso32/note'		=> 1,
+    'fs/ext3/bitmap.o'			=> 1,
+    'fs/ext4/bitmap.o'			=> 1,
+    'arch/x86/lib/thunk_32.o'		=> 1,
+    'arch/x86/lib/cmpxchg.o'		=> 1,
+    'arch/x86/vdso/vdso32/note.o'	=> 1,
     'arch/x86/entry/vdso/vdso-note.o'	=> 1,
     'arch/x86/entry/vdso/vdso32/note.o'	=> 1,
-    'lib/irq_regs'			=> 1,
-    'usr/initramfs_data'		=> 1,
-    'drivers/scsi/aic94xx/aic94xx_dump'	=> 1,
-    'drivers/scsi/libsas/sas_dump'	=> 1,
-    'lib/dec_and_lock'			=> 1,
-    'drivers/ide/ide-probe-mini'	=> 1,
-    'usr/initramfs_data'		=> 1,
-    'drivers/acpi/acpia/exdump'		=> 1,
-    'drivers/acpi/acpia/rsdump'		=> 1,
-    'drivers/acpi/acpia/nsdumpdv'	=> 1,
-    'drivers/acpi/acpia/nsdump'		=> 1,
-    'arch/ia64/sn/kernel/sn2/io'	=> 1,
-    'arch/ia64/kernel/gate-data'	=> 1,
-    'security/capability'		=> 1,
-    'fs/ntfs/sysctl'			=> 1,
-    'fs/jfs/jfs_debug'			=> 1,
+    'lib/irq_regs.o'			=> 1,
+    'usr/initramfs_data.o'		=> 1,
+    'drivers/scsi/aic94xx/aic94xx_dump.o' => 1,
+    'drivers/scsi/libsas/sas_dump.o'	=> 1,
+    'lib/dec_and_lock.o'		=> 1,
+    'drivers/ide/ide-probe-mini.o'	=> 1,
+    'usr/initramfs_data.o'		=> 1,
+    'drivers/acpi/acpica/exdump.o'	=> 1,
+    'drivers/acpi/acpica/rsdump.o'	=> 1,
+    'drivers/acpi/acpica/nsdumpdv.o'	=> 1,
+    'drivers/acpi/acpica/nsdump.o'	=> 1,
+    'arch/ia64/sn/kernel/sn2/io.o'	=> 1,
+    'arch/ia64/kernel/gate-data.o'	=> 1,
+    'security/capability.o'		=> 1,
+    'fs/ntfs/sysctl.o'			=> 1,
+    'fs/jfs/jfs_debug.o'		=> 1,
 );
 
 my %nameexception = (
