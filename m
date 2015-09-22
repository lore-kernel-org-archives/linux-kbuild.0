Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:14965 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753532AbbIVJBb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 05:01:31 -0400
From: Feng Wu <feng.wu@intel.com>
Subject: [PATCH] Add virt directory to the top Makefile
Date: Tue, 22 Sep 2015 16:47:29 +0800
Message-Id: <1442911649-149474-1-git-send-email-feng.wu@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: pbonzini@redhat.com, alex.williamson@redhat.com, mmarek@suse.com
Cc: eric.auger@linaro.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Feng Wu <feng.wu@intel.com>

We need to build files in virt/lib/, which are now used by
KVM and VFIO, so add virt directory to the top Makefile.

Signed-off-by: Feng Wu <feng.wu@intel.com>
---
 Makefile              | 8 +++++---
 arch/x86/kvm/Makefile | 3 ---
 virt/Makefile         | 1 +
 3 files changed, 6 insertions(+), 6 deletions(-)
 create mode 100644 virt/Makefile

diff --git a/Makefile b/Makefile
index 35b4c19..d82fceb 100644
--- a/Makefile
+++ b/Makefile
@@ -550,6 +550,7 @@ drivers-y	:= drivers/ sound/ firmware/
 net-y		:= net/
 libs-y		:= lib/
 core-y		:= usr/
+virt-y		:= virt/
 endif # KBUILD_EXTMOD
 
 ifeq ($(dot-config),1)
@@ -890,10 +891,10 @@ core-y		+= kernel/ mm/ fs/ ipc/ security/ crypto/ block/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-		     $(net-y) $(net-m) $(libs-y) $(libs-m)))
+		     $(net-y) $(net-m) $(libs-y) $(libs-m) $(virt-y)))
 
 vmlinux-alldirs	:= $(sort $(vmlinux-dirs) $(patsubst %/,%,$(filter %/, \
-		     $(init-) $(core-) $(drivers-) $(net-) $(libs-))))
+		     $(init-) $(core-) $(drivers-) $(net-) $(libs-) $(virt-))))
 
 init-y		:= $(patsubst %/, %/built-in.o, $(init-y))
 core-y		:= $(patsubst %/, %/built-in.o, $(core-y))
@@ -902,10 +903,11 @@ net-y		:= $(patsubst %/, %/built-in.o, $(net-y))
 libs-y1		:= $(patsubst %/, %/lib.a, $(libs-y))
 libs-y2		:= $(patsubst %/, %/built-in.o, $(libs-y))
 libs-y		:= $(libs-y1) $(libs-y2)
+virt-y		:= $(patsubst %/, %/built-in.o, $(virt-y))
 
 # Externally visible symbols (used by link-vmlinux.sh)
 export KBUILD_VMLINUX_INIT := $(head-y) $(init-y)
-export KBUILD_VMLINUX_MAIN := $(core-y) $(libs-y) $(drivers-y) $(net-y)
+export KBUILD_VMLINUX_MAIN := $(core-y) $(libs-y) $(drivers-y) $(net-y) $(virt-y)
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 export LDFLAGS_vmlinux
 # used by scripts/pacmage/Makefile
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index 05cc2d7..67d215c 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -6,9 +6,6 @@ CFLAGS_svm.o := -I.
 CFLAGS_vmx.o := -I.
 
 KVM := ../../../virt/kvm
-LIB := ../../../virt/lib
-
-obj-$(CONFIG_IRQ_BYPASS_MANAGER)	+= $(LIB)/
 
 kvm-y			+= $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o \
 				$(KVM)/eventfd.o $(KVM)/irqchip.o $(KVM)/vfio.o
diff --git a/virt/Makefile b/virt/Makefile
new file mode 100644
index 0000000..335dc0b
--- /dev/null
+++ b/virt/Makefile
@@ -0,0 +1 @@
+obj-y	+= ./lib/
-- 
2.1.0

