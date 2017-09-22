Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:56788 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751637AbdIVFdC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Sep 2017 01:33:02 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kbuild: link-vmlinux.sh: simplify .version increment
Date: Fri, 22 Sep 2017 14:31:13 +0900
Message-Id: <1506058274-30516-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org

Since commit 1f2bfbd00e46 ("kbuild: link of vmlinux moved to a
script"), it is easy to increment .version without using a temporary
file .old_version.

I do not see anybody who creates .tmp_version any more.  Probably
it is a left-over of commit 4e25d8bb9550fb ("[PATCH] kbuild: adjust
.version updating").  Just remove it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                |  2 +-
 scripts/link-vmlinux.sh | 15 +++++----------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 64cbc66..9e2781d 100644
--- a/Makefile
+++ b/Makefile
@@ -1278,7 +1278,7 @@ CLEAN_DIRS  += $(MODVERDIR)
 # Directories & files removed with 'make mrproper'
 MRPROPER_DIRS  += include/config usr/include include/generated          \
 		  arch/*/include/generated .tmp_objdiff
-MRPROPER_FILES += .config .config.old .version .old_version \
+MRPROPER_FILES += .config .config.old .version \
 		  Module.symvers tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS \
 		  signing_key.pem signing_key.priv signing_key.x509	\
 		  x509.genkey extra_certificates signing_key.x509.keyid	\
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index e7b7eee..0cdb25b 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -187,10 +187,8 @@ sortextable()
 # Delete output files in case of error
 cleanup()
 {
-	rm -f .old_version
 	rm -f .tmp_System.map
 	rm -f .tmp_kallsyms*
-	rm -f .tmp_version
 	rm -f .tmp_vmlinux*
 	rm -f built-in.o
 	rm -f System.map
@@ -238,12 +236,12 @@ esac
 
 # Update version
 info GEN .version
-if [ ! -r .version ]; then
-	rm -f .version;
-	echo 1 >.version;
+if [ -r .version ]; then
+	VERSION=$(expr 0$(cat .version) + 1)
+	echo $VERSION > .version
 else
-	mv .version .old_version;
-	expr 0$(cat .old_version) + 1 >.version;
+	rm -f .version
+	echo 1 > .version
 fi;
 
 # final build of init/
@@ -331,6 +329,3 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
 		exit 1
 	fi
 fi
-
-# We made a new kernel - delete old version file
-rm -f .old_version
-- 
2.7.4

