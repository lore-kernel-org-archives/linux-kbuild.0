Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbgDNBVl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Apr 2020 21:21:41 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10B3AC0A3BE2
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2020 18:21:40 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id f13so8786212qti.5
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2020 18:21:40 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
Subject: [PATCH v2] kbuild: ensure mrproper removes arch/$(SUBARCH)/include/generated/
Date: Mon, 13 Apr 2020 22:21:32 -0300
Message-Id: <20200414012132.32721-1-vitor@massaru.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org, michal.lkml@markovi.net, linux-kernel@vger.kernel.org, brendanhiggins@google.com, skhan@linuxfoundation.org

In the following use case, when compiling the kernel for the UML
architecture, for example:

 * `make ARCH=um defconfig && make ARCH=um -j8`,

SUBARCH files are generated, however when we run the command:

 * `mrproper ARCH=um`

the files `arch/$(SUBARCH)/include/generated/ aren't cleaned up.

This generates compilation errors by running the following command:

 * `make ARCH=um defconfig O=./build_um && make ARCH=um -j8 O=./build_um`

This PATCH fix that problem.

This makes it possible to compile on different architectures that use the
SUBARCH variable, in different build directories and root directory of the
linux directory. This is important because we can compile without the object
files being overwritten. This reduces the re-compilation time in this use case.

Besides that, in the workflow of developing unit tests, using kunit, and
compiling in different architectures to develop or test a PATCH, this use case
applies.

 * This bug was introduced in this commit a788b2ed81abe

 * Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Tested-by: Brendan Higgins <brendanhiggins@google.com>
---
v2:
 * Explains what this PATCH does and the importance as suggested
   by Brendan Higgins.
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 70def4907036..e1a79796032e 100644
--- a/Makefile
+++ b/Makefile
@@ -532,7 +532,8 @@ outputmakefile:
 ifdef building_out_of_srctree
 	$(Q)if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
-		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
+		 -d $(srctree)/arch/$(SRCARCH)/include/generated -o \
+		 -d $(srctree)/arch/$(SUBARCH)/include/generated ]; then \
 		echo >&2 "***"; \
 		echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
 		echo >&2 "*** in $(abs_srctree)";\
@@ -1388,6 +1389,7 @@ CLEAN_FILES += modules.builtin modules.builtin.modinfo modules.nsdeps
 # Directories & files removed with 'make mrproper'
 MRPROPER_DIRS  += include/config include/generated          \
 		  arch/$(SRCARCH)/include/generated .tmp_objdiff \
+		  arch/$(SUBARCH)/include/generated \
 		  debian/ snap/ tar-install/
 MRPROPER_FILES += .config .config.old .version \
 		  Module.symvers \
-- 
2.25.1
