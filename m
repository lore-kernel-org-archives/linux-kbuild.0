Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:44278 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750856AbbCKN72 convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:4:1>);
	Wed, 11 Mar 2015 09:59:28 -0400
Message-Id: <5500584D02000078000688F5@mail.emea.novell.com>
Date: Wed, 11 Mar 2015 13:59:25 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] Kconfig: drop bogus default values
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Default "no" is pretty pointless for options without (visible) prompts:
They only clutter .config-s with "# CONFIG_... is not set" and thus
prevent users of "make oldconfig", when the option obtains a prompt or
its prompt becomes visible, noticing that these may now be enabled.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 arch/Kconfig   |    7 ++++---
 init/Kconfig   |   10 ++++------
 lib/Kconfig    |    3 +--
 lib/xz/Kconfig |    1 -
 4 files changed, 9 insertions(+), 12 deletions(-)

--- 4.0-rc3/arch/Kconfig
+++ 4.0-rc3-Kconfig-cleanup/arch/Kconfig
@@ -86,7 +86,7 @@ config KPROBES_ON_FTRACE
 	 optimize on top of function tracing.
 
 config UPROBES
-	def_bool n
+	bool
 	select PERCPU_RWSEM
 	help
 	  Uprobes is the user-space counterpart to kprobes: they
@@ -100,7 +100,8 @@ config UPROBES
 	    application. )
 
 config HAVE_64BIT_ALIGNED_ACCESS
-	def_bool 64BIT && !HAVE_EFFICIENT_UNALIGNED_ACCESS
+	bool
+	default y if 64BIT && !HAVE_EFFICIENT_UNALIGNED_ACCESS
 	help
 	  Some architectures require 64 bit accesses to be 64 bit
 	  aligned, which also requires structs containing 64 bit values
@@ -352,7 +353,7 @@ config HAVE_CC_STACKPROTECTOR
 	  - it has implemented a stack canary (e.g. __stack_chk_guard)
 
 config CC_STACKPROTECTOR
-	def_bool n
+	bool
 	help
 	  Set when a stack-protector mode is enabled, so that the build
 	  can enable kernel-side support for the GCC feature.
--- 4.0-rc3/init/Kconfig
+++ 4.0-rc3-Kconfig-cleanup/init/Kconfig
@@ -518,7 +518,8 @@ config TASKS_RCU
 	  If unsure, say N.
 
 config RCU_STALL_COMMON
-	def_bool ( TREE_RCU || PREEMPT_RCU || RCU_TRACE )
+	def_bool y
+	depends on TREE_RCU || PREEMPT_RCU || RCU_TRACE
 	help
 	  This option enables RCU CPU stall code that is common between
 	  the TINY and TREE variants of RCU.  The purpose is to allow
@@ -652,7 +653,8 @@ config RCU_FAST_NO_HZ
 	  Say N if you are unsure.
 
 config TREE_RCU_TRACE
-	def_bool RCU_TRACE && ( TREE_RCU || PREEMPT_RCU )
+	def_bool y
+	depends on RCU_TRACE && (TREE_RCU || PREEMPT_RCU)
 	select DEBUG_FS
 	help
 	  This option provides tracing for the TREE_RCU and
@@ -795,7 +797,6 @@ endmenu # "RCU Subsystem"
 
 config BUILD_BIN2C
 	bool
-	default n
 
 config IKCONFIG
 	tristate "Kernel .config support"
@@ -1136,7 +1137,6 @@ endif # CGROUPS
 
 config CHECKPOINT_RESTORE
 	bool "Checkpoint/restore support" if EXPERT
-	default n
 	help
 	  Enables additional kernel features in a sake of checkpoint/restore.
 	  In particular it adds auxiliary prctl codes to setup process text,
@@ -1371,7 +1371,6 @@ config SYSFS_SYSCALL
 config SYSCTL_SYSCALL
 	bool "Sysctl syscall support" if EXPERT
 	depends on PROC_SYSCTL
-	default n
 	select SYSCTL
 	---help---
 	  sys_sysctl uses binary paths that have been found challenging
@@ -1753,7 +1752,6 @@ endmenu		# General setup
 
 config HAVE_GENERIC_DMA_COHERENT
 	bool
-	default n
 
 config SLABINFO
 	bool
--- 4.0-rc3/lib/Kconfig
+++ 4.0-rc3-Kconfig-cleanup/lib/Kconfig
@@ -3,7 +3,7 @@
 #
 
 config BINARY_PRINTF
-	def_bool n
+	bool
 
 menu "Library routines"
 
@@ -49,7 +49,6 @@ config GENERIC_IOMAP
 
 config GENERIC_IO
 	bool
-	default n
 
 config STMP_DEVICE
 	bool
--- 4.0-rc3/lib/xz/Kconfig
+++ 4.0-rc3-Kconfig-cleanup/lib/xz/Kconfig
@@ -42,7 +42,6 @@ endif
 
 config XZ_DEC_BCJ
 	bool
-	default n
 
 config XZ_DEC_TEST
 	tristate "XZ decompressor tester"



