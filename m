Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:36832 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPyS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:54:18 -0400
Received: by mail-gx0-f174.google.com with SMTP id 23so1555729gxk.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:54:17 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 15/15] kbuild: migrate all arch to the kconfig mainmenu upgrade
Date: Sat, 11 Sep 2010 11:51:22 -0400
Message-Id: <1284220282-3500-16-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 Kconfig                  |   11 +++++++++++
 arch/alpha/Kconfig       |    4 ----
 arch/arm/Kconfig         |    7 -------
 arch/avr32/Kconfig       |    7 -------
 arch/blackfin/Kconfig    |    7 -------
 arch/cris/Kconfig        |    7 -------
 arch/frv/Kconfig         |    6 ------
 arch/h8300/Kconfig       |    7 -------
 arch/ia64/Kconfig        |    7 -------
 arch/m32r/Kconfig        |    7 -------
 arch/m68k/Kconfig        |    6 ------
 arch/m68knommu/Kconfig   |    7 -------
 arch/microblaze/Kconfig  |    5 -----
 arch/mips/Kconfig        |    2 --
 arch/mn10300/Kconfig     |    9 ---------
 arch/parisc/Kconfig      |    7 -------
 arch/powerpc/Kconfig     |    6 ------
 arch/s390/Kconfig        |    7 -------
 arch/score/Kconfig       |    5 -----
 arch/sh/Kconfig          |    7 -------
 arch/sparc/Kconfig       |    6 ------
 arch/tile/Kconfig        |    2 --
 arch/um/Kconfig.common   |    2 --
 arch/x86/Kconfig         |    3 ---
 arch/xtensa/Kconfig      |    5 -----
 scripts/kconfig/Makefile |    2 +-
 26 files changed, 12 insertions(+), 139 deletions(-)
 create mode 100644 Kconfig

diff --git a/Kconfig b/Kconfig
new file mode 100644
index 0000000..c13f48d
--- /dev/null
+++ b/Kconfig
@@ -0,0 +1,11 @@
+#
+# For a description of the syntax of this configuration file,
+# see Documentation/kbuild/kconfig-language.txt.
+#
+mainmenu "Linux/$ARCH $KERNELVERSION Kernel Configuration"
+
+config SRCARCH
+	string
+	option env="SRCARCH"
+
+source "arch/$SRCARCH/Kconfig"
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index b9647bb..f706a88 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -1,7 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
 config ALPHA
 	bool
 	default y
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9295110..26ad598 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1,10 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
-
-mainmenu "Linux Kernel Configuration"
-
 config ARM
 	bool
 	default y
diff --git a/arch/avr32/Kconfig b/arch/avr32/Kconfig
index f515727..1b5d36a 100644
--- a/arch/avr32/Kconfig
+++ b/arch/avr32/Kconfig
@@ -1,10 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
-
-mainmenu "Linux Kernel Configuration"
-
 config AVR32
 	def_bool y
 	# With EMBEDDED=n, we get lots of stuff automatically selected
diff --git a/arch/blackfin/Kconfig b/arch/blackfin/Kconfig
index 5a3152b..45f5186 100644
--- a/arch/blackfin/Kconfig
+++ b/arch/blackfin/Kconfig
@@ -1,10 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
-
-mainmenu "Blackfin Kernel Configuration"
-
 config SYMBOL_PREFIX
 	string
 	default "_"
diff --git a/arch/cris/Kconfig b/arch/cris/Kconfig
index aefe3b1..613e628 100644
--- a/arch/cris/Kconfig
+++ b/arch/cris/Kconfig
@@ -1,10 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see the Configure script.
-#
-
-mainmenu "Linux/CRIS Kernel Configuration"
-
 config MMU
 	bool
 	default y
diff --git a/arch/frv/Kconfig b/arch/frv/Kconfig
index 16399bd..a57951f 100644
--- a/arch/frv/Kconfig
+++ b/arch/frv/Kconfig
@@ -1,7 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
 config FRV
 	bool
 	default y
@@ -60,8 +56,6 @@ config HZ
 	int
 	default 1000
 
-mainmenu "Fujitsu FR-V Kernel Configuration"
-
 source "init/Kconfig"
 
 source "kernel/Kconfig.freezer"
diff --git a/arch/h8300/Kconfig b/arch/h8300/Kconfig
index 988b6ff..65f897d8 100644
--- a/arch/h8300/Kconfig
+++ b/arch/h8300/Kconfig
@@ -1,10 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
-
-mainmenu "uClinux/h8300 (w/o MMU) Kernel Configuration"
-
 config H8300
 	bool
 	default y
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index ba22849..464ba66 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -1,10 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
-
-mainmenu "IA-64 Linux Kernel Configuration"
-
 source "init/Kconfig"
 
 source "kernel/Kconfig.freezer"
diff --git a/arch/m32r/Kconfig b/arch/m32r/Kconfig
index 836abbb..3ffb886 100644
--- a/arch/m32r/Kconfig
+++ b/arch/m32r/Kconfig
@@ -1,10 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
-
-mainmenu "Linux/M32R Kernel Configuration"
-
 config M32R
 	bool
 	default y
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 8030e24..723f8f5 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -1,7 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
 config M68K
 	bool
 	default y
@@ -62,8 +58,6 @@ config HZ
 config ARCH_USES_GETTIMEOFFSET
 	def_bool y
 
