Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f170.google.com ([209.85.210.170]:35154 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbfJCDSq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 23:18:46 -0400
Received: by mail-pf1-f170.google.com with SMTP id 205so796815pfw.2
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2019 20:18:46 -0700 (PDT)
Message-Id: <20191003031312.313485229@gmail.com>
Date: Wed, 02 Oct 2019 20:13:14 -0700
From: rd.dunlab@gmail.com
Subject: [PATCH 2/4] scripts: namespace.pl: add some x86 object files to nmexception
References: <20191003031312.157994411@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline; filename=scr-namespace-x86-excepts.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rd.dunlab@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, rdunlap@infradead.org

These x86 object files do not have any exports or public symbols
so they can be excluded from the namespace checking.

Signed-off-by: Randy Dunlap <rd.dunlab@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
patch 2/4:
 scripts/namespace.pl |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20191002.orig/scripts/namespace.pl
+++ linux-next-20191002/scripts/namespace.pl
@@ -91,6 +91,8 @@ my %nmexception = (
     'arch/x86/lib/thunk_32'		=> 1,
     'arch/x86/lib/cmpxchg'		=> 1,
     'arch/x86/vdso/vdso32/note'		=> 1,
+    'arch/x86/entry/vdso/vdso-note.o'	=> 1,
+    'arch/x86/entry/vdso/vdso32/note.o'	=> 1,
     'lib/irq_regs'			=> 1,
     'usr/initramfs_data'		=> 1,
     'drivers/scsi/aic94xx/aic94xx_dump'	=> 1,
