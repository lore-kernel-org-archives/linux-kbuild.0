Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:58511 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfLRQFZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 11:05:25 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: use pattern rule for building built-in.a in sub-directories
Date: Thu, 19 Dec 2019 01:05:14 +0900
Message-Id: <20191218160514.28124-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The built-in.a in a sub-directory is created by descending into that
directory. It does not depend on the other sub-directories. Loosen
the dependency.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index e46b4ee9a120..a562d695f0fa 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -372,7 +372,7 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
 # ---------------------------------------------------------------------------
 
 # To build objects in subdirs, we need to descend into the directories
-$(sort $(subdir-obj-y)): $(subdir-ym) ;
+$(obj)/%/built-in.a: $(obj)/% ;
 
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
-- 
2.17.1
