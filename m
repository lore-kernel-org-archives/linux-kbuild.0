Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:48638 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfGFDIF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Jul 2019 23:08:05 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] kbuild: remove obj and src from the top Makefile
Date: Sat,  6 Jul 2019 12:07:11 +0900
Message-Id: <20190706030713.6221-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

$(obj) is not used in the top Makefile at all. $(src) is used in
3 sites, but they can be replaced with $(srctree).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 014390e32b0e..a5615edf2196 100644
--- a/Makefile
+++ b/Makefile
@@ -248,9 +248,6 @@ endif
 export KBUILD_CHECKSRC KBUILD_EXTMOD KBUILD_SRC
 
 objtree		:= .
-src		:= $(srctree)
-obj		:= $(objtree)
-
 VPATH		:= $(srctree)
 
 export srctree objtree VPATH
@@ -1705,7 +1702,7 @@ CHECKSTACK_ARCH := $(ARCH)
 endif
 checkstack:
 	$(OBJDUMP) -d vmlinux $$(find . -name '*.ko') | \
-	$(PERL) $(src)/scripts/checkstack.pl $(CHECKSTACK_ARCH)
+	$(PERL) $(srctree)/scripts/checkstack.pl $(CHECKSTACK_ARCH)
 
 kernelrelease:
 	@echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
@@ -1724,11 +1721,11 @@ endif
 
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/
 
 tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/ $*
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ $*
 
 # Single targets
 # ---------------------------------------------------------------------------
-- 
2.17.1
