Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39169 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgFAF5x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:57:53 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 04/37] kbuild: merge net-y and virt-y into drivers-y
Date: Mon,  1 Jun 2020 14:56:58 +0900
Message-Id: <20200601055731.3006266-4-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

This will slightly change the link order; drivers-y from arch Makefile
will be linked after virt/built-in.a, but I guess this is not a big
deal.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index f9c37045cf64..c0c086d06753 100644
--- a/Makefile
+++ b/Makefile
@@ -646,9 +646,8 @@ ifeq ($(KBUILD_EXTMOD),)
 core-y		:= init/ usr/
 drivers-y	:= drivers/ sound/
 drivers-$(CONFIG_SAMPLES) += samples/
-net-y		:= net/
+drivers-y	+= net/ virt/
 libs-y		:= lib/
-virt-y		:= virt/
 endif # KBUILD_EXTMOD
 
 # The all: target is the default when no target is given on the
@@ -1061,18 +1060,17 @@ core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-		     $(net-y) $(net-m) $(libs-y) $(libs-m) $(virt-y)))
+		     $(libs-y) $(libs-m)))
 
 vmlinux-alldirs	:= $(sort $(vmlinux-dirs) Documentation \
 		     $(patsubst %/,%,$(filter %/, $(core-) \
-			$(drivers-) $(net-) $(libs-) $(virt-))))
+			$(drivers-) $(libs-))))
 
 build-dirs	:= $(vmlinux-dirs)
 clean-dirs	:= $(vmlinux-alldirs)
 
 core-y		:= $(patsubst %/, %/built-in.a, $(core-y))
 drivers-y	:= $(patsubst %/, %/built-in.a, $(drivers-y))
-net-y		:= $(patsubst %/, %/built-in.a, $(net-y))
 libs-y2		:= $(patsubst %/, %/built-in.a, $(filter %/, $(libs-y)))
 ifdef CONFIG_MODULES
 libs-y1		:= $(filter-out %/, $(libs-y))
@@ -1080,11 +1078,9 @@ libs-y2		+= $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
 else
 libs-y1		:= $(patsubst %/, %/lib.a, $(libs-y))
 endif
-virt-y		:= $(patsubst %/, %/built-in.a, $(virt-y))
 
 # Externally visible symbols (used by link-vmlinux.sh)
-export KBUILD_VMLINUX_OBJS := $(head-y) $(core-y) $(libs-y2) \
-			      $(drivers-y) $(net-y) $(virt-y)
+export KBUILD_VMLINUX_OBJS := $(head-y) $(core-y) $(libs-y2) $(drivers-y)
 export KBUILD_VMLINUX_LIBS := $(libs-y1)
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 export LDFLAGS_vmlinux
-- 
2.25.1