-mainmenu "Linux/68k Kernel Configuration"
-
 source "init/Kconfig"
 
 source "kernel/Kconfig.freezer"
diff --git a/arch/m68knommu/Kconfig b/arch/m68knommu/Kconfig
index 2609c39..8c062df 100644
--- a/arch/m68knommu/Kconfig
+++ b/arch/m68knommu/Kconfig
@@ -1,10 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
-
-mainmenu "uClinux/68k (w/o MMU) Kernel Configuration"
-
 config M68K
 	bool
 	default y
diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index 692fdfc..44b4b76 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -1,8 +1,3 @@
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-
-mainmenu "Linux/Microblaze Kernel Configuration"
-
 config MICROBLAZE
 	def_bool y
 	select HAVE_MEMBLOCK
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3ad59dd..9f61741 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -14,8 +14,6 @@ config MIPS
 	select HAVE_KRETPROBES
 	select RTC_LIB if !MACH_LOONGSON
 
-mainmenu "Linux/MIPS Kernel Configuration"
-
 menu "Machine selection"
 
 config ZONE_DMA
diff --git a/arch/mn10300/Kconfig b/arch/mn10300/Kconfig
index 444b9f9..ba8bd66 100644
--- a/arch/mn10300/Kconfig
+++ b/arch/mn10300/Kconfig
@@ -1,10 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
-
-mainmenu "Linux Kernel Configuration"
-
 config MN10300
 	def_bool y
 	select HAVE_OPROFILE
@@ -66,8 +59,6 @@ config HZ
 	int
 	default 1000
 
-mainmenu "Matsushita MN10300/AM33 Kernel Configuration"
-
 source "init/Kconfig"
 
 source "kernel/Kconfig.freezer"
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 907417d..33c0214 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -1,10 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
-
-mainmenu "Linux/PA-RISC Kernel Configuration"
-
 config PARISC
 	def_bool y
 	select HAVE_IDE
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 631e5a0..209557c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1,9 +1,3 @@
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
-
-mainmenu "Linux/PowerPC Kernel Configuration"
-
 source "arch/powerpc/platforms/Kconfig.cputype"
 
 config PPC32
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index f0777a4..147d3b5 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -1,8 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
-
 config SCHED_MC
 	def_bool y
 	depends on SMP
@@ -75,8 +70,6 @@ config VIRT_CPU_ACCOUNTING
 config ARCH_SUPPORTS_DEBUG_PAGEALLOC
 	def_bool y
 
-mainmenu "Linux Kernel Configuration"
-
 config S390
 	def_bool y
 	select USE_GENERIC_SMP_HELPERS if SMP
diff --git a/arch/score/Kconfig b/arch/score/Kconfig
index be4a155..4293fdcb 100644
--- a/arch/score/Kconfig
+++ b/arch/score/Kconfig
@@ -1,8 +1,3 @@
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-
-mainmenu "Linux/SCORE Kernel Configuration"
-
 menu "Machine selection"
 
 choice
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 33990fa..3689c04 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -1,10 +1,3 @@
-#
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
-
-mainmenu "Linux/SuperH Kernel Configuration"
-
 config SUPERH
 	def_bool y
 	select EMBEDDED
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 491e9d6..093a6d3 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -1,9 +1,3 @@
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-#
-
-mainmenu "Linux/SPARC Kernel Configuration"
-
 config 64BIT
 	bool "64-bit kernel" if ARCH = "sparc"
 	default ARCH = "sparc64"
diff --git a/arch/tile/Kconfig b/arch/tile/Kconfig
index 1eb308c..d0cc5b4 100644
--- a/arch/tile/Kconfig
+++ b/arch/tile/Kconfig
@@ -113,8 +113,6 @@ config TILE
 #       config HUGETLB_PAGE_SIZE_VARIABLE
 
 
-mainmenu "Linux/TILE Kernel Configuration"
-
 # Please note: TILE-Gx support is not yet finalized; this is
 # the preliminary support.  TILE-Gx drivers are only provided
 # with the alpha or beta test versions for Tilera customers.
diff --git a/arch/um/Kconfig.common b/arch/um/Kconfig.common
index 7c8e277..049d048 100644
--- a/arch/um/Kconfig.common
+++ b/arch/um/Kconfig.common
@@ -19,8 +19,6 @@ config MMU
 config NO_IOMEM
 	def_bool y
 
-mainmenu "Linux/Usermode Kernel Configuration"
-
 config ISA
 	bool
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index a84fc34..4742ddf 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1,6 +1,3 @@
-# x86 configuration
-mainmenu "Linux Kernel Configuration for x86"
-
 # Select 32 or 64 bit
 config 64BIT
 	bool "64-bit kernel" if ARCH = "x86"
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 0859bfd..d373d15 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -1,8 +1,3 @@
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.txt.
-
-mainmenu "Linux/Xtensa Kernel Configuration"
-
 config FRAME_POINTER
 	def_bool n
 
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index cef3f75..52c34b9 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -8,7 +8,7 @@ PHONY += oldconfig xconfig gconfig menuconfig config silentoldconfig update-po-c
 ifdef KBUILD_KCONFIG
 Kconfig := $(KBUILD_KCONFIG)
 else
-Kconfig := arch/$(SRCARCH)/Kconfig
+Kconfig := Kconfig
 endif
 
 xconfig: $(obj)/qconf
-- 
1.7.2.30.gc37d7.dirty

