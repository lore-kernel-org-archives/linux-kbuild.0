Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:17158 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727327AbfD0Ddv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Apr 2019 23:33:51 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/5] kbuild: move Documentation to vmlinux-alldirs
Date: Sat, 27 Apr 2019 12:33:37 +0900
Message-Id: <1556336020-15634-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1556336020-15634-1-git-send-email-yamada.masahiro@socionext.com>
References: <1556336020-15634-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

A minor code cleanup.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 251ded5..334ef8a 100644
--- a/Makefile
+++ b/Makefile
@@ -988,8 +988,9 @@ vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
 		     $(net-y) $(net-m) $(libs-y) $(libs-m) $(virt-y)))
 
-vmlinux-alldirs	:= $(sort $(vmlinux-dirs) $(patsubst %/,%,$(filter %/, \
-		     $(init-) $(core-) $(drivers-) $(net-) $(libs-) $(virt-))))
+vmlinux-alldirs	:= $(sort $(vmlinux-dirs) Documentation \
+		     $(patsubst %/,%,$(filter %/, $(init-) $(core-) \
+			$(drivers-) $(net-) $(libs-) $(virt-))))
 
 init-y		:= $(patsubst %/, %/built-in.a, $(init-y))
 core-y		:= $(patsubst %/, %/built-in.a, $(core-y))
@@ -1006,7 +1007,7 @@ export KBUILD_VMLINUX_LIBS := $(libs-y1)
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 export LDFLAGS_vmlinux
 # used by scripts/package/Makefile
-export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) arch Documentation include scripts tools)
+export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) arch include scripts tools)
 
 vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)
 
@@ -1360,7 +1361,7 @@ MRPROPER_FILES += .config .config.old .version \
 #
 clean: rm-dirs  := $(CLEAN_DIRS)
 clean: rm-files := $(CLEAN_FILES)
-clean-dirs      := $(addprefix _clean_, . $(vmlinux-alldirs) Documentation)
+clean-dirs      := $(addprefix _clean_, . $(vmlinux-alldirs))
 
 PHONY += $(clean-dirs) clean archclean vmlinuxclean
 $(clean-dirs):
-- 
2.7.4
