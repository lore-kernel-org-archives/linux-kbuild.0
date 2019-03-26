Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:56907 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfCZE1Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Mar 2019 00:27:24 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: do not overwrite .gitignore in output directory
Date: Tue, 26 Mar 2019 13:26:58 +0900
Message-Id: <1553574418-21033-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>, Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Commit 3a51ff344204 ("kbuild: gitignore output directory") seemed to
bother people who version-control output directories.

Andre Przywara says:
"Unfortunately this breaks my setup, because I keep a totally separate
git repository in my build directories to track (various versions of)
.config. So .gitignore there is carefully crafted to ignore most build
artefacts, but not .config, for instance."

Link: https://lkml.org/lkml/2019/3/22/1819
Reported-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5fe5431..70fc778 100644
--- a/Makefile
+++ b/Makefile
@@ -499,7 +499,8 @@ outputmakefile:
 ifneq ($(KBUILD_SRC),)
 	$(Q)ln -fsn $(srctree) source
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile $(srctree)
-	$(Q){ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
+	$(Q)test -e .gitignore || \
+	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
 endif
 
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
-- 
2.7.4
