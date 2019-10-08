Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:28283 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730683AbfJHMGm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Oct 2019 08:06:42 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/5] kheaders: remove the last bashism to allow sh to run it
Date: Tue,  8 Oct 2019 21:05:55 +0900
Message-Id: <20191008120556.4263-4-yamada.masahiro@socionext.com>
In-Reply-To: <20191008120556.4263-1-yamada.masahiro@socionext.com>
References: <20191008120556.4263-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>, Joel Fernandes <joel@joelfernandes.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

'pushd' ... 'popd' is the last bash-specific code in this script.
One way to avoid it is to run the code in a sub-shell.

With that addressed, you can run this script with sh.

I replaced $(BASH) with $(CONFIG_SHELL), and I changed the hashbang
to #!/bin/sh.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 kernel/Makefile        |  2 +-
 kernel/gen_kheaders.sh | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/kernel/Makefile b/kernel/Makefile
index daad787fb795..42557f251fea 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -128,7 +128,7 @@ $(obj)/config_data.gz: $(KCONFIG_CONFIG) FORCE
 $(obj)/kheaders.o: $(obj)/kheaders_data.tar.xz
 
 quiet_cmd_genikh = CHK     $(obj)/kheaders_data.tar.xz
-      cmd_genikh = $(BASH) $(srctree)/kernel/gen_kheaders.sh $@
+      cmd_genikh = $(CONFIG_SHELL) $(srctree)/kernel/gen_kheaders.sh $@
 $(obj)/kheaders_data.tar.xz: FORCE
 	$(call cmd,genikh)
 
diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index dd40a1b86f96..6c5f88f3ca2d 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 
 # This script generates an archive consisting of kernel headers
@@ -57,11 +57,12 @@ rm -rf $cpio_dir
 mkdir $cpio_dir
 
 if [ "$building_out_of_srctree" ]; then
-	pushd $srctree > /dev/null
-	for f in $dir_list
-		do find "$f" -name "*.h";
-	done | cpio --quiet -pd $cpio_dir
-	popd > /dev/null
+	(
+		cd $srctree
+		for f in $dir_list
+			do find "$f" -name "*.h";
+		done | cpio --quiet -pd $cpio_dir
+	)
 fi
 
 # The second CPIO can complain if files already exist which can happen with out
-- 
2.17.1
