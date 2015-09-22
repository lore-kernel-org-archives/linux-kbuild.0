Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:39980 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757711AbbIVMhf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 08:37:35 -0400
From: Feng Wu <feng.wu@intel.com>
Subject: [PATCH v2] Add virt directory to the top Makefile
Date: Tue, 22 Sep 2015 20:23:34 +0800
Message-Id: <1442924614-16833-1-git-send-email-feng.wu@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: pbonzini@redhat.com, alex.williamson@redhat.com, mmarek@suse.com
Cc: eric.auger@linaro.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Feng Wu <feng.wu@intel.com>

We need to build files in virt/lib/, so add virt directory to
the top Makefile.

Signed-off-by: Feng Wu <feng.wu@intel.com>
---
v2:
- Remove the explicit 'virt' entry in the KBUILD_ALLDIRS assignment
- Remove './' in virt/Makefile

 Makefile              | 10 ++++++----
 arch/x86/kvm/Makefile |  3 ---
 virt/Makefile         |  1 +
 3 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 virt/Makefile

diff --git a/Makefile b/Makefile
index 35b4c19..0e60876 100644
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
@@ -902,14 +903,15 @@ net-y		:= $(patsubst %/, %/built-in.o, $(net-y))
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
-export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) arch Documentation include samples scripts tools virt)
+export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) arch Documentation include samples scripts tools)
 
 vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_INIT) $(KBUILD_VMLINUX_MAIN)
 
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
index 0000000..be78347
--- /dev/null
+++ b/virt/Makefile
@@ -0,0 +1 @@
+obj-y	+= lib/
-- 
2.1.0

