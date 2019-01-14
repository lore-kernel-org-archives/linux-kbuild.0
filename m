Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:34177 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbfAND2u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 13 Jan 2019 22:28:50 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kbuild: remove top-level built-in.a
Date: Mon, 14 Jan 2019 12:27:58 +0900
Message-Id: <1547436479-10491-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The symbol table in the final archive is unneeded because it is passed
to the linker after the --whole-archive option. Every object file in
the archive is included in the link anyway.

Pass thin archives from subdirectories directly to the linker, and
remove the final archiving step.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/link-vmlinux.sh | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index c8cf453..4788def 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -44,24 +44,6 @@ info()
 	fi
 }
 
-# Thin archive build here makes a final archive with symbol table and indexes
-# from vmlinux objects INIT and MAIN, which can be used as input to linker.
-# KBUILD_VMLINUX_LIBS archives should already have symbol table and indexes
-# added.
-#
-# Traditional incremental style of link does not require this step
-#
-# built-in.a output file
-#
-archive_builtin()
-{
-	info AR built-in.a
-	rm -f built-in.a;
-	${AR} rcsTP${KBUILD_ARFLAGS} built-in.a			\
-				${KBUILD_VMLINUX_INIT}		\
-				${KBUILD_VMLINUX_MAIN}
-}
-
 # Link of vmlinux.o used for section mismatch analysis
 # ${1} output file
 modpost_link()
@@ -69,7 +51,8 @@ modpost_link()
 	local objects
 
 	objects="--whole-archive				\
-		built-in.a					\
+		${KBUILD_VMLINUX_INIT}				\
+		${KBUILD_VMLINUX_MAIN}				\
 		--no-whole-archive				\
 		--start-group					\
 		${KBUILD_VMLINUX_LIBS}				\
@@ -88,7 +71,8 @@ vmlinux_link()
 
 	if [ "${SRCARCH}" != "um" ]; then
 		objects="--whole-archive			\
-			built-in.a				\
+			${KBUILD_VMLINUX_INIT}			\
+			${KBUILD_VMLINUX_MAIN}			\
 			--no-whole-archive			\
 			--start-group				\
 			${KBUILD_VMLINUX_LIBS}			\
@@ -99,7 +83,8 @@ vmlinux_link()
 			-T ${lds} ${objects}
 	else
 		objects="-Wl,--whole-archive			\
-			built-in.a				\
+			${KBUILD_VMLINUX_INIT}			\
+			${KBUILD_VMLINUX_MAIN}			\
 			-Wl,--no-whole-archive			\
 			-Wl,--start-group			\
 			${KBUILD_VMLINUX_LIBS}			\
@@ -160,7 +145,6 @@ cleanup()
 	rm -f .tmp_System.map
 	rm -f .tmp_kallsyms*
 	rm -f .tmp_vmlinux*
-	rm -f built-in.a
 	rm -f System.map
 	rm -f vmlinux
 	rm -f vmlinux.o
@@ -217,8 +201,6 @@ fi;
 # final build of init/
 ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init
 
-archive_builtin
-
 #link vmlinux.o
 info LD vmlinux.o
 modpost_link vmlinux.o
-- 
2.7.4
