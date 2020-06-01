Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39161 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgFAF5x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:57:53 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 03/37] kbuild: merge init-y into core-y
Date: Mon,  1 Jun 2020 14:56:57 +0900
Message-Id: <20200601055731.3006266-3-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

No arch Makefile specifies init-y.

Merge init-y into core-y. This does not change the link order.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 44921d9cf3cf..f9c37045cf64 100644
--- a/Makefile
+++ b/Makefile
@@ -643,12 +643,11 @@ endif
 
 ifeq ($(KBUILD_EXTMOD),)
 # Objects we will link into vmlinux / subdirs we need to visit
-init-y		:= init/
+core-y		:= init/ usr/
 drivers-y	:= drivers/ sound/
 drivers-$(CONFIG_SAMPLES) += samples/
 net-y		:= net/
 libs-y		:= lib/
-core-y		:= usr/
 virt-y		:= virt/
 endif # KBUILD_EXTMOD
 
@@ -1060,18 +1059,17 @@ export MODULES_NSDEPS := $(extmod-prefix)modules.nsdeps
 ifeq ($(KBUILD_EXTMOD),)
 core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
 
-vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
+vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
 		     $(net-y) $(net-m) $(libs-y) $(libs-m) $(virt-y)))
 
 vmlinux-alldirs	:= $(sort $(vmlinux-dirs) Documentation \
-		     $(patsubst %/,%,$(filter %/, $(init-) $(core-) \
+		     $(patsubst %/,%,$(filter %/, $(core-) \
 			$(drivers-) $(net-) $(libs-) $(virt-))))
 
 build-dirs	:= $(vmlinux-dirs)
 clean-dirs	:= $(vmlinux-alldirs)
 
-init-y		:= $(patsubst %/, %/built-in.a, $(init-y))
 core-y		:= $(patsubst %/, %/built-in.a, $(core-y))
 drivers-y	:= $(patsubst %/, %/built-in.a, $(drivers-y))
 net-y		:= $(patsubst %/, %/built-in.a, $(net-y))
@@ -1085,7 +1083,7 @@ endif
 virt-y		:= $(patsubst %/, %/built-in.a, $(virt-y))
 
 # Externally visible symbols (used by link-vmlinux.sh)
-export KBUILD_VMLINUX_OBJS := $(head-y) $(init-y) $(core-y) $(libs-y2) \
+export KBUILD_VMLINUX_OBJS := $(head-y) $(core-y) $(libs-y2) \
 			      $(drivers-y) $(net-y) $(virt-y)
 export KBUILD_VMLINUX_LIBS := $(libs-y1)
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
-- 
2.25.1
