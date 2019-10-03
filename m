Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33210 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728457AbfJCDSe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 23:18:34 -0400
Received: by mail-pl1-f193.google.com with SMTP id d22so814913pls.0
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2019 20:18:33 -0700 (PDT)
Message-Id: <20191003031312.252507322@gmail.com>
Date: Wed, 02 Oct 2019 20:13:13 -0700
From: rd.dunlab@gmail.com
Subject: [PATCH 1/4] scripts: namespace.pl: handle lib-ksyms.o as lib.a
References: <20191003031312.157994411@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline; filename=scr-namespace-check-fix002.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rd.dunlab@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, rdunlap@infradead.org

Fix these warnings:
  No source file found for drivers/firmware/efi/libstub/lib-ksyms.o
  No source file found for arch/x86/lib/lib-ksyms.o
  No source file found for lib/lib-ksyms.o

In scripts/Makefile.build, any resulting lib-ksyms.o file is renamed to
lib.a, so handle that rename here also.

Signed-off-by: Randy Dunlap <rd.dunlab@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
patch 1/4:
 scripts/namespace.pl |    3 +++
 1 file changed, 3 insertions(+)

--- linux-next-20191002.orig/scripts/namespace.pl
+++ linux-next-20191002/scripts/namespace.pl
@@ -231,6 +231,9 @@ sub do_nm
 		return;
 	}
 	($source = $basename) =~ s/\.o$//;
+	if ($basename eq "lib-ksyms.o") { # modified in scripts/Makefile.build
+		$basename = "lib.a";	# from lib.a to lib-ksyms.o
+	}
 	if (-e "$source.c" || -e "$source.S") {
 		$source = File::Spec->catfile($objtree, $File::Find::dir, $source)
 	} else {
